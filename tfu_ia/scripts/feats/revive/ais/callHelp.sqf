// by psycho

if ( !(isNull(player getVariable "healer")) || 
	 !(isNull(player getVariable "dragger")) ||
	 !(isNull(player getVariable "carrier")) ||
	 !(isNull(player getVariable "helper")) ) exitWith {
	"Someone is already taking care of your ass, stop screaming." call tcb_fnc_dynamicText;
};
if ( (player getVariable ["nextCallHelp", 0]) > time) exitWith {
	"Quit screaming - you already have called out for help!" call tcb_fnc_dynamicText;
};

player setVariable ["nextCallHelp", time + 30];
"Help me! Please!" call tcb_fnc_dynamicText;
//TODO playSound3D....