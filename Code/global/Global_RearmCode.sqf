
private ["_veh"];



_veh = _this select 0;
if !(local _veh) exitwith {};

sleep .2;



_veh vehicleChat "MESSAGE: Armed and Repaired";
			_veh setfuel 1;
			_veh setVehicleAmmo 1;
			_veh setDamage 0;

