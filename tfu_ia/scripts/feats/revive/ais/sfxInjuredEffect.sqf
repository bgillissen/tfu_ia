// by EightSix
// or maybee BI...

disableSerialization;

if (isnil {uinamespace getvariable "RscHealthTextures"}) then {
	uinamespace setvariable ["RscHealthTextures",displaynull];
};
if (isnull (uinamespace getvariable "RscHealthTextures")) then {
	(["HealthPP_blood"] call bis_fnc_rscLayer) cutrsc ["RscHealthTextures","plain"];
};

private _display = uinamespace getvariable "RscHealthTextures";

private _texLower = _display displayctrl 1211;//1013; //1001
_texLower ctrlsetfade 1;
_texLower ctrlcommit 0;

private _texMiddle = _display displayctrl 1212;
_texMiddle ctrlsetfade 1;	
_texMiddle ctrlcommit 0;

private _texUpper = _display displayctrl 1213;
_texUpper ctrlsetfade 1;	
_texUpper ctrlcommit 0;

private _x = ((0 * safezoneW) + safezoneX) + ((safezoneW - (2.125 * safezoneW * 3/4)) / 2); //textura vycentrovana na st�ed (p�i��t� se polovina m�sta kter� zb�v� od konce textury k prav�mu okraji obrazovky)
private _y = (-0.0625 * safezoneH) + safezoneY; //levy horni roh o 10% nad obrazovkou
private _w = 2.125 * safezoneW * 3/4;//safezoneW * 3/4;  //sirka o 20% vetsi nez sirka obrazovky (10% presah vlevo, 10% presah vpravo)
private _h = 1.125 * safezoneH;

_texLower ctrlsetposition [_x, _y, _w, _h];
_texMiddle ctrlsetposition [_x, _y, _w, _h];
_texUpper ctrlsetposition [_x, _y, _w, _h];

_texLower ctrlcommit 0;
_texMiddle ctrlcommit 0;
_texUpper ctrlcommit 0;

_texLower ctrlsetfade 0.2;
_texMiddle ctrlsetfade 0.7;
_texUpper ctrlsetfade 0.7;

_texLower ctrlcommit 0.2;
_texMiddle ctrlcommit 0.2;
_texUpper ctrlcommit 0.2;

waituntil {ctrlcommitted _texUpper};
waitUntil { ( !(player getVariable ["agony", false]) || !(alive player) ) };

sleep 0.5;

_texLower ctrlsetfade 1;
_texMiddle ctrlsetfade 1;
_texUpper ctrlsetfade 1;

_texUpper ctrlcommit 1.5;
sleep 1;
_texMiddle ctrlcommit 1;
sleep 0.5;
_texLower ctrlcommit 0.8;