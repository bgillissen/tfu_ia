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

BASE_REF = [BASE_COMP, [], [0,0,0], 0, false, false] call comp_fnc_spawn;

BA_npc = [];
BA_obj = [];
BA_veh = [];

{
	_x params ["_type", "_actions", "_name", "_conf"];
	if ( !(isNil _name) ) then {
		private _thing = missionNamespace getVariable _name;
		if ( _type isEqualTo "obj" ) then { 
			BA_obj append [[_thing, _actions, _conf]];
		} else {
			if ( _type isEqualto "npc" ) then {
				{ _thing disableAI _x; } count ["MOVE", "TARGET", "AUTOTARGET"];
				[_thing, _actions] call baseAtmosphere_fnc_npcLoadout;
				BA_npc append [[_thing, _actions, _conf]];	
			} else {
				if ( _type isEqualto "veh" ) then {
					clearWeaponCargoGlobal _thing;
					clearMagazineCargoGlobal _thing;
					clearItemCargoGlobal _thing;
					clearBackpackCargoGlobal _thing;
					_veh lock 3;
					BA_veh append [[_thing, _actions, _conf]];
				};
			};
		};
#ifdef DEBUG
	} else {
		private _debug = format["baseAtmosphere: missing composition element in '%1', '%2' is not defined!", BASE_COMP, _name]; 
		conRed(_debug);
#endif
	};
} count BA;