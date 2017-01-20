// by EightSix
#define MPSF_PROGBAR_BG (uiNamespace getVariable "mpsf_ProgressBar_gui_bg")
#define MPSF_PROGBAR_FG (uiNamespace getVariable "mpsf_ProgressBar_gui_fg")
#define MPSF_PROGBAR_TXT (uiNamespace getVariable "mpsf_ProgressBar_gui_txt")

disableSerialization;

private _display = uinamespace getvariable ["mpsf_ProgressBar_gui", objNull];
if( isNull _display ) then {
	if ( isnil "mpsf_hudtext_n" ) then { mpsf_hudtext_n = 2733; };
	mpsf_hudtext_n cutRsc ["ais_ProgressBar","plain"];
	mpsf_hudtext_n = mpsf_hudtext_n + 1;
	_display = uinamespace getvariable ["mpsf_ProgressBar_gui", objNull];
};

private _title = if(count _this > 0) then { _this select 0 }else{ "Progress" };
private _value = if(count _this > 1) then { _this select 1 }else{ _this select 0 };

private _sitrepArray = toArray format[" .....%1%", round (_value * 100)];
/*
{
	_sitrepArray set [_foreachindex, tostring [_x]];
} foreach _sitrepArray;
*/

private _sitrep = "";
private _sitrepFormat = "<t align='left' shadow='1'>" + _title + ":%1</t>";

private _pos = ctrlPosition MPSF_PROGBAR_FG;
private _maxWidth = ctrlPosition MPSF_PROGBAR_BG select 2;
private _newval = (_maxWidth * (_value min 1) ) max 0.02;
private _pos set [2, _newval];

MPSF_PROGBAR_BG ctrlSetFade 0.3;
MPSF_PROGBAR_BG ctrlCommit 0;
MPSF_PROGBAR_FG ctrlSetPosition _pos;
MPSF_PROGBAR_FG ctrlSetFade 0.3;
MPSF_PROGBAR_FG ctrlCommit 1;
MPSF_PROGBAR_TXT ctrlSetFade 0.0;
MPSF_PROGBAR_TXT ctrlCommit 0;

for "_i" from 0 to (count _sitrepArray - 1) do {
	private _letter = _sitrepArray select _i;
	private "_delay";
	if ( _letter == "|" ) then { 
		_letter = "<br />"; 
		_delay = 1; 
	} else { 
		_delay = 0.01; 
	};
	_sitrep = _sitrep + _letter;
	MPSF_PROGBAR_TXT ctrlsetstructuredtext parsetext format[_sitrepFormat, _sitrep + "_"];
	sleep _delay;
};

if(isNil "mpsf_progressBar_sleepTimer") then {
	mpsf_progressBar_sleepTimer = 5;
	[] spawn {
		waitUntil{ 
			sleep 1;
			mpsf_progressBar_sleepTimer = mpsf_progressBar_sleepTimer - 1;
			(mpsf_progressBar_sleepTimer <= 0)
		};

		private _pos = ctrlPosition MPSF_PROGBAR_FG;
		private _pos set [2,0.02];

		MPSF_PROGBAR_BG ctrlSetFade 1;
		MPSF_PROGBAR_BG ctrlCommit 1;
		MPSF_PROGBAR_FG  ctrlSetFade 1;
		MPSF_PROGBAR_FG  ctrlSetPosition _pos;
		MPSF_PROGBAR_FG  ctrlCommit 1;
		MPSF_PROGBAR_TXT ctrlSetFade 1;
		MPSF_PROGBAR_TXT ctrlCommit 1;

		mpsf_progressBar_sleepTimer = nil;
	};
};

mpsf_progressBar_sleepTimer = 5;