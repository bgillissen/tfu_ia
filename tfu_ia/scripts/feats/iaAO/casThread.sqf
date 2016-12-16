/*
@filename: ia\ao\casThread.sqf
Author:
	Ben
Description:
	this script is executed on server side,
	it keep respawn CAS over AO until the radioTower is alive or a zeusMission has not started
*/

param ["aoCoord", "_radioTower"];
private ["_spawnPos", "_pilotClass", "_pilot", "_cas", "_casPos", "_targets"];

if ( isNil "AO_cas" ) then AO_cas = false;
if ( isNil "AO_casGroup") then { AO_casGroup = createGroup east; };

while {(alive _radioTower)} do {
	if ( !AO_cas ) then {
		_spawnPos = [(random 30000),(random 30000),3000];
		_pilotClass = selectRandom IA_pilot; 
		_pilot = AO_casGroup createUnit [_pilotClass,[0,0,(1000 + (random 1000))],[],0,"NONE"];
		_jetClass = selectRandom IA_cas;
		_cas = createVehicle [_jetClass,_spawnPos,[],0,"NONE"];
		waitUntil {!isNull _cas};
		_cas engineOn TRUE;
		_cas allowCrewInImmobile TRUE;
		_cas flyInHeight 1000;
		_cas lock 2;
		_pilot assignAsDriver _cas;
		_pilot moveInDriver _cas;
		_pilot setRank "COLONEL";
		AO_casGroup setCombatMode "RED";
		AO_casGroup setBehaviour "COMBAT";
		AO_casGroup setSpeedMode "FULL";
		[(units enemyCasGroup), IA_casSkill] call common_fnc_setSkill;
		[AO_casGroup, _aoCoord] call BIS_fnc_taskAttack;
			
		{_x addCuratorEditableObjects [[_pilot],false];} count allCurators;
		{_x addCuratorEditableObjects [[_cas],false];} count allCurators;
		
		["EnemyJet","Enemy jet approaching!"] remoteExec ["common_fnc_globalNotification", 0, false];
		AO_cas = true;
		waitUntil {
			sleep IA_casCheckDelay;
			if ( IA_casInfAmmo ) _cas setVehicleAmmo 1;
			if ( IA_casInfFuel ) _cas setFuel 1;
			_cas flyInHeight (200 + (random 850));
			_casPos = getPosATL _cas;
			_targets = _casPos nearEntities [["Air"], IA_casSearchRadius];
			{AO_casGroup reveal [_x,4];} count _targets;
			!alive _cas || zeusMission
		};
		AO_cas = false;
		if ( alive _cas ){
			deleteVehicle _pilot;
			deleteVehicle _cas;
		} else {
			["EnemyJetDown","Enemy CAS is down. Well Done!"] remoteExec ["common_fnc_globalNotification", 0, false];
		};
	};
	sleep (IA_casDelay + (random  IA_casDelay));
};