
if !( player getVariable ['unit_is_unconscious', false] ) exitWith { true };

tcb_ais_FreeHeadMove = !( _key isEqualTo (actionKeys 'FreeHeadMove') );

true