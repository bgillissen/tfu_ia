
private _rank = getNumber(missionConfigFile >> "settings" >> "environment" >> _this >> "rank");

( (player getVariable["MD_rank", 0]) >= _rank ) && !zeusMission )