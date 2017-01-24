class revive {
	resistance = 1;			//damage resistance factor, 1 for default, higher to increase, lower to decrease
	bloodParticle = 1;				//generate extra blood particles
	bloodThreshold = 0.5	//damage at which a hit part start bleeding
	impact = 1;				//visible impact effect (white flash)
	showTimer = 1;			//show bleedout countdown
	deadCam = 1;			//camera span + quotes when player die
	class agony {
		//display a message when a unit enter agony mode (0 disabled, 1 side, 2 group)
		unitMode = 2;
		//message to display when a unit enter agony mode (%1 unit name, %2 grid position)
		unitMsg = "%1 is down, he needs help at %2";
		//display a message when all the units of a squad are in agony (0 disabled, 1 side, 2 group)
		squadMode = 1;
		//message to display when a all the units of a squad are in agony (%1 squad name)
		squadMsg = "%1 has been wiped!";
		//change the leader of a squad when his leader go down (restore it when he is back up)
		changeLeader = 1;
		//display a message when teamleader goes down, disabled if changeLeader is disabled, otherwise (0 disabled, 1 side, 2 group)
		leadMode = 2;
		//message to display when teamleader goes down (%1 new TL)
		leadMsg = "%1 is taking command";
	};
	class actions {
		drag = "<t color='#FC9512'>Drag %1</t>";
		carry = "<t color='#FC9512'>Carry %1</t>";
		drop = "<t color='#FC9512'>Drop %1</t>";
		help = "<t color='#FC9512'>Help %1</t>";
		heal = "<t color='#FF0000'>Revive %1</t>";
		load = "<t color='#FC9512'>Load %1</t>";
		unload = "<t color='#FC9512'>Unload %1</t>";
		vehHeal = "<t color='#FF0000'>Revive %1 (medEvac)</t>";
	};
	class heal {
		canceled = "";
		inprogress = "";
		garbageLifeTime = 600;
	};
	ripMessage = "We lost %1, R.I.P";
	dynamicText = "<t color='#fDCDBF6' font='PuristaMedium'>%1</t>";
	progressBar = "<t align='left' shadow='1'>Applying First Aid. : %1</t>";
	quote = "<t color='#ffffff'>%1</t><br/><br/><br/><t color='#ffffff'><t font='PuristaMedium'><t align='right'>%2</t></t></t>";
};
