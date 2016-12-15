/*
@filename: feats\vonHint\thread.sqf
Author:
	Ben
Description:
	This script is executed once on player side,
	must be spawn not called!
*/

if ( PARAMS_vonHint == 0 ) then exitWith{};

while {true} do {
	sleep 1800;
	_Ts_Hint = format["<t align='center'><t size='2'><t color='#FAAF3A'>Join us on TeamSpeak</t><br/><br/>_____________<br/><br/><t size='1.5'><t color='#FAAF3A'>%1<br/></t>", TSADDR];
	[_Ts_Hint] remoteExec ["common_fnc_globalHint",0,false];
	sleep 1800;
	_Ts_Hint = format["<t align='center'><t size='1.5'><t color='#FAAF3A'>VON is disabled</t><br/>  <t size='1.5'><br/>So instead join us on Teamspeak<br/>  <br/><t color='#FAAF3A'>%1<br/></t>", TSADDR];
	[_Ts_Hint] remoteExec ["common_fnc_globalHint",0,false];
};