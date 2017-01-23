// by psycho

if ( MOD_ace ) exitWith {};

reviveResistance = (["revive", "resistance"] call core_fnc_getSetting);
reviveImpactEffect = [false, true] select (["revive", "impact"] call core_fnc_getSetting);
reviveBloodParticle	= [false, true] select (["revive", "bloodParticle"] call core_fnc_getSetting);
reviveBloodThreshold = ["revive", "bloodThreshold"] call core_fnc_getSetting;

private _hitPoints = getAllHitPointsDamage player;
player setVariable ["hitPoints", (_hitPoints select 2)];
if ( isNil "reviveDamageEH" ) then {
	[] spawn {
		waitUntil {
			private _var = (player getVariable "BIS_fnc_feedback_hitArrayHandler");
			!(isNil "_var") 
		};
		player removeAllEventHandlers "handleDamage";
		reviveDamageEH = player addEventHandler ["HandleDamage", {_this call revive_fnc_handleDamage}];
	};
};

{
	_x execFSM ("feats\revive\fsm\main.fsm");
} forEach ( allPlayers - (entities 'headless_Client_F') );

if ( [false, true] select (["revive", "bloodParticle"] call core_fnc_getSetting) ) then {
	execFSM ("feats\revive\fsm\bloodParticles.fsm");
};


reviveIconDistance = ["revive", "iconDistance"] call core_fnc_getParam;
if ( reviveIconDistance > 0 && ((player getVariable "role") isEqualto "medic") ) then {
	if ( isNil "reviveIconEH" ) then {
		reviveIconEH  = addMissionEventHandler ["Draw3D", {call revive_fnc_drawIcon3D}];
	};
};

if ( isNil "reviveHealEquipment" ) then { 
	reviveHealEquipment = []; 
};
if ( isNil "reviveHealEquipmentThread" ) then {
	reviveHealEquipmentThread = [] spawn { 
		while {true} do { sleep 300;call revive_fnc_removeHealEquipment; } 
	};
};

if !( [false, true] select (["revive", "deadCam"] call core_fnc_getSetting) ) exitWith {};

if ( isNil "tcb_killedEH" ) then {
	tcb_killedEH = player AddEventHandler ["killed",{_this spawn revive_fnc_deadCam}];
};

reviveQuotes = [
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