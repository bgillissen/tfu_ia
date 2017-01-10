private _milveh = ["rhsusf_m1025_d_m2","rhsusf_m998_d_2dr_fulltop"];
private _allowed = ["Item_U_C_Man_casual_1_F","Item_U_C_Man_casual_2_F","Item_U_C_Man_casual_3_F",""];

while { true } do {
	waitUntil {
		sleep 1;
		private _wait = true;
		//check if at least one unit in opfor or independent side knows about player
		private _check = ({((side _x == EAST) or (side _x == independent)) and (_x knowsAbout player > 1.4)} count allUnits > 0);
		if ( _check ) then { //so an enemy knows about player, lets do so more checks
			if (secondaryWeapon player == "") then { //no secondary weapon
				if (primaryWeapon player == "") then {	//no primary Weapon
					if (handgunWeapon player == "") then { //no handgun
						if ( (uniform player) in _allowed ) then { //uniform is allowed
							private _veh = vehicle player;
							if ( _veh != player ) then {	//so player is in a vehicle
								_wait = !(_veh in _milveh);	//that vehicle is not a military one, so we wait
							} else {
								_wait = false; //all condition above are met, so we do not wait anymore
							};
						};
					};
			 	 };
			 };
		 };
		 !_wait	//we revert _wait because waituntil expect a true to ouput the loop
	};

	player setCaptive true;

	hint "You are in Undercover Mode";

	waitUntil {
		sleep 1;
		private _wait = true;
		//check if an unit in opfor or independent side is closer than 10m from player
		private _check = ({((side _x == EAST) or (side _x == independent)) and (_x distance player < 10)} count allUnits > 0);
		if ( _check ) then { //so an enemy is close to player, lets some more checks
			if ( secondaryWeapon player != "" ) then { //got a secondary weapon
				_wait = false;
			} else {
				if ( primaryWeapon player != "" ) then { //got a primary weapon
					_wait = false;
				} else {
					if ( handgunWeapon player != "" ) then { //got a handgun
						_wait = false;
					} else {
						if ( !((uniform player) in _allowed) ) then { //uniform is not allowed
							_wait = false;
						} else {
							private _veh = vehicle player;
							if ( _veh != player ) then {	//so player is in a vehicle
								_wait = !(_veh in _milveh);	//that vehicle is not a military one, so we wait
							};
						};
					};
				};
			};
		};
		!_wait
	};

	player setCaptive false;

	hint "You are no longer in Undercover Mode";

	waitUntil {
		sleep 1;
		//we wait until all enemy units are unaware of player and further than 50m from player
		({((side _x == EAST) or (side _x == independent)) and (_x knowsAbout player > 0) and (_x distance player < 50)} count allUnits == 0)};
	}

	sleep 60;
};