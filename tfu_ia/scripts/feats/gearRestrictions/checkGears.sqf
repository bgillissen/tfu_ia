
if !( player call memberData_fnc_gearRestrictions ) exitWith {};

params [["_container", objNull]];

private _drop = !(isNull _container);
private _role = player getVariable "role";
private _at = (_role == "at");
private _mg = (_role == "mg");
private _sniper = (_role == "sniper");
private _marksman = (_role == "marksman");
private _officer = ((_role == "hq") || (_role == "sl") || (_role == "tl"));
private _uavOp = (_role == "uavOp");
private _isMBR = ((player getVariable["MD_rank", 0]) > 1); 

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
			private _msg = (["gearRestrictions", "at"] call core_fnc_getSetting);
			titleText [_msg, "PLAIN", RG_msgDuration];
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
			private _msg = (["gearRestrictions", "mg"] call core_fnc_getSetting);
			titleText [_msg, "PLAIN", RG_msgDuration];
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
			private _msg = (["gearRestrictions", "sRifle"] call core_fnc_getSetting);
    		titleText [_msg, "PLAIN", RG_msgDuration];
    	};
	};
	if ( !_marksman ) then {
		if (({player hasWeapon _x} count RG_mRifle) > 0) then {
			if ( _drop ) then {
				player action ["DropWeapon", _container, _primWeap];
			} else {
				player removeWeapon _primWeap;
			};
			private _msg = (["gearRestrictions", "mRifle"] call core_fnc_getSetting);
			titleText [_msg, "PLAIN", RG_msgDuration];
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
		private _msg = (["gearRestrictions", "mScope"] call core_fnc_getSetting);
		titleText [_msg, "PLAIN", RG_msgDuration];
   	};
	if  ( !_sniper && _sScope ) then {
		{player removePrimaryWeaponItem  _x;} count RG_sScope;
		private _msg = (["gearRestrictions", "sScope"] call core_fnc_getSetting);
		titleText [_msg, "PLAIN", RG_msgDuration];
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
    		private _msg = (["gearRestrictions", "oScope"] call core_fnc_getSetting);
    		titleText [_msg, "PLAIN", RG_msgDuration];
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
			private _msg = (["gearRestrictions", "backpack"] call core_fnc_getSetting);
			titleText [_msg, "PLAIN", RG_msgDuration];
		};
	};
};

if ( (["restrictUAV"] call core_fnc_getParam) == 1 ) then {
	if ( !_uavOp ) then {
    	private _items = assignedItems player;
    	if (({"B_UavTerminal" == _x} count _items) > 0) then {
    		//player unassignItem "B_UavTerminal";
            player removeItem "B_UavTerminal";
            private _msg = (["gearRestrictions", "uav"] call core_fnc_getSetting);
            titleText [_msg, "PLAIN", RG_msgDuration];
    	};
    };
};

if ( (["restrictMBRItem"] call core_fnc_getParam) == 1 ) then {
	if ( !_isMBR ) then {
    	private _items = assignedItems player;
    	private _removed = false;
    	{
    		if ( _x in RG_mbrItems ) then { 
    			_removed = true;
    			player removeItem _x;
    		};
    		
    	} forEach _items;
    	if ( _removed ) then {
    		private _msg = (["gearRestrictions", "mbrItem"] call core_fnc_getSetting);
    		titleText [_msg, "PLAIN", RG_msgDuration]; 
    	};
    };
};