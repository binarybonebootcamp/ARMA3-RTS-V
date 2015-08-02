// This file is part of Zenophon's ArmA 3 Co-op Mission Framework
// This file is released under Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)
// See Legal.txt

#include "Zen_StandardLibrary.sqf";
#include "Zen_FrameworkLibrary.sqf";

_Zen_stack_Trace = ["Zen_FindCenterPosition", _this] call Zen_StackAdd;
private ["_positions", "_coord", "_xMin", "_xMax", "_xDistArray", "_dist", "_minX", "_step"];

if !([_this, [["VOID"]], [], 1] call Zen_CheckArguments) exitWith {
    call Zen_StackRemove;
    ([0,0,0])
};

_positions = _this select 0;
_coord = [];

if (typeName _positions != "ARRAY") exitWith {
    ([_positions] call Zen_ConvertToPosition)
};

if (count _positions < 2) exitWith {
    ([_positions select 0] call Zen_ConvertToPosition)
};

{
    _positions set [_forEachIndex, ([_x] call Zen_ConvertToPosition)];
} forEach _positions;

{
    _xMin = ([_positions, (compile format ["-1 * (_this select %1)", _x])] call Zen_ArrayFindExtremum) select _x;
    _xMax = ([_positions, (compile format ["_this select %1", _x])] call Zen_ArrayFindExtremum) select _x;
    _xDistArray = [];

    _step = (_xMax - _xMin) / 200;
    for "_x0" from _xMin to _xMax step _step do {
        _dist = [_positions, (compile format ["abs((_this select %1) - %2)", _x, _x0])] call Zen_ArrayFindExtremum;
        _xDistArray pushBack [_x0, _dist select _x];
    };

    _minX = [_xDistArray, {-1 * (_this select 1)}] call Zen_ArrayFindExtremum;
    _coord set [_x, _minX select 0];
} forEach [0, 1];

call Zen_StackRemove;
(_coord)
