if (isserver) exitwith {};

				_veh_type = _this select 0;
				_missile_type = _this select 1;
				_pos = _this select 2;
				_posm = [];
				_posm = _posm + _pos; 
				_posm set [2,((_posm select 2) + 55)];
				_missile = nearestObject [_posm, _missile_type];
				_target = _this select 3;
				_veh = nearestObject [_pos, _veh_type];
				[_veh,_missile,_target] spawn Global_Guided_Code;
