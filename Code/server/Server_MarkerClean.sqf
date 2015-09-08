
private ["_who","_marker","_timeout"];

if !(isserver) exitwith {};

_who = _this select 0;
_marker = _this select 1;
_guard = _this select 2;
_side = side _guard;
_grp = group _who;
_grp setBehaviour "COMBAT";
_timeout = (time + 300);
_lazer = objnull;

if (!isnil {(_who getVariable "homebase")}) then {
_target = "";
_targetpos = [];

	switch (typeof _who) do
	{
	case MedicClass : {_targetpos = [0,0,0.4]};
	case RemoteUnitClass : {_targetpos = [0,0,3.5]};
	case DefenceClass : {_targetpos = [0,0,19]};
	case SoldierClass : {_targetpos = [0,0,1.2]};
	case CarClass : {_targetpos = [0,0,3.5]};
	case TruckClass : {_targetpos = [0,0,3.8]};
	case TankClass : {_targetpos = [0,0,10]};
	case HeliClass : {_targetpos = [0,0,13]};
	case PlaneClass : {_targetpos = [0,0,9]};
	case ShipClass : {_targetpos = [0,0,2.5]};
	case RemoteClass : {_targetpos = [0,0,7.5]};
	};


if (_side == West) then {_target = "LaserTargetW"};
if (_side == East) then {_target = "LaserTargetE"};
if (_side == resistance) then {_target = "LaserTargetC"};
_lazer = _target createVehicle (position _who);
_lazer attachTo [_who,_targetpos];
_lazer allowDamage false;
};


waituntil {((time > _timeout) or !(alive _who))};
_who setVariable [str(_who), nil, false];
vehicle _guard doWatch objnull;
vehicle _guard doTarget objnull;
_lazer allowDamage true;
deleteMarker _marker;
deletevehicle _lazer;

_guard disableAI "TARGET";
_guard disableAI "AUTOTARGET";
sleep 2;
_guard enableAI "TARGET";
_guard enableAI "AUTOTARGET";

