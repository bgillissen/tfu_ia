// by psycho

if ( ((vehicle player) isEqualTo player) && (cameraView in ["INTERNAL", "EXTERNAL", "GUNNER"]) ) then {
	if (_this < 0.2) then { _this = 0.2 + (random 0.3); };
	if (_this > 5) then { _this = 4 + (random 1); };
	private _color = 1 - _this;
	addCamShake [(_this + 4), 0.4, 30];
	private _color = 1 - _this;
	if ( _color < 0.15 ) then { _color = 0.15; };
	// set color corrections
	"colorCorrections" ppEffectEnable true;
	"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, _color],  [1, 1, 1, 0.0]];
	"colorCorrections" ppEffectCommit 0;
	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [1.8];
	"dynamicBlur" ppEffectCommit 0;
	// set effect duration, depending on given damage
	"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 0.0]];
	"colorCorrections" ppEffectCommit _this;
	"dynamicBlur" ppEffectAdjust [0];
	"dynamicBlur" ppEffectCommit _this;
};

true