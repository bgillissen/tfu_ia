// by EightSix
#define MPSF_PROGBAR_BG (uiNamespace getVariable "reviveProgressBar_gui_bg")
#define MPSF_PROGBAR_FG (uiNamespace getVariable "reviveProgressBar_gui_fg")
#define MPSF_PROGBAR_TXT (uiNamespace getVariable "reviveProgressBar_gui_txt")

disableSerialization;

private _display = uinamespace getvariable ["reviveProgressBar_gui", objNull];
if( isNull _display ) then {
	if ( isnil "reviveHudtext_n" ) then { reviveHudtext_n = 2733; };
	reviveHudtext_n cutRsc ["reviveProgressBar","plain"];
	reviveHudtext_n = reviveHudtext_n + 1;
	_display = uinamespace getvariable ["reviveProgressBar_gui", objNull];
};

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

private _sitrepFormat = (["revive", "progressBar"] call core_fnc_getSetting);
private _sitrepArray = toArray format[".....%1%", round (_this)];
private _sitrep = "";
private _delay = 0.01;
private _limit = (count _sitrepArray - 1);
for "_i" from 0 to _limit do {
	private _letter = _sitrepArray select _i;
	_sitrep = _sitrep + _letter;
	if ( _i < _limit ) then {
		MPSF_PROGBAR_TXT ctrlsetstructuredtext parsetext format[_sitrepFormat, _sitrep + "_"];
	} else {
		MPSF_PROGBAR_TXT ctrlsetstructuredtext parsetext format[_sitrepFormat, _sitrep];
	};
	sleep _delay;
};

if(isNil "reviveProgressBar_sleepTimer") then {
	reviveProgressBar_sleepTimer = 5;
	[] spawn {
		waitUntil{ 
			sleep 1;
			reviveProgressBar_sleepTimer = reviveProgressBar_sleepTimer - 1;
			(reviveProgressBar_sleepTimer <= 0)
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

		reviveProgressBar_sleepTimer = nil;
	};
};

reviveProgressBar_sleepTimer = 5;