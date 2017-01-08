/*
@filename: feats\laodBalancing\serverInitThread.sqf
Author:
	Ben
Description:
	this run on server side
	to evenly distribute AI between headless clients
	only support 3HCs for now, but can be changed to support more, 
	with some count loop and a hc map.
*/

#include "..\..\core\debug.hpp"
#define DFT_GRP []

if ( !isMultiplayer ) exitWith {};
if ( (["headless"] call core_fnc_getParam) == 0 ) exitWith {};

private _delay = ["loadBalance", "loopDelay"] call core_fnc_getSetting;

while { true } do {

	sleep _delay;
	
	private _HCmap = [];
	private _HCgrp = [];
	private _HCfail = 0;
	private _HCmoved = 0;
	
	for "_i" from 0 to (TOT_HC - 1) do {
		private _name = format["HC_%1", (_i + 1)];
		private _id = [_name] call loadBalance_fnc_getClientID;
		if (_id != -1 ) then {
			_HCgrp append [DFT_GRP];
			_HCmap append [_id];
		};
		
	};
	
	if ( count _HCmap > 0 ) then {
		private _toMove = [];
		{
			if ( count (units _x) > 0 ) then {
				private _move =  (({ isPlayer _x } count (units _x)) == 0);
				if ( _move ) then {
					private _grp = _x;
					private _owner = groupOwner _x;
					private _isOnHC = false;
					{
						if ( _owner == _x ) then {
							(_HCgrp select _forEachIndex) append [_grp]; 
							_isOnHC = true;
						};
					} forEach _HCmap;
					if ( !_isOnHC ) then { 
						_toMove append [_grp]; 
					};
				};
			};
		} count allGroups;
		{
			private _countSmallest = count allGroups;
			private "_smallest";
			{
				if ( count _x < _countSmallest) then {
					_smallest = _forEachIndex;
					_countSmallest = count _x;
				};
			} forEach _HCgrp;
			
			if ( _x setGroupOwner (_HCmap select _smallest) ) then {
				(_HCgrp select _smallest) append [_x];
				_HCmoved = _HCmoved + 1;
				_toMove = _toMove - [_x];
			} else {
				_HCfail = _HCfail + 1;
			}
		} count _toMove;
#ifdef DEBUG
		private _debug = format ["loadBalance : moved %1 group(s) to %2 HCs, %3 failed", _HCmoved, count _HCmap, _HCfail];
		conWhite(_debug);
		for "_i" from 0 to (count _HCmap - 1) do {
			_debug = format ["loadBalance : HC_%1 now owns %2 group(s)", (_i + 1), count (_HCgrp select _i)]; 
			conWhite(_debug);
		};
	} else {
		conWhite("loadBalance : no HC available, maybe next loop");
#endif
	};
};