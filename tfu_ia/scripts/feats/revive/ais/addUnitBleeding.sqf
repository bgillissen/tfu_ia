// by psycho
params ["_bobyPart", "_damage"];


if ( {( ((_x select 0) isEqualTo _unit) && ((_x select 1) isEqualTo _bodyPart) )} count tcb_ais_bleedStack > 0 ) exitWith {};

/*
 bodyParts:
 "", "neck", "head", "pelvis", "spine1", "spine2", "spine3", "body", "", "hands", "legs" 
 memPoints:
 aiming_axis, aimPoint, BubblesDir, BubblesEffect, camera, footstepL, footstepR, granat, granat2, 
 Head, head_axis, lankle, launcher, leaning_axis, LeftFoot, LeftForeArm, LeftForeArmRoll, LeftHand, 
 LeftHandMiddle1, LeftShoulder, lelbow, lelbow_axis, lfemur, lknee, lknee_axis, lwrist, Neck, Pelvis, 
 pilot, rankle, rearm, rearm2, relbow, relbow_axis, rfemur, RightFoot, RightForeArm, RightForeArmRoll, 
 RightHand, RightHandMiddle1, RightShoulder, rknee, rknee_axis, rwrist, Spine3, water_surface, Weapon
*/
private _memPoint = _bodyPart call {
	if ( _bodyPart isEqualTo "" ) exitWith { "Neck" };
	if ( _bodyPart isEqualTo "hands" ) exitWith { (selectRandom ["LeftHand", "lelbow", "lwrist", "RightHand", "LeftForeArm", "RightForeArm", "relbow", "rwrist"]) };
	if ( _bodyPart isEqualTo "legs" ) exitWith { (selectRandom ["LeftFoot", "lfemur", "lknee", "rfemur", "RightFoot", "rknee"]) };
	if ( _bodyPart isEqualTo "neck" ) exitWith { "Neck" };
	if ( _bodyPart isEqualTo "pelvis" ) exitWith { "Pelvis" };
	if ( _bodyPart isEqualTo "spine1" ) exitWith { "Pelvis" };
	if ( _bodyPart isEqualTo "spine2" ) exitWith { "Pelvis" };
	if ( _bodyPart isEqualTo "spine3" ) exitWith { "Spine3" };
	if ( _bodyPart isEqualTo "body" ) exitWith { (selectRandom ["LeftShoulder", "Rightshoulder", "aimpoint"]) };
};
if ((random 100) < (_damage * 100)) then {
	//TODO find relativePosition for the other memPoints.
	private _bodyPos = [0, 0, 0];
	switch (_memPoint) do {
		case "aimpoint": {					// Brust
			_bodyPos = [(0.2 - random 0.3), 0, 0.1];
		};
		case "Pelvis": {					// Hüfte
			_bodyPos = [0, 0, 0.2];
		};
		case "RightShoulder": {				// Schulter rechts
			_bodyPos = [0, 0, 0.1];
		};
		case "Neck": {						// Nacken
			_bodyPos = [0, 0.1, 0.4];
		};
	};
	tcb_ais_bleedStack pushback [player, _bodyPart, _bodyPos, _memPoint];
	publicVariable "tcb_ais_bleedingStack";
};