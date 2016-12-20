/*
@filename: core\fehCloseVA.sqf
Author:
	Ben
Description:
	called by a player stacked event handler
	to trigger features binded to onCloseVA event
*/

if ( !(_this getVariable "VAopen") && !(isNull (uiNamespace getVariable [ "BIS_fnc_arsenal_cam", objNull])) ) then { 
	_this setVariable ["VAopen", true];
    private _thread = _this spawn { 
    	waitUntil { isNull ( uiNamespace getVariable [ "BIS_fnc_arsenal_cam", objNull ] )  };
    	[CTXT, "onCloseVA", []] call core_fnc_featEvents;
    	_this setVariable ["VAopen", false]; 
    };
};