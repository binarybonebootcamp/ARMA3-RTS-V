if (isDedicated) exitwith {};

private ["_array","_orders","_myorders"];

server_object setVariable ["playerorders", nil, false];

_myorders = {
_array = _this select 0;
_orders = _array select (count _array - 1);
_array set [(count _array - 1),-1];
_array call _orders;
};



while {true} do
{

waituntil {(!isnil {(server_object getvariable "playerorders")})};
_array = (server_object getvariable "playerorders");
[_array] spawn _myorders; 
server_object setVariable ["playerorders", nil, false];

};



