
if ( MOD_ace ) exitWith {};

reviveBleedStack = [];
publicVariable "reviveBleedStack";

if ( isNil "reviveScorePVEH" ) then {
	reviveScorePVEH = "reviveScore" addPublicVariableEventHandler {
		(_this select 1) params["_unit", "_score"];
		_unit addScore _score;
	};
};

if ( isNil "reviveHealEquipmentServer" ) then { 
	reviveHealEquipmentServer = []; 
};

if ( isNil "reviveHealEquipmentPVEH" ) then {
	reviveHealEquipmentPVEH = "reviveHealEquipment" addPublicVariableEventHandler {
		reviveHealEquipmentServer append (_this select 1);
	};
};

if ( isNil "reviveHealEquipmentThread" ) then {
	reviveHealEquipmentThread = [] spawn { 
		private _delay = ["cleanup", "loopDelay"] call core_fnc_getSetting;
		while {true} do { 
			//sleep _delay;
			sleep 30;
			call revive_fnc_removeHealEquipment; 
		}; 
	};
};