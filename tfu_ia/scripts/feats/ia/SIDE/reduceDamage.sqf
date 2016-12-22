/*
@filename: feats\ia\SIDE\reduceDamage.sqf
Credit:
	Quiksilver
Author:
	Ben
Description:
	this run on server,
	register an eventHlander on the given object and reduce the receive damage by a factor of 0.25
*/

params ["_obj"];
private _eh = _obj addEventHandler ["HandleDamage",
                      {
                          params ["_unit", "_selection", "_dmg"];
                          private _selections = _unit getVariable ["selections", []];
                          private _gethit = _unit getVariable ["gethit", []];
                          if !(_selection in _selections) then {
                        	  _selections append [_selection];
                        	  _gethit append [0];
                          };
                          private _i = _selections find _selection;
                          private _oldDamage = _gethit select _i;
                          private _damage = _oldDamage + (_dmg - _oldDamage) * 0.25;
                          _gethit set [_i, _damage];
                          _damage;
                      }
					 ];

_eh