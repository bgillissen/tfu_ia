/*
@filename: feats\cleanUp\serverInit.sqf
Author:
	Ben
Description:
	run on server
	cleanup garbage
*/

private _dist = 15; //1500 in prod
private _sz = getMarkerPos "SZ";
private _fr = getMarkerPos "FR";
private _delay = ["cleanup", "loopDelay"] call core_fnc_getSetting;

while { true } do {
	
	sleep 30;
	//sleep _delay;
	{
		private _pos = getPos _x;
		private _ok = true;
		if ( _x isKindOf "StaticWeapon" ) then { _ok = ( count (crew _x) == 0 ); };
		if ( _ok ) then {
			//in base
			if ( _pos distance _sz <= SZ_RADIUS ) then { 
				deleteVehicle _x 
			} else {
				//in fireRange
				if ( _pos distance _fr <= FR_RADIUS ) then { 
					deleteVehicle _x 
				} else {
					//no player close
					if ( ({_pos distance _x <= _dist} count allPlayers) == 0 ) then { deleteVehicle _x };
				};
			};
		};
		true
	} count ((allMissionObjects "CraterLong") +
        	 (allMissionObjects "WeaponHolder") +
        	 (allMissionObjects "WeaponHolderSimulated") +
        	 allMines +
        	 allDead +
        	 allMissionObjects "StaticWeapon");
	
	{
		if !( _x in SQUADS ) then {
			if ( (count (units _x)) == 0 ) then { deleteGroup _x };
		};
		true
	} count allGroups;
};