//function name:  PV_createFire.sqf
//Put this in init:   SET_GLOBALVAR = compile preprocessFileLineNumbers "JBOY\PV_createFire.sqf";
//Example call:   nul = [MYGLOBAL_VAR_NAME,true] call PV_createFire;  

private ["_attachToObj","_relPos","_timeout","_effectSize","_fireDamage"];
_attachToObj = _this select 0;   // Object to attach fire to.
_relPos      = _this select 1;   // Position relative to object where fire will attach
_timeout     = _this select 2;   // How many seconds the fire will last.  Zero is forever.
_effectSize  = _this select 3;   // Size of fire
_fireDamage  = _this select 4;   // How much damage per interval is applied to nearby objects. How often this is applied I don't know.

_global = _this select 0;    //object
_value = _this select 1;    //sound

// broadcast Public Variable
PVEH_createFire = [_attachToObj,_relPos,_timeout,_effectSize,_fireDamage];
 publicVariable "PVEH_createFire";

diag_log format ["_global=%1, _value=%2",_global, _value];
// run on current machine also if not dedi server

if (not isDedicated) then {
	nul=[ _attachToObj,_relPos,_timeout,_effectSize,_fireDamage ] execvm "JBOY_MOLO\JBOY_createFire.sqf";
};

true  