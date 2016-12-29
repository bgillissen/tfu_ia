/*
@filename: feats\laodBalancing\serverInitThread.sqf
Author:
	Ben
Description:
	this run on server side
	to evenly distribute AI between headless clients
	only support 3HCs for now, but can be changed to support more, with some count loop.
*/

#include "..\..\core\debug.hpp"

if ( !["headless"] call core_fnc_getConf ) exitWith{};

private _delay = ["loadBalance", "loopDelay"] call BIS_fnc_GetCfgData;

while ( true ) do {

	sleep _delay;
	private _HC1_ID = ["HC1"] call loadBalance_fnc_getClientID;
	private _HC2_ID = ["HC2"] call loadBalance_fnc_getClientID;
	private _HC3_ID = ["HC3"] call loadBalance_fnc_getClientID;
	private _avail = 0;
	{
		if ( _x != -1 ) then { _avail = _avail + 1; }; 
	} count [_HC1_ID, _HC2_ID, _HC3_ID];
  
	private _toMove = [];
	if ( _avail > 0 ) then {
		private _HC1_groups = [];
		private _HC2_groups = [];
		private _HC3_groups = [];
		{
			private _swap = true;
			{
				if (isPlayer _x) exitWith { _swap = false; };
			} count (units _x);
			if ( _swap ) then {
				private _owner = owner _x;
				if ( _owner == _HC1_ID ) then {
					_HC1_groups append [_x];
				} else {
					if ( _owner == _HC2_ID ) then {
						_HC2_groups append [_x];
					} else {
						if ( _owner == _HC3_ID ) then {
							_HC3_groups append [_x];
						} else {
							_toMove append [_x];
						};
					};
				};
			};
		} count allGroups;
		private _countArray = [count _HC1_groups, count _HC2_groups, count _HC3_groups];
		{
			private _countSmallest = count allGroups;
			private "_smallest";
			{
				if ( _x < _countSmallest) then {
					_smallest = _forEachIndex;
					_countSmallest = _x;
				};
			} foreach(_countArray);
			private _moveTo = _smallest call {
				if ( _this == 0 ) exitWith { _HC1_ID };	
				if ( _this == 1 ) exitWith { _HC2_ID };
				_HC3_ID
			};
			_x setGroupOwner _moveTo;
			_countArray set [_smallest, (_countSmallest + 1)];
		} count _toMove;
		#ifdef DEBUG
			private _debug = format ["loadBalance : moved %1 group(s) to %2 HCs", count _toMove, _avail];
    		conWhite(_debug);
			{
				_debug = format ["loadBalance : HC%1 now owns %2 AI", (_x +1), countArray select _x]; 
				conWhite(_debug);	
			} count [0,1,2];
		#endif
	} else {
		#ifdef DEBUG
    		conWhite("loadBalance : no HC available, maybe next loop");
		#endif
	};
};