
private _date = ("real_date" callExtension "");

if ( isNil "_date" ) exitWith { [] };

if ( (typeName _date) isEqualTo "ARRAY" ) exitWith { _date };

[]