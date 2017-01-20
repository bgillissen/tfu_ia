params ["_wounded", "_damage"];

private _time = time;
while {
	( (time - _time < _damage)
	&& (alive player)
	&& (alive _wounded)
	&& ((player distance _wounded) < 2)
	&& !(player getVariable "agony")
	&& !(player getVariable ["stopped"]) )
} do {
	sleep 0.5;
	["Applying First Aid.", ((time - _time) / _damage ) min 1] spawn tcb_fnc_progressbar;
};

if ( !(player getVariable ["stopped"]) && !(player getVariable "agony") && (alive player) && (alive _wounded) ) then {
	player setVariable ["finished", true, true];
};