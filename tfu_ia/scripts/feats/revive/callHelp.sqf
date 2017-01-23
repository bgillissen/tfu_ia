// by psycho

if ( !(isNull(player getVariable "healer")) || 
	 !(isNull(player getVariable "dragger")) ||
	 !(isNull(player getVariable "carrier")) ||
	 !(isNull(player getVariable "helper")) ) exitWith {
	"Someone is already taking care of your ass, stop screaming." call revive_fnc_dynamicText;
};
if ( (player getVariable ["nextCallHelp", 0]) > time) exitWith {
	"Quit screaming - you already have called out for help!" call revive_fnc_dynamicText;
};

player setVariable ["nextCallHelp", time + 30];
"Help me! Please!" call revive_fnc_dynamicText;
//TODO playSound3D....