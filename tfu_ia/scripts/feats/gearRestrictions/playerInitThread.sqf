/*
@filename: feats\gearRestrictions\playerInitThread.sqf
Author:
	Ben
Description:
	this is run on player side when a player join
	keep track of player distance from the saveZone and add/remove the eventHandler
	that prevent him to fire accordingly
*/

if ( !(["restrictGear"] call core_fnc_getConf) ) exitWith {};

//unrestricted near Fire Range
private _coord = getMarkerPos "FR";

// get all base atmosphere things with an arsenal action
private _arsenals = [];
{
	{
		_x params ["_obj", "_actions"];
		if ( ({_x == "arsenal"} count _actions) > 0 ) then _arsenals append _obj;
	} count(_x);
} count ([BA_object, BA_npc, BA_vehicle])

private _at = (({player isKindOf _x} count U_at) < 1);
private _sniper = (({player isKindOf _x} count U_sniper) < 1);
private _marksman = (({player isKindOf _x} count U_marksman) < 1);
private _officer = (({player isKindOf _x} count U_officer) < 1);
private _uavopp = (({player isKindOf _x} count U_uavopp) < 1);

while {true} do {

	if ( player distance _coord > FR_RADIUS ) then { 

		if ( ["restrictLauncher"] call core_fnc_getConf ) then {
			if ( !_at ) then {
				if (({player hasWeapon _x} count RG_launcher) > 0) then {
					player removeWeapon (secondaryWeapon player);
					titleText [GR_atMSG, "PLAIN", 3];
				};
			};
		};
    	sleep 1;
    	if ( ["restrictSniper"] call core_fnc_getConf ) then {
    		if (!_sniper ) then {
    			if (({player hasWeapon _x} count RG_sRfile) > 0) then {
    				player removeWeapon (primaryWeapon player);
    				titleText [GR_sRifle, "PLAIN", 3];
    			};
    		};
        	sleep 1;
    		if ( !_marksman ) then {
    			if (({player hasWeapon _x} count RG_mRfile) > 0) then {
    				player removeWeapon (primaryWeapon player);
    				titleText [GR_mRifle, "PLAIN", 3];
    			};
    		};
    	};
    	sleep 1;
    	private _weapItems = primaryWeaponItems player;
    	if ( ["restrictLRScope"] call core_fnc_getConf ) then {
    		private _sScope = (({_x in _weapItems} count RG_sScope) > 0); 
    		private _mScope = (({_x in _weapItems} count RG_mScope) > 0);
   			if  ( !_sniper && !_marksman && (_mScope || _sScope) ) then {
   				{player removePrimaryWeaponItem  _x;} count RG_sSCope;
   				{player removePrimaryWeaponItem  _x;} count RG_mSCope;
   				titleText [GR_mScopeMSG, "PLAIN", 3];
   			};
   			if  ( !_sniper && _sScope ) then {
   				{player removePrimaryWeaponItem  _x;} count RG_sScope;
   				titleText [GR_sScopeMSG, "PLAIN", 3];
   			};
    	};
    	sleep 1;
    	if ( ["restrictThermalScope"] call core_fnc_getConf ) then {
    		if ( !_officer ) then {
    			if (({_x in _weapitems} count RG_oScope) > 0) then {
    				{player removePrimaryWeaponItem  _x;} count _specialisedOptics;
                    titleText [GR_oScopeMSG, "PLAIN", 3];
    			};
    		};
    	};
    	sleep 1;
    	if ( ["restrictBackpack"] call core_fnc_getConf ) then {
    		if ( !_at ) then {
    			if ((backpack player) in RG_backpack) then {
    				removeBackpack player;
    				titleText [GR_backpackMSG, "PLAIN", 3];
    			};
    		};
    	sleep 1;
    	
    	if ( !_uavopp ) then {
    		private _items = assignedItems player;
    		if (({"B_UavTerminal" == _x} count _items) > 0) then {
    			player unassignItem "B_UavTerminal";
    	        player removeItem "B_UavTerminal";
    	        titleText [GR_uavMSG, "PLAIN", 3];
    		};
    	};
    	sleep 1;
    };

    private _mindist = 20000;
    {
    	private _dist = (player distance _x);
    	if ( _dist < _mindist ) then _mindist = _dist;
    } count(_arsenals);
    private _loopDelay = [GR_minDelay, GR_maxDelay] select (_mindist <= GR_minDist);
    
    sleep _loopDelay;
};