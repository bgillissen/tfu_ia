/*
@filename: feats\gearRestrictions\playerOnCloseVA.sqf
Author:
	Ben
Description:
	this run on player side
	apply weapon / items restriction if player is outside the fire range
*/

if ( !(["restrictGear"] call core_fnc_getConf) ) exitWith {};

if ( player distance (getMarkerPos "FR") < FR_RADIUS ) ewitWith {}; 

if ( ["restrictLauncher"] call core_fnc_getConf ) then {
	private _at = (({player isKindOf _x} count U_at) == 1);
	if ( !_at ) then {
		private _secondWeap =  secondaryWeapon player;
		if (({player hasWeapon _x} count RG_launcher) > 0) then {
			player removeWeapon _secondWeap;
			titleText [GR_atMSG, "PLAIN", RG_msgDuration];
		};
	};
};

private _primWeap =  primaryWeapon player;

if ( ["restrictMG"] call core_fnc_getConf ) then {
	private _mg = (({player isKindOf _x} count U_mg) == 1);
	if ( !_mg ) then {
		if (({player hasWeapon _x} count RG_mg) > 0) then {
			player removeWeapon _secondWeap;
			titleText [GR_mgMSG, "PLAIN", RG_msgDuration];
		};
	};
};

private _sniper = (({player isKindOf _x} count U_sniper) == 1);
private _marksman = (({player isKindOf _x} count U_marksman) == 1);

if ( ["restrictSniper"] call core_fnc_getConf ) then {
	if (!_sniper ) then {
		if (({player hasWeapon _x} count RG_sRfile) > 0) then {
    		player removeWeapon _primWeap;
    		titleText [GR_sRifle, "PLAIN", RG_msgDuration];
    	};
	};
	if ( !_marksman ) then {
		if (({player hasWeapon _x} count RG_mRfile) > 0) then {
			player removeWeapon _primWeap;
			titleText [GR_mRifle, "PLAIN", RG_msgDuration];
    	};
    };
};

private _primItems = primaryWeaponItems player;

if ( ["restrictLRScope"] call core_fnc_getConf ) then {
	private _sScope = (({_x in _primItems} count RG_sScope) > 0); 
	private _mScope = (({_x in _primItems} count RG_mScope) > 0);
	if  ( !_sniper && !_marksman && (_mScope || _sScope) ) then {
		{player removePrimaryWeaponItem  _x;} count RG_sSCope;
		{player removePrimaryWeaponItem  _x;} count RG_mSCope;
		titleText [GR_mScopeMSG, "PLAIN", RG_msgDuration];
   	};
	if  ( !_sniper && _sScope ) then {
		{player removePrimaryWeaponItem  _x;} count RG_sScope;
		titleText [GR_sScopeMSG, "PLAIN", RG_msgDuration];
   	};
};

if ( ["restrictThermalScope"] call core_fnc_getConf ) then {
	private _officer = (({player isKindOf _x} count U_officer) == 1);
	if ( !_officer ) then {
    	if (({_x in _primItems} count RG_oScope) > 0) then {
    		{player removePrimaryWeaponItem  _x;} count _specialisedOptics;
    		titleText [GR_oScopeMSG, "PLAIN", RG_msgDuration];
    	};
	};
};

if ( ["restrictBackpack"] call core_fnc_getConf ) then {
	if ( !_at ) then {
		private _backpack = backpack player;
		if ( _backpack in RG_backpack) then {
			removeBackpack player;
			titleText [GR_backpackMSG, "PLAIN", RG_msgDuration];
		};
	};
};

if ( ["restrictUAV"] call core_fnc_getConf ) then {
	private _uavopp = (({player isKindOf _x} count U_uavopp) == 1);
	if ( !_uavopp ) then {
    	private _items = assignedItems player;
    	if (({"B_UavTerminal" == _x} count _items) > 0) then {
    		player unassignItem "B_UavTerminal";
            player removeItem "B_UavTerminal";
            titleText [GR_uavMSG, "PLAIN", RG_msgDuration];
    	};
    };
};