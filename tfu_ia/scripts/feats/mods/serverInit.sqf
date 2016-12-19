/*
@filename: feats\mods\serverInit.sqf
Author:
	Ben
Description:
	this is run on server
	check which mods were preInit and init then implent them
*/

if ( MOD_ace ) then call compile preprocessFile "feats\mods\ace\srvInit.sqf";
if ( MOD_rhsAFRF ) then call compile preprocessFile "feats\mods\rhsAFRF\srvInit.sqf"; 
if ( MOD_rhsGREF ) then call compile preprocessFile "feats\mods\rhsGREF\srvInit.sqf";
if ( MOD_rhsUSAF ) then call compile preprocessFile "feats\mods\rhsUSAF\srvInit.sqf";
if ( MOD_tfar ) then call compile preprocessFile "feats\mods\tfar\srvInit.sqf";

call compile preprocessFile "feats\mods\vanilla\implent.sqf";
call compile preprocessFile "feats\mods\apex\implent.sqf";

if ( MOD_ace ) then call compile preprocessFile "feats\mods\ace\implent.sqf";
if ( MOD_rhsAFRF ) then call compile preprocessFile "feats\mods\rhsAFRF\implent.sqf"; 
if ( MOD_rhsGREF ) then call compile preprocessFile "feats\mods\rhsGREF\implent.sqf";
if ( MOD_rhsUSAF ) then call compile preprocessFile "feats\mods\rhsUSAF\implent.sqf";
if ( MOD_tfar ) then call compile preprocessFile "feats\mods\tfar\implent.sqf";