/*
@filename: common\featInit.sqf
Author:
	Ben
Description:
	This script is executed once by each context init.
	init declared features and call or spawn required script depending on context
*/
private ["_key"];

if ( !isNil "FEAT_INIT" ) then exitWith{};

switch(CTXT) do {
	case "SERVER" : { _key = 1; };
	case "PLAYER" : { _key = 2; };
	case "HEADLESS" : { _key = 3; };
};

{
	switch(_x select _key) do {
		case 0 : { };
		case 1 : { call compile preprocessFile format["feats\%1\%2.sqf", (_x select 0), toLower(CTXT)]; };
		case 2 : { [] execVM format["feats\%1\%2Thread.sqf", (_x select 0), toLower(CTXT)]; }; 
	};
} forEach(FEATS);

FEAT_INIT = true;