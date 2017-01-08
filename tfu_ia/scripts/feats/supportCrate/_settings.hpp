class supportCrate {
	msgFrom = "HQ";
	msgAvail = "Support crate request is available.";
	msgDeployed = "%1 requested a support crate (%2), it has been deployed. An other one will be available in %3min.";
	checkDelay = 20;
	types[]={"fuel", "medic", "repair", "supply"};
	class actions {
		fuel = "<t color='#0000ff'>Request -- Fuel</t>";
		medic = "<t color='#0000ff'>Request -- Medical</t>";
		repair = "<t color='#0000ff'>Request -- Repair</t>";
		supply = "<t color='#0000ff'>Request -- Supply</t>";
	};
	class typeClass {
		fuel = "B_Slingload_01_Fuel_F";
		medic = "B_Slingload_01_Medevac_F";
		repair = "B_Slingload_01_Repair_F";
	};
};
