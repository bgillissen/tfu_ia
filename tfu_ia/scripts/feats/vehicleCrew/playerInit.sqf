/*
@filename: feats\vehicleCrew\playerInitThread.sqf
Author:
	unknown, taken from ahoyWorld I&A
Description:
	run on player side
	This script keeps updating an HUD with the passenger list of the vehicle the player is in.
*/

if ( (["vehicleCrew"] call core_fnc_getParam) == 0 ) exitWith{};

private _updateDelay = ["vehicleCrew", "updateDelay"] call core_fnc_getSetting;
private _cargoFreeDsp = ["vehicleCrew", "cargoFreeDisplay"] call core_fnc_getSetting;
private _cargoFullDsp = ["vehicleCrew", "cargoFullDisplay"] call core_fnc_getSetting;
private _dsp = ["vehicleCrew", "display"] call core_fnc_getSetting;
private _driver = ["vehicleCrew", "icons", "driver"] call core_fnc_getSetting;
private _gunner = ["vehicleCrew", "icons", "gunner"] call core_fnc_getSetting;
private _commander = ["vehicleCrew", "icons", "commander"] call core_fnc_getSetting;
private _cargo = ["vehicleCrew", "icons", "cargo"] call core_fnc_getSetting;

disableSerialization;

while { true } do  {
	
	1000 cutRsc ["HudNames","PLAIN"];
	private _ui = uiNameSpace getVariable "HudNames";
	private _HudNames = _ui displayCtrl 99999;
	private _veh = vehicle player;
    if( !(player isEqualTo _veh) && alive _veh ) then {
    	private _vehIcon = getText (configFile >> "CfgVehicles" >> (typeOf _veh) >> "picture");
    	private _freeCargo = _veh emptyPositions "cargo";
    	private _showCargo = ( (driver _veh isEqualTo player) || ([_veh, player] call common_fnc_isCopilot) );
    	private _list = "";
    	if ( _showCargo ) then {
    		if ( _freeCargo > 0 ) then {
    			_list = format[_cargoFreeDsp, _freeCargo, _vehIcon];
    		} else {
    			_list = format[_cargoFullDsp, _vehIcon];
    		}
    	};        
        {
        	private _icon = [_veh, _x] call {
        		params ["_veh", "_crew"];
        		if ( driver _veh == _crew ) exitWith { _driver };
        		if ( [_veh, _crew] call common_fnc_isCopilot ) exitWith { _driver };
        		if ( gunner _veh isEqualTo _crew ) exitWith { _gunner };
        		if ( commander _veh isEqualTo _crew ) exitWith { _commander };
        		_cargo
        	};
        	_list = format [_dsp, _list, (name _x), _icon];
        	true
        } count (crew _veh);

      	_HudNames ctrlSetStructuredText parseText _list;
      	_HudNames ctrlCommit 0;
    };
    sleep _updateDelay;
  };  
  