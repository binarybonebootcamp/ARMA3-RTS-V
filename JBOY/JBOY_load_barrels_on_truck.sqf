// JBOY_load_barrels_on_truck.sqf
// nul = [flatbed2, 8] execVM "JBOY\JBOY_load_barrels_on_truck.sqf";

_flatbed     = _this select 0;
_barrelCount = _this select 1;
_barrelDamage = _this select 2;
if (_barrelCount > 8) then {_barrelCount = 8;};
// ******************************************************************************************************
// 8 positions for attaching barrels to a civilian flatbed track. Starting from rear most position.
// This still leaves room for 4 men to ride in back.
// ******************************************************************************************************
_posOnFlatbedArray = [ [-.5,-3,-.2],[ .5,-3,-.2],[ 0,-2.6,-.2],[ .5,-2.2,-.2],[-.5,-2.2,-.2],[0,-1.8,-.2],[ .5,-1.4,-.2],[-.5,-1.4,-.2] ];

TRUCKBARRELS = [_flatbed];
_barrels = [];
for "_i" from 0 to (_barrelCount - 1) do 
{
	_b = "Land_MetalBarrel_F" createvehicle [0,0,0];
	_b addeventhandler ["hit",{ [_this] execVM "JBOY\JBOY_barrel_boom.sqf";}]; 
	//_damage = (_barrelDamage + .5 - (random (10)/10));  
	_b setdamage _barrelDamage ; 
	_b attachto [_flatbed, _posOnFlatbedArray select _i];
	_barrels = _barrels + [_b];
} ;
//if (_flatbed == fueltruck1) then {TRUCKBARRELS = TRUCKBARRELS + [_barrels];};
TRUCKBARRELS = TRUCKBARRELS + [_barrels];
// ***************************************************************
// Lock all cargo positions, then unlock the four closest to the front of truck.
// 4 guys will fit in these positions, with the rest of the truck filled with 8 barrels.
// ***************************************************************
_flatbed lockCargo true; 
_flatbed lockCargo [0, false];
_flatbed lockCargo [1, false]; 
_flatbed lockCargo [2, false];
_flatbed lockCargo [3, false];

