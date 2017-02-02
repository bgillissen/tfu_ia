
if !( isServer ) exitWith {
	_this remoteExec ["baseDefence_fnc_spawn", 2];
};

params ["_player"];

private _cooldown = (["baseDefence_cooldown"] call core_fnc_getParam);
private _duration = (["baseDefence_duration"] call core_fnc_getParam);

BD_availAt = time + _cooldown;

publicVariable "BD_availAt";
publicVariable "BD_active";

private _locations = [];
for "_x" from 1 to 99 do {
	private _markerName = format["BD_%1", _x];
	if !( getMarkerPos _markerName isEqualTo [0,0,0] ) then { 
		_locations pushback _markerName; 
	};
};

if ( count _locations == 0 ) exitWith {
	if ( isNull _player ) then {
		diag_log "No baseDefence locations found in active base";
	} else {
		[1, "No baseDefence locations found in this base", ["HQ", PLAYER_SIDE]] call global_fnc_chat;
	};
};

BD_active = true;
publicVariable "BD_active";

private _infAmmo = [false, true] select (["baseDefence", "infiniteAmmo"] call core_fnc_getSetting);
private _skill = ["baseDefence", "skill"] call core_fnc_getSetting;
private _crew = ["baseDefence", "crew"] call core_fnc_getSetting;

private _group = createGroup PLAYER_SIDE;
private _cleanupStack = [_group];

{	
	private _class = selectRandom BV_aaTank;
	private _pos = getMarkerPos _x;
	private _dir = MarkerDir _x;
	private _veh = _class createVehicle _pos;
	_veh setDir _dir;
	_veh setFuel 0;
	_veh allowDamage false;
	_veh lock 3;
	clearWeaponCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearItemCargoGlobal _veh;
	clearBackpackCargoGlobal _veh;
	if ( _infAmmo ) then {
		_veh addEventHandler ["Fired", {(_this select 0) setVehicleAmmo 1;}];
	};
	_cleanupStack pushback _veh;
	_crew createUnit [_pos, _group];
	diag_log (units _group);
	private _commander = (units _group) select (count (units _group) - 1);
	_commander assignAsCommander _veh;
	_commander moveInCommander _veh;
	_commander setVariable["NOAI", true, true];
	[_commander, _skill] call common_fnc_setSkill;
	_cleanupStack pushback _commander;
	_crew createUnit [_pos, _group];
	private _gunner = (units _group) select (count (units _group) - 1);
	_gunner assignAsGunner _veh;
	_gunner moveInGunner _veh;
	_gunner setVariable["NOAI", true, true];
	[_gunner, _skill] call common_fnc_setSkill;
	_cleanupStack pushback _gunner;
} forEach _locations;

if !( (["baseDefence"] call core_fnc_getParam) isEqualTo 2 ) exitWith {};

private _msg = ["baseDefence", "message"] call core_fnc_getSetting;
if ( _cooldown < _duration ) then {
	_cooldown = _duration;
};
[1, format[_msg, (name _player), round (_duration / 60), round (_cooldown / 60)], ["HQ", PLAYER_SIDE]] call global_fnc_chat;

private _despawnAt = time + _duration;

waitUntil {
	sleep 5;
	(time > _despawnAt || BD_stop) 
};

_cleanupStack call common_fnc_deleteObjects;

BD_active = false;
publicVariable "BD_active";