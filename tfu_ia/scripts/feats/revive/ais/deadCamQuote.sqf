/*
 * Show a quote on screen, with the Quote in the center and author in the middle
 * 
 * _this select 0: Quote
 * _this select 1: Author of quote
 * _this select 2: (optional) time to display (default 10)
 */
params ["_quote", "_author", ["_duration", 10]];

if (!isNil {uinamespace getvariable "tcb_title"}) exitWith {};		// compatibility with original quote

disableSerialization;

private _layer = "tcbDeadLayer" call BIS_fnc_rscLayer;
_layer cutRsc ["RscDeadQuote", "PLAIN"]; 
sleep 1;

private _limit = time + 2;
waitUntil {
	private _title = uinamespace getvariable "tcb_ais_title";
	( !(isNil "_title") || (_limit > time) )
};

private _display = uinamespace getvariable "tcb_ais_title";
if ( isNil "_display" ) exitWith {};

if !( (str _display) isEqualTo "no display") then {
    private _text = format ["<t color='#ffffff'>%1</t><br/><br/><br/><t color='#ffffff'><t font='PuristaMedium'><t align='right'>%2</t></t></t>", _quote, _author];
	private _cntrl = _display displayCtrl 1793;
	_cntrl ctrlSetStructuredText (parseText  _text);
	_cntrl ctrlCommit 0;
    sleep _duration;
};

_layer cutfadeout 0;