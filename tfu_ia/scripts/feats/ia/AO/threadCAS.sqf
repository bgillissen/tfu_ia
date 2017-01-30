/*
@filename: feats\ia\AO\threadCAS.sqf
Author:
	Ben
Description:
	this run on server,
	it keep respawning CAS over AO until the radioTower is alive or a zeusMission has not started
*/

params ["_aoCoord", "_radioTower"];

if ( isNil "AO_cas" ) then {
	AO_cas = false;
};

if ( isNil "AO_casGroup") then {
	AO_casGroup = createGroup (selectRandom ENEMIES);
};

private _delay = ["ia", "checkDelay"] call core_fnc_getSetting;
private _checkDelay = ["ia", "ao", "cas", "checkDelay"] call core_fnc_getSetting; 
private _cooldown = ["ia", "ao", "cas", "cooldown"] call core_fnc_getSetting;
private _infAmmo = [false, true] select (["ia", "ao", "cas", "infiniteAmmo"] call core_fnc_getSetting);
private _infFuel = [false, true] select (["ia", "ao", "cas", "infiniteFuel"] call core_fnc_getSetting);
private _range = ["ia", "ao", "cas", "searchRadius"] call core_fnc_getSetting;

while { alive _radioTower } do {
	if ( !AO_cas ) then {
		(["cas"] call ia_fnc_randomSide) params ["_side", "_vehPool", "_key"];
		private _spawnPos = [(random 30000),(random 30000),3000];
		private _pilot = AO_casGroup createUnit [(selectRandom (S_pilot select _key)), [0,0,(1000 + (random 1000))], [], 0, "NONE"];
		private _cas = createVehicle [(selectRandom _vehPool), _spawnPos, [] , 0, "NONE"];
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
		[(units AO_casGroup), (["ia", "ao", "cas", "skill"] call core_fnc_getSetting)] call common_fnc_setSkill;
		[AO_casGroup, _aoCoord] call BIS_fnc_taskAttack;
		{
			_x addCuratorEditableObjects [[_pilot], false];
			_x addCuratorEditableObjects [[_cas], false];
		} count allCurators;
		["EnemyJet", (["ia", "ao", "cas", "newNotif"] call core_fnc_getSetting)] call global_fnc_notification;
		AO_cas = true;
		 
		waitUntil {
			if ( _InfAmmo ) then {
				_cas setVehicleAmmo 1;
			};
			if ( _InfFuel ) then {
				_cas setFuel 1;
			};
			_cas flyInHeight (200 + (random 850));
			private _casPos = getPosATL _cas;
			private _targets = _casPos nearEntities [["Air"], _range];
			{
				AO_casGroup reveal [_x, 4];
			} count _targets;
			[_checkDelay, _delay, "(zeusMission || AO_stop)"] call common_fnc_smartSleep;
			(!alive _cas || zeusMission || AO_stop)
		};
		AO_cas = false;
		if ( alive _cas ) then {
			deleteVehicle _pilot;
			deleteVehicle _cas;
		} else {
			["EnemyJetDown", (["ia", "ao", "cas", "endNotif"] call core_fnc_getSetting)] call global_fnc_notification;
		};
	};
	[(_cooldown + ((random  _cooldown) / 2)), _checkDelay, "(zeusMission || AO_stop)"] call common_fnc_smartSleep;
};