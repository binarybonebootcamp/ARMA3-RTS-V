if !(isserver) exitwith {};


private ["_array","_orders","_myorders"];

_myorders = {
_array = _this select 0;
_orders = _array select (count _array - 1);
_array set [(count _array - 1),-1];
_array call _orders;
};

while {true} do
{

waituntil {(!isnil {(server_object getvariable "serverorders")})};
_array = (server_object getvariable "serverorders");
[_array] spawn _myorders; 
server_object setVariable ["serverorders", nil, false];
};