//function name:  PV_switchmove.sqf
//Put this in init:   PV_switchmove = compile preprocessFileLineNumbers "JBOY\PV_switchmove.sqf";
//Example call:   nul = [dude,"somemove"] call PV_switchmove;  

private ["_dude","_anim"];
_dude = _this select 0;        
_anim = _this select 1;   

// broadcast Public Variable
PVEH_switchmove = [_dude, _anim];
 publicVariable "PVEH_switchmove";

// run on local machine
if (not isDedicated) then {
	_dude switchmove _anim;
};

true  