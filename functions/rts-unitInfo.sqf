private ["_unit","_uName","_uType","_uClass","_uVcl","_uVclType","_uVclName","_cPos"];

_unit = _this select 0;


//Get Unit Basic Info
_uName = name _unit;
_uType = typeOf _unit;
_uClass = getText (configFile >> "CfgVehicles" >> _uType >> "displayName");

if (isPlayer _unit) then {_uClass = format ["(%1) %2",Name Player,_uClass]};


//Unit vehicle if any
_uVcl = vehicle _unit;
_uVclType = typeOf vehicle _unit;
_uVclName = getText (configFile >> "CfgVehicles" >> _uVclType >> "displayName");

if (_uVcl == _unit) then {_uVclName = "On Foot"};

//Unit Position in Vehicle
_cPos = "";
if (_uVcl != _unit && _unit == driver _uVcl) then {_cPos = "Driver"};
if (_uVcl != _unit && _unit == gunner _uVcl) then {_cPos = "Gunner"};
if (_uVcl != _unit && _unit == commander _uVcl) then {_cPos = "Commander"};
if (_uVcl != _unit && !(_unit in [driver _uVcl,gunner _uVcl,commander _uVcl])) then {_cPos = "in Cargo"};

_uInfo = [_uClass,_uVclName,_cPos];

_uInfo