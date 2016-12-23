/*
@filename: feats\laodBalancing\getClientID.sqf
Credit:
 	 unknow
Author:
	Ben
Description:
	this run on server side
	get the clientID of the given HC slot
*/

params ["_slot"];

private "_id";
try {
    _id = owner (missionNamespace getVariable _slot);
    if (_id > 2) then {
		#ifdef DEBUG
    		conWhite(format ["loadBalance : [%1] got Client ID %2", _slot, _id]);
		#endif
    } else {
		#ifdef DEBUG
    		conWhite(format ["loadBalance: [%1] disconnected", _slot]);
		#endif
    	_id = -1;
    };
} catch { 
	#ifdef DEBUG
		conYellow(format ["loadBalance: [%1] %2", _slot, _exception]; 
	#endif
	_id = -1;
};

_id