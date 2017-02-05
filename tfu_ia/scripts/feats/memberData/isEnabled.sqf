
params [["_player", objNull], "_key"];

if ( isNull _player ) then { _player = player; };

private _uid = getPlayerUID _player;

{
	if ( _uid isEqualTo (_x select 0) ) exitWith {
		( (_x select _key) == 1 )
	};
} forEach memberData;

true