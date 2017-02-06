
params [["_player", objNull], "_key"];

if ( isNull _player ) then { _player = player; };

private _uid = getPlayerUID _player;
private _result = true;

{
	if ( _uid isEqualTo (_x select 0) ) exitWith {
		_result = ( (_x select _key) == 1 );
	};
} forEach memberData;

_result