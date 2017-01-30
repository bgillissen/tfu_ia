/*
@filename: feats\vcomai\headlessPostInit.sqf
Author:
	Ben
Description:
	run on headless,
	init vcomAI
*/

//Variable for enabling/disabling skill changes for AI. True is on, False is off.
VCOM_AISkillEnabled = [false, true] select (["vcomai", "aiSkillEnabled"] call core_fnc_getSetting);
//Variable for finding out which config was loaded.
VCOM_AIConfig = "Mission Folder";
//Turn this on to see certain debug messages. 1 is on
VCOM_AIDEBUG = (["vcomai", "debug"] call core_fnc_getSetting);
//Turn on map markers that track AI movement
VCOM_UseMarkers = [false, true] select (["vcomai", "useMarkers"] call core_fnc_getSetting);
//Turns off VCOMAI for AI units in a players squad
NOAI_FOR_PLAYERLEADERS = (["vcomai", "noAIForPlayerLeader"] call core_fnc_getSetting);
//Will AI garrison static weapons nearby?
VCOM_STATICGARRISON = (["vcomai", "staticGarrison"] call core_fnc_getSetting);
//How far can the AI hear gunshots from?
VCOM_HEARINGDISTANCE = (["vcomai", "hearingDistance"] call core_fnc_getSetting);
//Should AI be able to call for artillery. 1 = YES 0 = NO
VCOM_Artillery = (["vcomai", "callArtillery"] call core_fnc_getSetting);
//Should we let AI use flanking manuevers? false means they can flank
VCOM_NOPATHING = [false, true] select (["vcomai", "noPathing"] call core_fnc_getSetting);
//Should AI use smoke grenades? Besides default A3 behavior?
VCOM_USESMOKE = [false, true] select (["vcomai", "useSmoke"] call core_fnc_getSetting);
//Chance of AI using grenades
VCOM_GRENADECHANCE = (["vcomai", "grenadeProb"] call core_fnc_getSetting);
//Should the AI lay mines?
VCOM_MineLaying = [false, true] select (["vcomai", "mineLaying"] call core_fnc_getSetting);
//Chance of AI to lay a mine.
VCOM_MineLayChance = (["vcomai", "mineLayingProb"] call core_fnc_getSetting);
//AI will automatically disembark from vehicles when in combat.
VCOM_AIDisembark = [false, true] select (["vcomai", "disembark"] call core_fnc_getSetting);
//How low should an AI's mag count be for them to consider finding more ammo? This DOES NOT include the mag loaded in the gun already.
VCOM_AIMagLimit = (["vcomai", "magLimit"] call core_fnc_getSetting);
//The longer an AI's target stays in 1 location, the more accurate and aware of the target the AI becomes.DEFAULT = [WEST,EAST,CIVILIAN,RESISTANCE];
VCOM_IncreasingAccuracy = [false, true] select (["vcomai", "increaseAccuracy"] call core_fnc_getSetting);
//VCOM_SideBasedMovement- Remove sides from the array below to force that specific AI side to not execute any advance movement code. (I.E. Moving to reinforce allies, being alerted by distant gunshots and etc). AI with this will still react normally in combat. DEFAULT = [WEST,EAST,CIVILIAN,RESISTANCE];
VCOM_SideBasedMovement = [WEST, EAST, RESISTANCE];
//VCOM_SideBasedExecution- Remove sides from the array below to remove that specific AI side from executing any of the VCOMAI scripts at all. DEFAULT = [WEST,EAST,CIVILIAN,RESISTANCE];
VCOM_SideBasedExecution = [WEST, EAST, RESISTANCE];
//Distance AI will respond to call of help from each other
VCOM_Unit_AIWarnDistance = (["vcomai", "warnDistance"] call core_fnc_getSetting);

VcomAI_ActiveList = [];

private _loopDelay = ["vcomai", "loopDelay"] call core_fnc_getSetting;

while { true } do {
	{
		if ( _x in VcomAi_ActiveList )  then {
			if ( (isNull _x) || !(alive _x) ) then { 
				VcomAi_ActiveList = VcomAi_ActiveList deleteAt _forEachIndex;
			};
		} else {
			if ( (local _x) && (_x getVariable ["NOAI", false]) && ((side _x) in VCOM_sideBasedExecution) ) then {
				[_x] execFSM "feats\vcomai\fsm\aiBehavior.fsm";
			};
			VcomAI_ActiveList pushback _x;
		};
	} forEach allUnits;
	sleep _loopDelay;
};