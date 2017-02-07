
if ( isNil "DB_list" ) then {
	DB_list = [];
	private _tot = (["billboards", "totRandom"] call core_fnc_getSetting);
	for "_x" from 1 to  _tot do { DB_list pushback _x; };
};

if ( isNil "DB_queue" ) then { DB_queue = DB_list; };

private _needDate = false;

{
	_x params ["_thing", "_actions"];
	{
		if ( (configName _x) isEqualTo "billboard" ) then {
			if ( getText(_x >> "mode") isEqualTo "fixed" ) then {
				[_thing, getText(_x >> "texture")] call billboards_fnc_setTexture;
			};
		};
		if ( (configName _x) isEqualTo "dateBillboard" ) then { _needDate = true; };
	} forEach _actions;
} forEach BA_obj;

if !( _needDate ) exitWith {};

"serverDate" addPublicVariableEventHandler {
	(_this select 1) params [["_curYear", 0], ["_curMonth", 0], ["_curDay"], 0];;
	{
		_x params ["_thing", "_actions"];
		{
			if ( (configName _x) isEqualTo "dateBillboard" ) then {
				{
					private _start = getArray(_x >> "start");
					private _end = getArray(_x >> "end");
					if ( (_curDay >= (_start select 0)) && 
						 (_curDay <= (_end select 0)) && 
						 (_curMonth >= (_start select 1)) && 
						 (_curMonth <= (_end select 1)) ) then {
						[_thing, getText(_x >> "texture")] call billboards_fnc_setTexture;
					};	
				} forEach ("true" configClasses _x);
			};
		} forEach _actions;
	} forEach BA_obj;	
};

call common_fnc_getDate;