
memberData = [];

[] spawn memberData_fnc_update;

if ( isNil "memberDataPVEH" ) then {
	memberDataPVEH = "memberData" addPublicVariableEventHandler {
		memberData = _this select 1;
	};
};