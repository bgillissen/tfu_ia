
{
	if (_x getVariable ["agony", false] && {_x distance player < 300}) then {
		drawIcon3D ["\A3\ui_f\data\map\mapcontrol\Hospital_CA.paa", 
		            [0.6,0.15,0,0.8], 
		            _x, 
		            0.5, 
		            0.5, 
		            0, 
		            format["%1 (%2m)", name _x, ceil (player distance _x)], 
		            0, 
		            0.02];
	};
} forEach( allPlayers -(entities 'headless_Client_F') );