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
private _cargoNoDsp = ["vehicleCrew", "noCargoDisplay"] call core_fnc_getSetting;
private _cargoFreeDsp = ["vehicleCrew", "cargoFreeDisplay"] call core_fnc_getSetting;
private _cargoFullDsp = ["vehicleCrew", "cargoFullDisplay"] call core_fnc_getSetting;
private _dsp = ["vehicleCrew", "display"] call core_fnc_getSetting;
private _gunnerDsp = ["vehicleCrew", "gunnerDisplay"] call core_fnc_getSetting;
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
    	private _totCargo = count (fullcrew [_veh, "cargo", true]);
    	private _showCargo = ( ((driver _veh isEqualTo player) || ([_veh, player] call common_fnc_isCopilot)) && (_totCargo > 0) );
    	private _vehName = getText (configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
    	private _vehIcon = getText (configFile >> "CfgVehicles" >> (typeOf _veh) >> "icon");
    	private _list = format[_cargoNoDsp, _vehIcon, _vehName];
    	if ( _showCargo ) then {
    		private _freeCargo = _veh emptyPositions "cargo";
    		if ( _freeCargo > 0 ) then {
    			_list = format[_cargoFreeDsp, _vehIcon, _vehName, _freeCargo];
    		} else {
    			_list = format[_cargoFullDsp, _vehIcon, _vehName];
    		};
    	};        
    	private _crew = fullcrew _veh;
    	private _stack = [[],[],[],[], []];
    	{
    		_x params ["_unit", "_role", "_index", "_turretPath", "_personTurret"];
    		if ( !(_unit isEqualTo objNull) ) then {
    			private _gunName = "";
    			private _details = [_role, _turretPath] call {
    				_this params ["_role", "_turretPath"];
    				if ( _role isEqualTo "driver" ) exitWith { [0, _driver] };
    				if ( _role isEqualTo "cargo" ) exitWith { [4, _cargo] };
    				if ( _role isEqualTo "commander" ) exitWith { [2, _commander] };
    				private _cfg = (configFile >> "CfgVehicles" >> (typeOf _veh) >> "turrets");
    				{ _cfg = _cfg select _x;true } count _turretPath;
    				if ( getNumber(_cfg >> "iscopilot") isEqualTo 1) exitWith { [1, _driver] };
    				_gunName = getText(_cfg >> "gunnerName"); 
    				[3, _gunner]
    			};
    			_details params ["_key", "_icon"];
    			private _toFormat = _dsp;
    			if ( !(_gunName isEqualTo "") ) then { _toFormat = _gunnerDsp; };
    			if ( !alive _unit ) then {
    				(_stack select _key) append [format[_toFormat, _icon, "dead body", _gunName]];	
    			} else {
    				(_stack select _key) append [format [_toFormat, _icon, (name _unit), _gunName]];
    			};
    		};
    		true
    	} count _crew;
    	
    	{ _list = format["%1%2", _list, (_x joinString "")];true } count _stack;
    	/*
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
		*/
      	_HudNames ctrlSetStructuredText parseText _list;
      	_HudNames ctrlCommit 0;
    };
    sleep _updateDelay;
  };  
  