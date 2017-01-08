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
	
    if( !(player isEqualTo vehicle player) ) then {
        private _list = "";
        private _vehicle = assignedVehicle player;
        {
        	private _icon = [_vehicle, _x ] call {
        		params ["_veh", "_player"];
        		if( driver _veh == _player) exitWith { _driver };
        		if ( gunner _veh == _player ) exitWith { _gunner };
        		if ( commander _veh == _player ) exitWith { _commander };
        		_cargo
        	};
        	_list = format [_dsp, _list, (name _x), _icon]; 
        } forEach crew _vehicle;

      	_HudNames ctrlSetStructuredText parseText _list;
      	_HudNames ctrlCommit 0;
      	sleep _updateDelay;
    };
    sleep 2;
  };  
  