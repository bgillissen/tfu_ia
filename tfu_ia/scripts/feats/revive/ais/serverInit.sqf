
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
tcb_ais_bleedStack = [];


{
	publicVariable _x;
} forEach ["tcb_ais_path", 
           "tcb_ais_realistic_mode", 
           "tcb_ais_medical_education", 
           "tcb_ais_rambofactor", 
           "tcb_ais_random_lifetime_factor", 
           "tcb_ais_allways_walk", 
           "tcb_ais_delTime", 
           "tcb_ais_toggleTFAR", 
           "tcb_ais_noChat", 
           "tcb_ais_show_3d_icons", 
           "tcb_ais_dead_dialog", 
           "tcb_ais_bloodParticle", 
           "tcb_ais_impactEffects", 
           "tcb_ais_showCountdown", 
           "tcb_ais_respawndelay", 
           "tcb_ais_bleedStack"];

if ( isNil "tcb_scorePVEH" ) then {
	tcb_scorePVEH = "tcb_score" addPublicVariableEventHandler {
		(_this select 1) params["_unit", "_score"];
		_unit addScore _score;
	};
};