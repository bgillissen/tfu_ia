/*
@filename: mods\srvInit.sqf
Author:
	Ben
Description:
	this is executed once only server context
	check which mods are loaded and init then implent them
*/

if ( MOD_ace ) then call compile preprocessFile "mods\ace\srvInit.sqf";
if ( MOD_rhsAFRF ) then call compile preprocessFile "mods\rhsAFRF\srvInit.sqf"; 
if ( MOD_rhsGREF ) then call compile preprocessFile "mods\rhsGREF\srvInit.sqf";
if ( MOD_rhsUSAF ) then call compile preprocessFile "mods\rhsUSAF\srvInit.sqf";
if ( MOD_tfar ) then call compile preprocessFile "mods\tfar\srvInit.sqf";

call compile preprocessFile "mods\vanilla\implent.sqf";
call compile preprocessFile "mods\apex\implent.sqf";
if ( MOD_ace ) then call compile preprocessFile "mods\ace\implent.sqf";
if ( MOD_rhsAFRF ) then call compile preprocessFile "mods\rhsAFRF\implent.sqf"; 
if ( MOD_rhsGREF ) then call compile preprocessFile "mods\rhsGREF\implent.sqf";
if ( MOD_rhsUSAF ) then call compile preprocessFile "mods\rhsUSAF\implent.sqf";
if ( MOD_tfar ) then call compile preprocessFile "mods\tfar\implent.sqf";