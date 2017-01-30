private ["_ClosestDead"];

//AllDeadMen because, you know, WOMEN DONT EXIST IN THIS GAME... -_-
_ClosestDead = [allDeadMen,_this] call vcomai_fnc_closestObject;
if (isNil ("_ClosestDead")) then {_ClosestDead = [0,0,0];};
_ClosestDead