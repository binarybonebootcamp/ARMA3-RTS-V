
private ["_airport","_x","_dis","_unit"];

_airport = _this select 0;
_dis = _this select 1;
_unit = _this select 2;


//_c = "CraterLong" createVehicle _airport;

if (isserver) then 
{
	while {true} do
	{




	sleep 60;
	_craters = if (count (nearestObjects [_airport, ["CraterLong","CraterLong_small"], _dis]) > 0) then {(nearestObjects [_airport, ["CraterLong","CraterLong_small"], _dis])}else{[]};;


//hint str(_craters); 
	
		if (count _craters > 0) then { 
		//{if (!(isnull _x) && (local _x)) then {hideObjectGlobal _x}} foreach _craters;
		{_x hideObjectGlobal true} foreach _craters;
		{deletevehicle _x} foreach _craters;
		};

	};
};