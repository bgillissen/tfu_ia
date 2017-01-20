TCB_AIS_PATH = "feats\revive\ais\";

// by psycho
// AIS INJURY Setup-File Version 21022016

tcb_ais_realistic_mode 			= 	[false, true] select (["revive", "ais", "realistic"] call core_fnc_getSetting);
tcb_ais_medical_education 		= 	["revive", "ais", "education"] call core_fnc_getSetting;
tcb_ais_pvpMode 				= 	false;
tcb_ais_rambofactor 			= 	["revive", "ais", "resistance"] call core_fnc_getSetting;
tcb_ais_random_lifetime_factor 	= 	900;
tcb_ais_allways_walk 			= 	false;
tcb_ais_delTime 				= 	0;
tcb_ais_toggleTFAR 				= 	[false, true] select (["revive", "ais", "noTFAR"] call core_fnc_getSetting);
tcb_ais_noChat 					= 	[false, true] select (["revive", "ais", "noChat"] call core_fnc_getSetting);
tcb_ais_show_injury_marker 		=	[false, true] select (["revive", "ais", "mapMarker"] call core_fnc_getSetting);
tcb_ais_show_3d_icons 			=	[false, true] select (["revive", "ais", "3dIcons"] call core_fnc_getSetting);
tcb_ais_dead_dialog 			= 	true; 			// Set to true to enable the deadcam and the dead dialog.
tcb_ais_bloodParticle 			= 	[false, true] select (["revive", "ais", "blood"] call core_fnc_getSetting);
tcb_ais_impactEffects 			= 	[false, true] select (["revive", "ais", "impact"] call core_fnc_getSetting);
tcb_ais_showCountdown 			= 	[false, true] select (["revive", "ais", "showTimer"] call core_fnc_getSetting);
tcb_ais_showDiaryInfo 			= 	true;// If set to true, a diary entry with some informations about the AIS (Credits, features, How to) is added.
	
diag_log "TCB_AIS INIT";
{
	diag_log format["TCB_AIS INIT for unit %1", _x];	
	[_x] call compile preprocessFile (TCB_AIS_PATH+"init_ais.sqf")
} forEach (if (isMultiplayer) then {playableUnits} else {switchableUnits});