
if ( isNil "DB_list" ) then {
	DB_list = [];
	private _tot = (["billboards", "totRandom"] call core_fnc_getSetting);
	for "_x" from 1 to  _tot do { DB_list pushback _x; };
};

if ( isNil "DB_queue" ) then { DB_queue = DB_list; };

{
	_x params ["_thing", "_actions"];
	{
		if ( (configName _x) isEqualTo "billboard" ) then {
			if ( getText(_x >> "mode") isEqualTo "fixed" ) then {
				[_thing, getText(_x >> "texture")] call billboards_fnc_setTexture;
			};
		};
		if ( (configName _x) isEqualTo "dateBillboard" ) then {
			{
				private _start = getArray(_x >> "start");
				private _end = getArray(_x >> "end");
				private _curMonth = 0;//TODO use a extension to get real world date
				private _curDay = 0;
				(call common_fnc_getDate) params [["_curYear", 0], ["_curMonth", 0], ["_curDay"], 0];
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