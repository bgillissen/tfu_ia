/*
@filename: feats\laodBalancing\getClientID.sqf
Credit:
 	 unknow
Author:
	Ben
Description:
	run on server,
	call by feats\loadBalance\serverInitThread.sqf
	return the clientID of the given HC slot
Params:
	_slot	STRING, HC entity varname		
Environment:
	none
Return:
	SCALAR, client ID assigned to the given HC entity 
*/

params ["_slotName"];

#include "..\..\core\debug.hpp"

private "_id";
try {
	_slot = missionNamespace getVariable _slotName;
    if ( isNil "_slot" ) then {
		throw "is not present on the map!"; 
    };	
    _id = owner _slot;
    if (_id > 2) then {
#ifdef DEBUG
   		private _debug = format ["loadBalance : [%1] got Client ID %2", _slotName, _id]; 
   		conWhite(_debug);
#endif
    } else {
#ifdef DEBUG
  		private _debug = format ["loadBalance: [%1] disconnected", _slotName]; 
   		conWhite(_debug);
#endif
    	_id = -1;
    };
} catch { 
#ifdef DEBUG
	private _debug = format ["loadBalance: [%1] %2", _slotName, _exception]; 
	conRed(_debug); 
#endif
	_id = -1;
};

_id