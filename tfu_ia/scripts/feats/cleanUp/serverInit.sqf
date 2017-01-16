
while { true } do {
	
	sleep 300;
	
	{
		private _pos = getPos _x;
		//in base
		if ( _pos distance SZ <= SZ_RADIUS ) then { deleteVehicle _x };
		//in fireRange
		if ( _pos distance FR <= FR_RADIUS ) then { deleteVehicle _x };
		//no player close
		if ( ({_pos distance _x <= 1500} count allPlayers) == 0 ) then { deleteVehicle _x };
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