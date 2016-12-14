/*
@filename: feats\dynBillboards\onRespawn.sqf
Author:
	Ben
Description:
	This file is execute each time player (re)spawn.
	It changes the texture displayed on the right billboard.
*/

if ( isNil "imageList" ) then { imageList = [1,2,3,4,5,6]; };
if ( (count imageList) == 0 ) then { imageList = [1,2,3,4,5,6]; };
_bill = imageList call BIS_fnc_selectRandom;
if (_bill == 1) then {Bill_2 setObjectTexture [0,"media\billboards\billboard1.paa"]};
if (_bill == 2) then {Bill_2 setObjectTexture [0,"media\billboards\billboard2.paa"]};
if (_bill == 3) then {Bill_2 setObjectTexture [0,"media\billboards\billboard3.paa"]};
if (_bill == 4) then {Bill_2 setObjectTexture [0,"media\billboards\billboard4.paa"]};
if (_bill == 5) then {Bill_2 setObjectTexture [0,"media\billboards\billboard5.paa"]};
if (_bill == 6) then {Bill_2 setObjectTexture [0,"media\billboards\billboard6.paa"]};
imageList = imageList - [_bill];

//For Christmast
//Bill_2 setObjectTexture [0,"media\images\billboardNoel.paa"];