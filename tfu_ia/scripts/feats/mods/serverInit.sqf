/*
@filename: feats\mods\serverInit.sqf
Author:
	Ben
Description:
	run on server
	check which mods were preInit and init then implent them
*/

if ( MOD_ace ) then {
	call compileFinal preprocessFileLineNumbers "feats\mods\ace\init.sqf";
};
if ( MOD_rhsAFRF ) then {
	call compileFinal preprocessFileLineNumbers "feats\mods\rhsAFRF\init.sqf"; 
};
if ( MOD_rhsGREF ) then {
	call compileFinal preprocessFileLineNumbers "feats\mods\rhsGREF\init.sqf";
};
if ( MOD_rhsUSAF ) then {
	call compileFinal preprocessFileLineNumbers "feats\mods\rhsUSAF\init.sqf";
};
if ( MOD_tfar ) then {
	call compileFinal preprocessFileLineNumbers "feats\mods\tfar\init.sqf";
};

call compileFinal preprocessFileLineNumbers "feats\mods\vanilla\implent.sqf";
call compileFinal preprocessFileLineNumbers "feats\mods\apex\implent.sqf";

if ( MOD_ace ) then {
	call compileFinal preprocessFileLineNumbers "feats\mods\ace\implent.sqf";
};
if ( MOD_rhsAFRF ) then {
	call compileFinal preprocessFileLineNumbers "feats\mods\rhsAFRF\implent.sqf"; 
};
if ( MOD_rhsGREF ) then {
	call compileFinal preprocessFileLineNumbers "feats\mods\rhsGREF\implent.sqf";
};
if ( MOD_rhsUSAF ) then {
	call compileFinal preprocessFileLineNumbers "feats\mods\rhsUSAF\implent.sqf";
};
if ( MOD_tfar ) then {
	call compileFinal preprocessFileLineNumbers "feats\mods\tfar\implent.sqf";
};