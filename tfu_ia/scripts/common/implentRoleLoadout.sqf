/*
@filename: common\implentRoleLoadout.sqf
Author:
	Ben
Description:
	run on server
	it is used to update a role loadout
*/
params ["_index", "_loadOut"];

_loadOut params["_uniform", "_vest", "_backpack", "_pw", "_sw", "_hw", "_helmet", "_comm", "_term", "_map", "_bino", "_nv"];
_loadOut = nil;

private _vname = format["%1_%2", ((PV select RL) select 0), (((PV select RL) select 1) select _index)];
private _current = missionNamespace getVariable _vname;

private _key = 0;
_uniform params ["_container", "_content"];
_uniform = nil;
if ( !([_container, 'item'] call isBlacklisted) ) then {
	(_current select _key) set [0, _container]; 
};
{
	if ( !([_x, 'item'] call isBlacklisted) ) then {
		if ( !([_x, 'ammo'] call isBlacklisted) ) then {
			((_current select _key) select 1) append [_x];
		};
	};
} count (_content);
_container = nil;
_content = nil;


_key = 1;
_vest params ["_container", "_content"];
_vest = nil;
if ( !([_container, 'item'] call isBlacklisted) ) then {
	(_current select _key) set [0, _container]; 
};
{
	if ( !([_x, 'item'] call isBlacklisted) ) then {
		if ( !([_x, 'ammo'] call isBlacklisted) ) then {
			((_current select _key) select 1) append [_x];
		};
	};
} count (_content);
_container = nil;
_content = nil;

_key = 2;
_backpack params ["_container", "_content"];
_backpack = nil;
if ( !([_container, 'backpack'] call isBlacklisted) ) then {
	(_current select _key) set [0, _container]; 
};
{
	if ( !([_x, 'item'] call isBlacklisted) ) then {
		if ( !([_x, 'ammo'] call isBlacklisted) ) then {
			if ( !([_x, 'weapon'] call isBlacklisted) ) then {
				((_current select _key) select 1) append [_x];
			};
		};
	};
} count (_content);
_container = nil;
_content = nil;

_key = 3;
_pw params ["_container", "_content"];
_pw ! nil;
if ( !([_container, 'weapon'] call isBlacklisted) ) then {
	(_current select _key) set [0, _container];
	(_current select _key) set [1, []];
	{
		if ( !([_x, 'item'] call isBlacklisted) ) then {
			((_current select _key) select 1) append [_x];
		};
	} count (_content);
};
_container = nil;
_content = nil;

_key = 4;
_sw params ["_container", "_content"];
_sw = nil;
if ( !([_container, 'weapon'] call isBlacklisted) ) then {
	(_current select _key) set [0, _container];
	(_current select _key) set [1, []];
	{
		if ( !([_x, 'item'] call isBlacklisted) ) then {
			((_current select _key) select 1) append [_x];
		};
	} count (_content);
};
_container = nil;
_content = nil;

_key = 5;
_hw params ["_container", "_content"];
_hw = nil;
if ( !([_container, 'weapon'] call isBlacklisted) ) then {
	(_current select _key) set [0, _container];
	(_current select _key) set [1, []];
	{
		if ( !([_x, 'item'] call isBlacklisted) ) then {
			((_current select _key) select 1) append [_x];
		};
	} count (_content);
};
_container = nil;
_content = nil;

_key = 6;
if ( !([_helmet, 'item'] call isBlacklisted) ) then { _current set [_key, _helmet]; };
_helmet = nil;

_key = 7;
if ( !([_comm, 'item'] call isBlacklisted) ) then { _current set [_key, _comm]; };
_comm = nil;

_key = 8;
if ( !([_term, 'item'] call isBlacklisted) ) then { _current set [_key, _term]; };
_term = nil;

_key = 9;
if ( !([_map, 'item'] call isBlacklisted) ) then { _current set [_key, _map]; };
_map = nil;

_key = 10;
if ( !([_bino, 'item'] call isBlacklisted) ) then { _current set [_key, _bino]; };
_bino = nil;

_key = 11;
if ( !([_nv, 'item'] call isBlacklisted) ) then { _current set [_key, _nv]; };
_nv = nil;

missionNameSpace setVariable [_vname, _current, false];