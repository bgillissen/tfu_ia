
#define IMPAR []

params ["_conf", "_mods"];

private _restrictEnemyGear = (["restrictEnemyGear"] call core_fnc_getParam == 1);

0 = {
	_x params ["_k", "_src", "_sides", "_checkMods"];
	if ( isNil "_checkMods" ) then {
		_checkMods = true;
	};
	diag_log format [">>>> %1", _k];
	private _sdBackpacks = IMPAR;
	private _sdItems = IMPAR;
	private _sdWeapons = IMPAR;
	private _sdAmmo = IMPAR;
	private _sdCrates = IMPAR;
	private _sdVehicles = IMPAR;
	private _sdK = missionNamespace getVariable format["SD_%1", toUpper(_k)];
	//------------------------------------------------------------ arsenal / supplyDrop gear 
	if ( ["gear", _conf, _sides, _checkMods, false] call assets_fnc_condition ) then {
		//arsenal gear
		private _aK = missionNamespace getVariable format["A_%1", toUpper(_k)];
		if (!isNil "_aK" ) then {
			[(_src select _aK select A__BACKPACKS), 
			 (_src select _aK select A__ITEMS), 
			 (_src select _aK select A__WEAPONS), 
			 (_src select _aK select A__AMMO) ] call assets_fnc_implentArsenal;
		};
		//------------------------------------------------------------ vehicle cargo
		private _vcK = missionNamespace getVariable format["VC_%1", toUpper(_k)];
		if ( !isNil "_vcK" ) then {
			{
				[_forEachIndex, 
				 (_src select _vcK select _forEachIndex select VC__BACKPACKS), 
				 (_src select _vcK select _forEachIndex select VC__ITEMS), 
				 (_src select _vcK select _forEachIndex select VC__WEAPONS), 
				 (_src select _vcK select _forEachIndex select VC__AMMO) ] call assets_fnc_implentVehicleCargo;
			} forEach ((PV select VC_k) select 1);
		};
		//supplyDrop gear key, only define if we use that mod gear in the arsenal
		if ( !isNil "_sdK" ) then {
			_sdBackpacks = (_src select _sdK select SD__BACKPACKS); 
			_sdItems = (_src select _sdK select SD__ITEMS);
			_sdWeapons = (_src select _sdK select SD__WEAPONS);
			_sdAmmo = (_src select _sdK select SD__AMMO);
		};
	};
	//------------------------------------------------------------ supplyDrop Crates
	if (!isNil "_sdK" ) then {
		if ( {_x in ALLIES} count _sides > 0 ) then {
		
			_sdCrates = (_src select _sdK select SD__CRATES);
		};
	};
	if ( ["bv", _conf, _sides, _checkMods, false] call assets_fnc_condition ) then {
		//------------------------------------------------------------ base vehicle
		{
			private _bvK = missionNamespace getVariable format["BV_%1", toUpper(_k)];
			if ( !isNil "_bvK" ) then {
				[_forEachIndex, (_src select _bvK select _forEachIndex)] call assets_fnc_implentBaseVehicle;
			};
		} forEach ((PV select BV_k) select 1);
		//------------------------------------------------------------ supplyDrop vehicles
		if (!isNil "_sdK" ) then {
			_sdVehicles = (_src select _sdK select SD__VEHICLES);
		};
	};
	//------------------------------------------------------------ supplyDrop
	[_sdBackpacks, 
	 _sdItems, 
	 _sdWeapons, 
	 _sdAmmo,
	 _sdCrates,
	 _sdVehicles ] call assets_fnc_implentSupplyDrop;
	//------------------------------------------------------------ rewards
	if ( ["reward", _conf, _sides, _checkMods, false] call assets_fnc_condition ) then {
		private _rK = missionNamespace getVariable format["R_%1", toUpper(_k)];
		if ( !isNil "_rK" ) then {
			[(_src select _rK)] call assets_fnc_implentReward;	
		};
		
	};
	//------------------------------------------------------------ role loadout
	if ( PLAYER_SIDE in _sides ) then {
		//------------------------------------------------------------ players
		{
			private _rlK = missionNamespace getVariable format["RL_%1", toUpper(_k)];
			if ( !isNil "_rlK" ) then {
				["player", _forEachIndex, (_src select _rlK select _forEachIndex)] call assets_fnc_implentRoleLoadout;
			};
		} forEach ((PV select RL_k) select 1);
		//------------------------------------------------------------ base atmosphere  role loadout
		{
			private _baloK = missionNamespace getVariable format["BALO_%1", toUpper(_k)];
			if ( !isNil "_baloK" ) then {
				["npc", _forEachIndex, (_src select _baloK select _forEachIndex)] call assets_fnc_implentRoleLoadout;
			};
		} forEach ((PV select BALO_k) select 1);
	};
	//------------------------------------------------------------ restricted gear
	private _isEnemy = ( {_x in ALLIES} count _sides == 0 );
	if ( !(_restrictEnemyGear && _isEnemy) ) then {
		private _rgK = missionNamespace getVariable format["RG_%1", toUpper(_k)];
		if ( !isNil "_rgK" ) then {
			[(_src select _rgK select RG__LAUNCHER), 
			 (_src select _rgK select RG__MG), 
			 (_src select _rgK select RG__SRIFLE),
			 (_src select _rgK select RG__MRIFLE), 
			 (_src select _rgK select RG__SSCOPE), 
			 (_src select _rgK select RG__MSCOPE), 
			 (_src select _rgK select RG__OSCOPE), 
			 (_src select _rgK select RG__BACKPACK)] call assets_fnc_implentRestrictedGear;
		};
	};
	//------------------------------------------------------------ allowed vehicle
	private _avK = missionNamespace getVariable format["AV_%1", toUpper(_k)];
	if ( !isNil "_avK" ) then {
		[(_src select _avK select AV__HELI), 
		 (_src select _avK select AV__PLANE), 
		 (_src select _avK select AV__TANK)] call assets_fnc_implentAllowedVehicle;
	};
	//------------------------------------------------------------ enemy spawn
	if ( ["spawn", _conf, _sides, _checkMods, true] call assets_fnc_condition ) then {
		{
			private _sK = missionNamespace getVariable format["S_%1", toUpper(_k)];
			if ( !isNil "_sK" ) then {
				[_forEachIndex, (_src select _sK select _forEachIndex), (_sides select 0)] call assets_fnc_implentSpawn;
			};
			true
		} forEach (PV select S_k select 1);
		
	};
} count _mods;
