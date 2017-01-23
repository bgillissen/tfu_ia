// by psycho

private _lifetime = 300;//TODO make this a setting

private _pos = player modelToWorld [-0.5,0.2,0];
private _defi = "Land_Defibrillator_F" createVehicle _pos;
_defi setPos _pos;
_defi setDir (getDir player - 180);
reviveHealEquipment pushback [_defi, 0];

if (damage _this >= 0.5 ) then {
	for "_i" from 1 to (1 + (round random 2)) do {
		private _pos = player modelToWorld [0.4, (0.2 - (random 0.5)), 0];
		private _bb = "Land_BloodBag_F" createVehicle _pos;
		_bb setPos _pos;
		_bb setDir (random 359);
		reviveHealEquipment pushback [_bb, time + _lifeTime];
	};
};

for "_i" from 1 to (1 + (round random 3)) do {
	private _pos = player modelToWorld [(random 1.3), (0.8 + (random 0.6)), 0];
	private _band = "Land_Bandage_F" createVehicle _pos;
	_band setPos  _pos;
	_band setDir (random 359);
	reviveHealEquipment pushback [_band, time + _lifeTime];
};

true