// This file is part of Zenophon's ArmA 3 Co-op Mission Framework
// This file is released under Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)
// See Legal.txt

#include "..\Zen_StandardLibrary.sqf"

_Zen_stack_Trace = ["Zen_ArrayFilterCondition", _this] call Zen_StackAdd;
private ["_array", "_condition", "_bool", "_returnArray", "_isRecursive"];

if !([_this, [["ARRAY"], ["CODE"], ["BOOL"]], [], 2] call Zen_CheckArguments) exitWith {
    call Zen_StackRemove;
    (0)
};

_array = _this select 0;
_condition = _this select 1;

ZEN_STD_Parse_GetArgumentDefault(_isRecursive, 2, false)

_returnArray = [];

{
    if (_isRecursive && {typeName _x == "ARRAY"}) then {
        _return = [_x, _condition, true] call Zen_ArrayFilterCondition;
        _returnArray pushBack _return;
    } else {
        _bool = (_x call _condition);
        if ((isNil "_bool" ) || {(typeName _bool != "BOOL")}) exitWith {
            0 = ["Zen_ArrayFilterCondition", "Given condition does not resolve to a boolean", _this] call Zen_PrintError;
            call Zen_StackPrint;
        };

        if !(_bool) then {
            _returnArray pushBack _x;
        };
    };
} forEach _array;

call Zen_StackRemove;
(_returnArray)
