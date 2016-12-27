/*
@filename: feats\baseAtmosphere\serverInit.sqf
Author:
	Ben
Description:
	run on server
 	spawn the active base using LARs,
 	configure base things
*/

BASE_REF = [BASE_COMP, [], [0,0,0], 0, false, false] call comp_fnc_spawn;

BA_npc = [];
BA_obj = [];
BA_veh = [];
{
	_x params ["_type", "_actions", "_name", "_flags"];
	_flags params ["_damage", "_simu", "_simple"];
	_flags = nil;
	private _thing = missionNamespace getVariable _name;
	if ( !(_thing isEqualType Anything ) ) then {
		_thing allowDamage _damage;
		_thing enableSimulationGlobal _simu;
		if ( _simple ) then { 
			//should not be used in MP :(, not optimised, got to be created as simpleObject!, but gonna try anyway ;)
			//if it really kills the server/clients, gonnna tweak LARs to support it... 
			[_thing] call BIS_fnc_replaceWithSimpleObject
		};
		if ( _type == "obj" ) then { 
			BA_obj append [[_thing, _actions]];
		} else {
			if ( _type == "npc" ) then {
				{ _thing disableAI _x; } count ["MOVE", "TARGET", "AUTOTARGET"];
				[_thing, _actions] call baseAtmosphere_fnc_npcLoadout;
				BA_npc append [[_thing, _actions]];	
			} else {
				if ( _type == "veh" ) then {
					clearWeaponCargoGlobal _thing;
					clearMagazineCargoGlobal _thing;
					clearItemCargoGlobal _thing;
					clearBackpackCargoGlobal _thing;
					BA_veh append [[_thing, _actions]];
				};
			};
		};
#ifdef DEBUG
	} else {
		private _debug = format["baseAtmosphere: missing composition thing in '%1', '%2' is not defined!", BASE_COMP, _name]; 
		conRed(_debug);
#endif
	};
} count BA;