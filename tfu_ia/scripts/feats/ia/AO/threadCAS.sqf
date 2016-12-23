/*
@filename: feats\iaAO\threadCAS.sqf
Author:
	Ben
Description:
	this run on server,
	it keep respawning CAS over AO until the radioTower is alive or a zeusMission has not started
*/

param ["aoCoord", "_radioTower"];

if ( isNil "AO_cas" ) then AO_cas = false;
if ( isNil "AO_casGroup") then AO_casGroup = createGroup ENEMY_SIDE;

while {(alive _radioTower)} do {
	if ( !AO_cas ) then {
		private _spawnPos = [(random 30000),(random 30000),3000];
		private _pilot = AO_casGroup createUnit [(selectRandom S_pilot), [0,0,(1000 + (random 1000))], [], 0, "NONE"];
		private _cas = createVehicle [(selectRandom S_cas), _spawnPos, [] , 0, "NONE"];
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
		[(units enemyCasGroup), AO_casSkill] call common_fnc_setSkill;
		[AO_casGroup, _aoCoord] call BIS_fnc_taskAttack;
		{
			_x addCuratorEditableObjects [[_pilot], false];
			_x addCuratorEditableObjects [[_cas], false];
		} count allCurators;
		["EnemyJet", "Enemy jet approaching!"] remoteExec ["common_fnc_globalNotification", 0, false];
		AO_cas = true;
		waitUntil {
			if ( AO_casInfAmmo ) _cas setVehicleAmmo 1;
			if ( AO_casInfFuel ) _cas setFuel 1;
			_cas flyInHeight (200 + (random 850));
			private _casPos = getPosATL _cas;
			private _targets = _casPos nearEntities [["Air"], AO_casSearchRadius];
			{
				AO_casGroup reveal [_x, 4];
			} count _targets;
			[AO_casCheckDelay, AO_checkDelay, "(zeusMission || AO_stop)"] call common_fnc_smartSleep;
			(!alive _cas || zeusMission || AO_stop)
		};
		AO_cas = false;
		if ( alive _cas ){
			deleteVehicle _pilot;
			deleteVehicle _cas;
		} else {
			["EnemyJetDown","Enemy CAS is down. Well Done!"] remoteExec ["common_fnc_globalNotification", 0, false];
		};
	};
	[(AO_casDelay + (random  AO_casDelay)), AO_checkDelay, "(zeusMission || AO_stop)"] call common_fnc_smartSleep;
};