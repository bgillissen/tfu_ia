
tcb_ais_bleedStack = [];
publicVariable "tcb_ais_bleedStack";

if ( isNil "tcb_scorePVEH" ) then {
	tcb_scorePVEH = "tcb_score" addPublicVariableEventHandler {
		(_this select 1) params["_unit", "_score"];
		_unit addScore _score;
	};
};