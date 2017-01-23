
if ( MOD_ace ) exitWith {};

reviveBleedStack = [];
publicVariable "reviveBleedStack";

if ( isNil "reviveScorePVEH" ) then {
	reviveScorePVEH = "reviveScore" addPublicVariableEventHandler {
		(_this select 1) params["_unit", "_score"];
		_unit addScore _score;
	};
};