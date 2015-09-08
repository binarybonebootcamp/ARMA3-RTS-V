if !(isserver) exitwith {};

private ["_crewbuilding","_veh","_ss","_wep","_side","_enemy","_fired","_tarpos","_x","_mytarget","_range","_timeout","_state","_gx","_gy","_gz","_sidearray","_myside"];


_crewbuilding = _this select 0;
_veh = (vehicle _crewbuilding);
_ss = _veh weaponsTurret [0];
_wep = (_ss select 0);
_side = side _crewbuilding;
_enemy = [];
_sides = [];
_fired = 0;


if (_side == West) then {_sides = ["East","GUER"]};
if (_side == East) then {_sides = ["West","GUER"]};
if (_side == resistance) then {_sides = ["West","East"]};


	while {(alive _crewbuilding)} do 
	{

	waituntil {(!isnull (assignedTarget _crewbuilding))}; 


if (count _enemy == 0) then {
	{if (((_x select 0) distance _crewbuilding > 180) && !((_x select 1) iskindof "AIR") && !(isnull (_x select 4)) && (str(_x select 2) in _sides)) then {_enemy = _enemy + [(_x select 4)]}} foreach (_crewbuilding nearTargets 480);
};

_mytarget = if (count _enemy > 0) then {(_enemy select 0)}else{(assignedTarget _crewbuilding)};

		 if ((_mytarget distance _crewbuilding < 480) && (alive _mytarget) &&  (_mytarget distance _crewbuilding > 180)) then 
		{
		_tarpos = position _mytarget;
		_range = (1350 - (_mytarget distance _crewbuilding));
		_tarpos set[2,_range];
		_veh doWatch _tarpos;
		_fire = 0;
		_timeout = (time + 10);

				while {((_mytarget distance _crewbuilding < 480) && (alive _mytarget) &&  (_mytarget distance _crewbuilding > 180))} do 
				{
				_steady = 0;
				while {(_steady == 0)} do 
				{
				_tarpos = position _mytarget;
				_range = (1350 - (_mytarget distance _crewbuilding));
				_tarpos set[2,_range];
				_veh doWatch _tarpos;
				_state = _veh weaponDirection _wep; 
				_gx = _state select 0;
				_gy = _state select 1; 
				_gz = _state select 2; 
				sleep 0.2;
				_state = _veh weaponDirection _wep;
				if (((_gx == _state select 0) && (_gy == _state select 1) && (_gz == _state select 2)) or (time > _timeout)) then {_fire = 1;_steady = 1}; 
				};

					if ((_fire == 1) && (alive _mytarget)) then 
					{	
					_sidearray = (nearestObjects [_tarpos, ["Building","Camp_base","AllVehicles"],30]);
					_myside = [];
					{if (side _x == side _crewbuilding) then {_myside = _myside + [_x]}} foreach _sidearray;
	
						if ((alive _mytarget) && (count _myside == 0)) then 
						{
						_veh fire _wep;
						_fired = _fired + 1;
						if (_fired > 5) then {_fire = 0;_enemy = _enemy - [_mytarget];_mytarget = if (count _enemy > 0) then {(_enemy select 0)}else{(assignedTarget _crewbuilding)};_fired = 0};
						sleep 5;
						};
					};
				};
		}else{_enemy = _enemy - [_mytarget]};
	sleep 5;
	};
