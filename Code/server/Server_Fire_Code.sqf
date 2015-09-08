

_rearm = {
private ["_veh"];

_veh = _this;

	while {(alive _veh)} do
	{
	_veh setVehicleAmmo 1;
	reload _veh;
	sleep 120;
	};
};

private ["_mortar","_veh","_ss","_wep","_target"];

_mortar = _this select 0;
_veh = (vehicle _mortar);
_veh spawn _rearm;

if !(_veh iskindof "StaticMortar") exitwith {};

_ss = _veh weaponsTurret [0];
_wep = (_ss select 0);


_mortar setskill 1;
_mortar setskill ["spotDistance",1];
_mortar setskill ["spotTime",1];
_mortar setskill ["aimingAccuracy",1];
_mortar setskill ["aimingSpeed",1];

	while {(alive _mortar)} do
	{
	waituntil {(!isnull (assignedTarget _veh))}; 

	_target = (assignedTarget _veh);
	_veh doWatch _target;
	_veh dotarget _target;

	waituntil {(((_veh aimedAtTarget [_target]) == 1) or (isnull (assignedTarget _veh)))};

	if ((_veh aimedAtTarget [_target]) == 1) then {_veh fire _wep;diag_log str(["FIRED",_target]);hint str(["FIRED",_target]);};
	sleep 7;
	};
