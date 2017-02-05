
if !( player call memberData_fnc_gearRestrictions ) exitWith {};

params [["_container", objNull]];

private _drop = !(isNull _container);
private _role = player getVariable "role";
private _at = (_role == "at");
private _mg = (_role == "mg");
private _sniper = (_role == "sniper");
private _marksman = (_role == "marksman");
private _officer = ((_role == "hq") || (_role == "sl") || (_role == "tl"));
private _uavopp = (_role == "uavopp");
_role = nil;

if ( (["restrictLauncher"] call core_fnc_getParam) == 1 ) then {
	if ( !_at ) then {
		private _secondWeap =  secondaryWeapon player;
		if (({player hasWeapon _x} count RG_launcher) > 0) then {
			if ( _drop ) then {
				player action ["DropWeapon", _container, _secondWeap];
			} else {
				player removeWeapon _secondWeap;
			};
			titleText [GR_atMSG, "PLAIN", RG_msgDuration];
		};
	};
};

private _primWeap =  primaryWeapon player;

if ( (["restrictMG"] call core_fnc_getParam) == 1 ) then {
	if ( !_mg ) then {
		if (({player hasWeapon _x} count RG_mg) > 0) then {
			if ( _drop ) then {
				player action ["DropWeapon", _container, _primWeap];
			} else {
				player removeWeapon _primWeap;
			};
			titleText [GR_mgMSG, "PLAIN", RG_msgDuration];
		};
	};
};



if ( (["restrictSniper"] call core_fnc_getParam) == 1 ) then {
	if (!_sniper ) then {
		if (({player hasWeapon _x} count RG_sRifle) > 0) then {
			if ( _drop ) then {
				player action ["DropWeapon", _container, _primWeap];
			} else {
				player removeWeapon _primWeap;
			};
    		titleText [GR_sRifle, "PLAIN", RG_msgDuration];
    	};
	};
	if ( !_marksman ) then {
		if (({player hasWeapon _x} count RG_mRifle) > 0) then {
			if ( _drop ) then {
				player action ["DropWeapon", _container, _primWeap];
			} else {
				player removeWeapon _primWeap;
			};
			titleText [GR_mRifle, "PLAIN", RG_msgDuration];
    	};
    };
};

private _primItems = primaryWeaponItems player;

if ( (["restrictLRScope"] call core_fnc_getParam) == 1 ) then {
	private _sScope = (({_x in _primItems} count RG_sScope) > 0); 
	private _mScope = (({_x in _primItems} count RG_mScope) > 0);
	if  ( !_sniper && !_marksman && (_mScope || _sScope) ) then {
		{
			if ( _x in _primItems ) then {
				if ( _drop ) then { _container addItemCargoGlobal [_x, 1]; };
				player removePrimaryWeaponItem  _x;
			};
		} count RG_sSCope;
		{
			if ( _x in _primItems ) then {
				if ( _drop ) then { _container addItemCargoGlobal [_x, 1]; };
				player removePrimaryWeaponItem  _x;
			};
		} count RG_mSCope;
		titleText [GR_mScopeMSG, "PLAIN", RG_msgDuration];
   	};
	if  ( !_sniper && _sScope ) then {
		{player removePrimaryWeaponItem  _x;} count RG_sScope;
		titleText [GR_sScopeMSG, "PLAIN", RG_msgDuration];
   	};
};

if ( (["restrictThermalScope"] call core_fnc_getParam) == 1 ) then {	
	if ( !_officer ) then {
    	if (({_x in _primItems} count RG_oScope) > 0) then {
    		{
    			if ( _x in _primItems ) then {
    				if ( _drop ) then { _container addItemCargoGlobal [_x, 1]; };
    				player removePrimaryWeaponItem  _x;
    			};
    		} count _specialisedOptics;
    		titleText [GR_oScopeMSG, "PLAIN", RG_msgDuration];
    	};
	};
};

if ( (["restrictBackpack"] call core_fnc_getParam) == 1 ) then {
	if ( !_at ) then {
		private _backpack = backpack player;
		if ( _backpack in RG_backpack) then {
			if ( _drop ) then { 
				_container addItemCargoGlobal [_backpack, 1];
				private _eContainer = (everyContainer _container);
				private _eBackpack = _eContainer select (_eContainer find _backpack);
				{ _eBackpack addItemCargoGlobal [_x, 1]; } forEach (backpackItems player);
			};
			removeBackpack player;
			titleText [GR_backpackMSG, "PLAIN", RG_msgDuration];
		};
	};
};

if ( (["restrictUAV"] call core_fnc_getParam) == 1 ) then {
	if ( !_uavopp ) then {
    	private _items = assignedItems player;
    	if (({"B_UavTerminal" == _x} count _items) > 0) then {
    		//player unassignItem "B_UavTerminal";
            player removeItem "B_UavTerminal";
            titleText [GR_uavMSG, "PLAIN", RG_msgDuration];
    	};
    };
};