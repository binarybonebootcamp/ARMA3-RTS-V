

private ["_veh","_gofrom","_goto","_side","_nearbyLocations","_markercolor","_MyLocations","_x","_my_hunt_pos"];


_veh = _this select 0;

if !(local _veh) exitwith {};

_side = _this select 1;

_nearbyLocations = [];

if (_veh isKindOf "SHIP") then {
_nearbyLocations = server_object getVariable "My_Water_Spots";
}else{
_nearbyLocations = server_object getVariable "My_Town_Spots";
};


_goto = gotoWP;
_gofrom = gofromWP;

if (_veh isKindOf "AIR") then {_gofrom = (gofromWP * 2);_goto = (gotoWP * 2)};
if (_veh isKindOf "SHIP") then {_gofrom = (gofromWP / 2);_goto = (gotoWP / 2)};

_markercolor = "coloryellow";
if (_side == West) then {_markercolor = "colorblue"};
if (_side == East) then {_markercolor = "colorred"};
if (_side == resistance) then {_markercolor = "colorgreen"};


_MyLocations = [];
{if ((_x distance _veh < _goto) && (_x distance _veh > _gofrom) && (getmarkercolor str(_x) != _markercolor)) then {_MyLocations = _MyLocations + [_x]}} foreach _nearbyLocations; 


if (count _MyLocations < 1) then {
{if (getmarkercolor str(_x) != _markercolor) then {_MyLocations = _MyLocations + [_x]}} foreach _nearbyLocations;
};

_my_hunt_pos = (_MyLocations select (floor(random (count _MyLocations))));

_my_hunt_pos



