// by psycho

if ( {( ((_x select 0) isEqualTo player) && ((_x select 1) isEqualTo _this) )} count reviveBleedStack > 0 ) exitWith {};

/*
 bodyParts:
 "neck", "head", "pelvis", "spine1", "spine2", "spine3", "body", "", "hands", "legs" 
 memPoints:
 aiming_axis, aimPoint, BubblesDir, BubblesEffect, camera, footstepL, footstepR, granat, granat2, 
 Head, head_axis, lankle, launcher, leaning_axis, LeftFoot, LeftForeArm, LeftForeArmRoll, LeftHand, 
 LeftHandMiddle1, LeftShoulder, lelbow, lelbow_axis, lfemur, lknee, lknee_axis, lwrist, Neck, Pelvis, 
 pilot, rankle, rearm, rearm2, relbow, relbow_axis, rfemur, RightFoot, RightForeArm, RightForeArmRoll, 
 RightHand, RightHandMiddle1, RightShoulder, rknee, rknee_axis, rwrist, Spine3, water_surface, Weapon
*/

private _memPoint = _this call {
	if ( _this isEqualTo "hands" ) exitWith { (selectRandom ["LeftHand", "lelbow", "lwrist", "RightHand", "LeftForeArm", "RightForeArm", "relbow", "rwrist"]) };
	if ( _this isEqualTo "legs" ) exitWith { (selectRandom ["LeftFoot", "lfemur", "lknee", "rfemur", "RightFoot", "rknee"]) };
	if ( _this isEqualTo "neck" ) exitWith { "Neck" };
	if ( _this isEqualTo "pelvis" ) exitWith { "Pelvis" };
	if ( _this isEqualTo "spine1" ) exitWith { "Pelvis" };
	if ( _this isEqualTo "spine2" ) exitWith { "Pelvis" };
	if ( _this isEqualTo "spine3" ) exitWith { "Spine3" };
	if ( _this isEqualTo "body" ) exitWith { (selectRandom ["LeftShoulder", "Rightshoulder", "aimPoint"]) };
	if ( _this isEqualTo "head" ) exitWith { "Head" };
	nil
};

if ( isNil "_memPoint" ) exitWith { diag_log "Unknown bodyPart"; };
//TODO find relativePosition for the other memPoints.
private _bodyPos = _memPoint call {
	if ( _this isEqualTo "aimPoint" ) exitWith { [(0.2 - random 0.3), 0, 0.1] };
	if ( _this isEqualto "Pelvis" ) exitWith { [0, 0, 0.2] };
	if ( _this isEqualTo "RightShoulder" ) exitWith { [0, 0, 0.1] };
	if ( _this isEqualTo "LeftShoulder" ) exitwith { [0, 0, 0.1] };
	if ( _this isEqualTo "Neck" ) exitWith { [0, 0.1, 0.4] };
	if ( _this isEqualTo "Head" ) exitWith { [0.05, 0.1, 0] };
	[0, 0, 0]
};

reviveBleedStack pushback [player, _bodyPart, _bodyPos, _memPoint];
publicVariable "reviveBleedStack";