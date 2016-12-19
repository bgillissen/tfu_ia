/*
@filename: feats\voiceControl\serverInitThread.sqf
Credit:
	KiloSwiss
Author:
	Ben
Description:
	run on server
	must be spawn, not called.
	This script is used to keep the player authorized channels updated.
*/

param ["_uid"];

while { true } do { 
	uiSleep 3;
	if( _uid in VC_adminList ) then {
		VC_allowed = VC_admins;
	} else {
		if( serverCommandAvailable "#logout" ) then {
			VC_allowed = VC_admins;
		} else {
			if(count units group player == 1) then {
				VC_allowed = VC_players;
			} else {
				if(player != leader group player) then {
					VC_allowed = VC_players;
				} else {
					VC_allowed = VC_groupleader;
					if(vehicle player != player && effectiveCommander (vehicle player) == player) then {
						VC_allowed = VC_allowed + [2]; 
					};                                                                    
				};
			};
		};
	};

	if( isNil "VC_open" ) then { VC_open = [] };
	if !(VC_open isEqualTo VC_allowed) then {
		for "_i" from 0 to 6 do {
			_i enableChannel ( if (_i in VC_allowed) then [ {true},{if(_i in VC_disabled)then [{false},{true}] }] );
		};
		VC_open = VC_allowed;
	};
};