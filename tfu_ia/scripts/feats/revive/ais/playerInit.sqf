// by psycho

tcb_ais_path = "feats\revive\ais\";
tcb_ais_realistic_mode 			= [false, true] select (["revive", "ais", "realistic"] call core_fnc_getSetting);
tcb_ais_medical_education 		= ["revive", "ais", "education"] call core_fnc_getSetting;
tcb_ais_rambofactor 			= ["revive", "ais", "resistance"] call core_fnc_getSetting;
tcb_ais_random_lifetime_factor 	= 900;
tcb_ais_allways_walk 			= false;
tcb_ais_delTime 				= 0;
tcb_ais_toggleTFAR 				= [false, true] select (["revive", "ais", "noTFAR"] call core_fnc_getSetting);
tcb_ais_noChat 					= [false, true] select (["revive", "ais", "noChat"] call core_fnc_getSetting);
tcb_ais_show_3d_icons 			= [false, true] select (["revive", "ais", "3dIcons"] call core_fnc_getSetting);
tcb_ais_dead_dialog 			= true;
tcb_ais_bloodParticle 			= [false, true] select (["revive", "ais", "blood"] call core_fnc_getSetting);
tcb_ais_impactEffects 			= [false, true] select (["revive", "ais", "impact"] call core_fnc_getSetting);
tcb_ais_showCountdown 			= [false, true] select (["revive", "ais", "showTimer"] call core_fnc_getSetting);
tcb_ais_respawndelay			= getNumber (missionConfigFile/"respawndelay");

{
	private _fsm = _x execFSM (TCB_AIS_PATH + "fsm\main.fsm");
	_x setVariable ["fsm", _fsm];
} forEach ( allPlayers - (entities 'headless_Client_F') );

if (tcb_ais_bloodParticle) then {
	execFSM (TCB_AIS_PATH + "fsm\bloodParticles.fsm");
};

if ( isNil "tcb_damageEH" ) then {
	[] spawn {
		waitUntil {!isNil {player getVariable "BIS_fnc_feedback_hitArrayHandler"}};
		player removeAllEventHandlers "handleDamage";
		tcb_damageEH = player addEventHandler ["HandleDamage", {_this call tcb_fnc_handleDamage}];
	};
};

if ( tcb_ais_show_3d_icons && ((player getVariable "role") isEqualto "medic") ) then {
	if ( isNil "tcb_drawEH" ) then {
		tcb_drawEH  = addMissionEventHandler ["Draw3D", {call tcb_fnc_drawIcon3D}];
	};
};

if ( tcb_ais_dead_dialog ) then {
	tcb_ais_quotes = [
		[(localize "STR_QUOTE_1"),(localize "STR_AUTHOR_1")],
		[(localize "STR_QUOTE_2"),(localize "STR_AUTHOR_2")],
		[(localize "STR_QUOTE_3"),(localize "STR_AUTHOR_3")],
		[(localize "STR_QUOTE_4"),(localize "STR_AUTHOR_4")],
		[(localize "STR_QUOTE_5"),(localize "STR_AUTHOR_5")],
		[(localize "STR_QUOTE_6"),(localize "STR_AUTHOR_6")],
		[(localize "STR_QUOTE_7"),(localize "STR_AUTHOR_7")],
		[(localize "STR_QUOTE_8"),(localize "STR_AUTHOR_8")],
		[(localize "STR_QUOTE_9"),(localize "STR_AUTHOR_9")],
		[(localize "STR_QUOTE_10"),(localize "STR_AUTHOR_10")],
		[(localize "STR_QUOTE_11"),(localize "STR_AUTHOR_11")],
		[(localize "STR_QUOTE_12"),(localize "STR_AUTHOR_12")],
		[(localize "STR_QUOTE_13"),(localize "STR_AUTHOR_13")],
		[(localize "STR_QUOTE_14"),(localize "STR_AUTHOR_14")],
		[(localize "STR_QUOTE_15"),(localize "STR_AUTHOR_15")],
		[(localize "STR_QUOTE_16"),(localize "STR_AUTHOR_16")],
		[(localize "STR_QUOTE_17"),(localize "STR_AUTHOR_17")],
		[(localize "STR_QUOTE_18"),(localize "STR_AUTHOR_18")],
		[(localize "STR_QUOTE_19"),(localize "STR_AUTHOR_19")],
		[(localize "STR_QUOTE_20"),(localize "STR_AUTHOR_20")],
		[(localize "STR_QUOTE_21"),(localize "STR_AUTHOR_21")],
		[(localize "STR_QUOTE_22"),(localize "STR_AUTHOR_22")],
		[(localize "STR_QUOTE_23"),(localize "STR_AUTHOR_23")],
		[(localize "STR_QUOTE_24"),(localize "STR_AUTHOR_24")],
		[(localize "STR_QUOTE_25"),(localize "STR_AUTHOR_25")],
		[(localize "STR_QUOTE_26"),(localize "STR_AUTHOR_26")],
		[(localize "STR_QUOTE_27"),(localize "STR_AUTHOR_27")],
		[(localize "STR_QUOTE_28"),(localize "STR_AUTHOR_28")],
		[(localize "STR_QUOTE_29"),(localize "STR_AUTHOR_29")],
		[(localize "STR_QUOTE_30"),(localize "STR_AUTHOR_30")],
		[(localize "STR_QUOTE_31"),(localize "STR_AUTHOR_31")],
		[(localize "STR_QUOTE_32"),(localize "STR_AUTHOR_32")],
		[(localize "STR_QUOTE_33"),(localize "STR_AUTHOR_33")],
		[(localize "STR_QUOTE_34"),(localize "STR_AUTHOR_34")],
		[(localize "STR_QUOTE_35"),(localize "STR_AUTHOR_35")],
		[(localize "STR_QUOTE_36"),(localize "STR_AUTHOR_36")],
		[(localize "STR_QUOTE_37"),(localize "STR_AUTHOR_37")],
		[(localize "STR_QUOTE_38"),(localize "STR_AUTHOR_38")],
		[(localize "STR_QUOTE_39"),(localize "STR_AUTHOR_39")],
		[(localize "STR_QUOTE_40"),(localize "STR_AUTHOR_40")],
		[(localize "STR_QUOTE_41"),(localize "STR_AUTHOR_41")],
		[(localize "STR_QUOTE_42"),(localize "STR_AUTHOR_42")],
		[(localize "STR_QUOTE_LAST"),(localize "STR_AUTHOR_LAST")]
	];
	if ( isNil "tcb_killedEH" ) then {
		tcb_killedEH = player AddEventHandler ["killed",{_this spawn tcb_fnc_deadcam}];
	};
};

if ( (player getVariable "role") isEqualTo "medic" ) then {
	if ( isNil "tcb_healEquipment" ) then {
		tcb_healEquipment = [];
	};
	if ( isNil "tcb_healEquipmentThread" ) then {
		tcb_healEquipmentThread = [] spawn { while {true} do { sleep 300;call tcb_fnc_removeHealEquipment; } };
	};
};