
private ["_startbase","_unit","_My_HQ","_side"];

_unit = _this;

if !(local _unit) exitwith {};

_side = side _unit;
_My_HQ = (_unit getvariable "UINT_MY_HQ");




if ((_side == civilian) && (isplayer _unit)) then
{
if (str(_unit) in PlayerW) then {_side = West};
if (str(_unit) in PlayerE) then {_side = East};
if (str(_unit) in PlayerG) then {_side = resistance};
};


if (_side != civilian) then { 

if (!isnil {_My_HQ}) then 
{

	if (_My_HQ getvariable "Myside" != _side) then 
	{
	_startbase = [];
	if (_side == West) then {_startbase = (server_object getVariable "Weststart");};
	if (_side == East) then {_startbase = (server_object getVariable "Eaststart");};
	if (_side == resistance) then {_startbase = (server_object getVariable "guerstart");};

	_My_HQ = if (count _startbase > 0) then {(_startbase select 0)}else{_unit};
	_unit setvariable ["UINT_MY_HQ",_My_HQ,false];

	};

}else{
_side = side _unit;
_startbase = [];
if (_side == West) then {_startbase = (server_object getVariable "Weststart");};
if (_side == East) then {_startbase = (server_object getVariable "Eaststart");};
if (_side == resistance) then {_startbase = (server_object getVariable "guerstart");};

_My_HQ = if (count _startbase > 0) then {(_startbase select 0)}else{_unit};
_unit setvariable ["UINT_MY_HQ",_My_HQ,false];

};

		
}else{_My_HQ = _unit};


_My_HQ
