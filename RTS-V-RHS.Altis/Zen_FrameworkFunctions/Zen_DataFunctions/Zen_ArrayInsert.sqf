// This file is part of Zenophon's ArmA 3 Co-op Mission Framework
// This file is released under Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)
// See Legal.txt

#include "..\Zen_StandardLibrary.sqf";
#include "..\Zen_FrameworkLibrary.sqf";

_Zen_stack_Trace = ["Zen_ArrayInsert", _this] call Zen_StackAdd;
private ["_array", "_index", "_value", "_i"];

if !([_this, [["ARRAY"], ["SCALAR"], ["VOID"]], [], 3] call Zen_CheckArguments) exitWith {
    call Zen_StackRemove;
};

_array = _this select 0;
_index = _this select 1;
_value = _this select 2;

if (_index < 0 || {_index >= count _array}) exitWith {
    ZEN_FMW_Code_ErrorExitVoid("Zen_ArrayInsert", "Index is out of bounds.")
};

for "_i" from count _array to _index step -1 do {
    _array set [_i, (_array select (_i - 1))];
};

_array set [_index, _value];
call Zen_StackRemove;
if (true) exitWith {};
