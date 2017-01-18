class ais {
	realistic = 0;	//instant death of serious wound
	education = 3; 	//who can revive, 0 everybody, 1 everybody with faks and medikit, 2 only medics, 3 only medics with faks and medikit
	resistance = 1;	//damage resistance factor, 1 for default, higher to increase, lower to decrease
	noTFAR = 1; 	//disable TFAR communication when uncouncious
	noChat = 0;		//no chat when uncouncious
	mapMarker = 0;	//add an icon on map at the wounded location
	3dIcons = 1;	//in-game visible 3D icon to show you the position of the wounded
	blood = 1;		//generate extra blood particles
	impact = 1;		//visible impact effect
	showTimer = 1;	//show bleedout countdown
};
