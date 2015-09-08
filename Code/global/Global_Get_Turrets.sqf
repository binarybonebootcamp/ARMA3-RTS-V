private ["_veh","_cfg","_tc","_turrets","_mti","_st","_stc","_sti","_stp","_mt"];

_veh = _this select 0;

_cfg = configFile >> "CfgVehicles" >> typeof _veh >> "turrets";
_tc = count _cfg;
_turrets = [];

if (typeof _veh == "M1A1") then {_turrets = [[0],[0,0]];_tc = 0;};



			if (_tc>0) then {
								
				for "_mti" from 0 to _tc-1 do 
				{
					_mt = (_cfg select _mti);
					
						if (isClass _mt) then 
						{	
						_st = _mt >> "turrets";
						_stc = count _st;
						_turrets = _turrets + [[_mti]];
		
							for "_sti" from 0 to _stc-1 do 
							{
							_stp = (_st select _sti);
							_turrets = _turrets + [[_mti,_sti]];
							};
						};
				};
			};



_turrets
