/*
@filename: feats\dynBillboards\playerOnRespawn.sqf
Author:
	Ben
Description:
	called on player side each time player (re)spawn.
	It changes the texture displayed on the billboards with a mode set to random.
*/


{
	_x params ["_thing", "_actions"];
	{
		if ( (configName _x) isEqualTo "billboard" ) then {
			if ( getText(_x >> "mode") isEqualTo "random" ) then {
				if ( (count DB_queue) == 0 ) then { DB_queue = DB_list; };
				private _texture = selectRandom DB_queue;
				DB_queue = DB_queue - [_texture];
				[_thing, "randoms", _texture] call billboards_fnc_setTexture;
			};
		};
	} forEach _actions;
} forEach BA_obj;