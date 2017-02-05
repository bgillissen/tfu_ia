
if !( isServer ) exitWith { [] remoteExec ["memberData_fnc_update", 2]; };

memberData = [];

{
	private _uid = getText( _x >> "uid" );
	private _rank = getNumber( _x >> "rank" );
	private _isZeus = getNumber( _x >> "isZeus" );
	private _GR = getNumber( _x >> "gearRestrictions" );
	private _BP = getNumber( _x >> "baseProtection" );
	private _VR = getNumber( _x >> "vehicleRestrictions" );
	private _country = getText( _x >> "country" );
	memberData pushback [_uid, _rank, _isZeus, _GR, _BP, _VR, _country];
} forEach ("true" configClasses ( missionConfigFile >> "memberData" >> "static") );

private _dynMode = (["memberData", "dynamic", "mode"] call core_fnc_getSetting);

if ( _dynMode == 0 ) exitWith { publicVariable "memberData"; };

private _dynSrc = (["memberData", "dynamic", "src"] call core_fnc_getSetting);

private _data = "";

if ( _dynMode == 1 ) then { _data = loadFile _dynSrc; };
if ( _dynMode == 2 ) then { _data = [_dynSrc] call common_fnc_fetchUrlReturn; };

private _lines = _data splitString "\n";
_data = nil;

{
	private _data = _x splitString ";";
	private _uid = _data select 0;
	private _rank = parseNumber (_data select 1);
	private _isZeus = parseNumber (_data select 2);
	private _GR = parseNumber (_data select 3);
	private _BP = parseNumber (_data select 4);
	private _VR = parseNumber (_data select 5);
	private _country = _data select 6;
	
	private _key = -1;
	{
		if ( _uid isEqualTo (_x select 0) ) then { _key = _forEachIndex; };
	} forEach memberData;
	if ( _key >= 0 ) then {
		memberData set [_key, [_uid, _rank, _isZeus, _GR, _BP, _VR, _country]];
	} else {
		memberData pushback [_uid, _rank, _isZeus, _GR, _BP, _VR, _country];
	};
} forEach _lines;

publicVariable "memberData";