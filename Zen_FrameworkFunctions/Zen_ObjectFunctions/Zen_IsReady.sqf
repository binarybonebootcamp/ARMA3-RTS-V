// This file is part of Zenophon's ArmA 3 Co-op Mission Framework
// This file is released under Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)
// See Legal.txt

_Zen_stack_Trace = ["Zen_IsReady", _this] call Zen_StackAdd;
private ["_vehicle", "_isReady", "_crew"];

if !([_this, [["OBJECT"]], [], 1] call Zen_CheckArguments) exitWith {
    call Zen_StackRemove;
    (false)
};

_vehicle = _this select 0;

_isReady = true;
_crew = crew _vehicle - (assignedCargo _vehicle);

{
    if !(unitReady _x) exitWith {
        _isReady = false;
    };
} forEach (_crew + [_vehicle]);

call Zen_StackRemove;
(_isReady)
