/*
@filename: feats\baseAtmosphere\serverInit.sqf
Author:
	Ben
Description:
	run on server
 	spawn the active base using LARs,
 	configure base things
*/

#include "..\..\core\debug.hpp"

BASE_NAME = "";

private _baseConf = ( missionConfigFile >> "settings" >> "baseAtmosphere" >> toUpper(worldName) );
private _baseParam = [format["%1_base", toUpper(worldName)]] call core_fnc_getParam;
private _found = false;
{
	if ( _forEachIndex isEqualTo _baseParam ) then {
		BASE_NAME = _x;
		_baseConf = _baseConf >> BASE_NAME;
		_found = true;
	}
} forEach ("true" configClasses _baseConf apply { configName _x });

if !( _found ) exitWith {
	#ifdef DEBUG
	private _debug = format["baseAtmosphere: base settings not found for %1!", _baseParam];
	conRed(_debug);
	#endif
};

private _comp = format["%1_%2", toUpper(worldName), BASE_NAME];

BASE_REF = [_comp, [], [0,0,0], 0, false, false] call comp_fnc_spawn;
SZ_RADIUS = getNumber( missionConfigFile >> "settings" >> "maps" >> toUpper(worldName) >> "bases" >> BASE_NAME >> "safeZone" );
FR_RADIUS = getNumber( missionConfigFile >> "settings" >> "maps" >> toUpper(worldName) >> "bases" >> BASE_NAME >> "firingRange" );
BA_npc = [];
BA_markers = [];
BA_obj = [];
BA_veh = [];

{
	private _actions = "true" configClasses (_x >> "actions");
	{
		private _type = getText(_x >> "type");
		private _name = configName _x;
		if ( _type isEqualTo "marker" ) then {
			_name setMarkerColor (call common_fnc_getMarkerColor);
			BA_markers pushback _name;
		} else {
			if ( _type isEqualTo "veh" ) then {
				private _poolName = getText( _x >> "pool");
				private _pool = missionNamespace getVariable format["BV_%1", _poolName];
				if ( !isNil "_pool" ) then {
					if ( count _pool > 0 ) then {
						private _veh = createVehicle [(selectRandom _pool), (getMarkerPos _name), [], 0, "CAN_COLLIDE"];
						_veh setDir (markerDir _name);
						_veh lock 3;
						_veh allowDamage false;
						clearWeaponCargoGlobal _veh;
						clearMagazineCargoGlobal _veh;
						clearItemCargoGlobal _veh;
						clearBackpackCargoGlobal _veh;
						BA_veh pushback [_veh, _actions];
					#ifdef DEBUG
					} else {
						private _debug = format["baseAtmosphere: pool %1 is empty!", _poolName];
						conRed(_debug);
					#endif	
					};
				#ifdef DEBUG
				} else {
					private _debug = format["baseAtmosphere: pool %1 is nil!", _poolName];
					conRed(_debug);
				#endif				
				};
			} else {
				if ( !(isNil _name) ) then {			
					private _thing = missionNamespace getVariable _name;
					if ( _type isEqualTo "obj" ) then { 
						BA_obj pushback [_thing, _actions];
					} else {
						if ( _type isEqualto "npc" ) then {
							{ _thing disableAI _x; } count ["MOVE", "TARGET", "AUTOTARGET"];
							_thing setVariable ["NOAI", true, true];
							[_thing, getText(_x >> "loadout")] call baseAtmosphere_fnc_npcLoadout;
							BA_npc pushback [_thing, _actions];
						};
					};
				};
			};
		};
	} forEach ("true" configClasses (_x >> "things"));
} forEach ("true" configClasses _baseConf);

publicVariable "BASE_NAME";
publicVariable "SZ_RADIUS";
publicVariable "FR_RADIUS";
publicVariable "BA_npc";
publicVariable "BA_obj";
publicVariable "BA_veh";