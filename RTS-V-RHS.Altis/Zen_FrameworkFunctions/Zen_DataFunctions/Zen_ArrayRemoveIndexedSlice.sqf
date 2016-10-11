// This file is part of Zenophon's ArmA 3 Co-op Mission Framework
// This file is released under Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)
// See Legal.txt

#include "..\Zen_StandardLibrary.sqf";
#include "..\Zen_FrameworkLibrary.sqf";

_Zen_stack_Trace = ["Zen_ArrayRemoveIndexedSlice", _this] call Zen_StackAdd;
private ["_array", "_indexL", "_indexR", "_i", "_tempArray"];

if !([_this, [["ARRAY"], ["SCALAR"], ["SCALAR"]], [], 3] call Zen_CheckArguments) exitWith {
    call Zen_StackRemove;
};

_array = _this select 0;
_indexL = _this select 1;
_indexR = _this select 2;

_tempArray = [];

if (_indexL > _indexR) then {
    ZEN_STD_Code_SwapVars(_indexL, _indexR)
};

if (_indexL <= 0 || {_indexL >= count _array} || {_indexR <= 0} || {_indexR >= count _array}) exitWith {
    ZEN_FMW_Code_ErrorExitVoid("Zen_ArrayRemoveIndexedSlice", "One or mores indexes are out of bounds.")
};

for "_i" from 0 to (_indexL - 1) do {
    _tempArray pushBack (_array select _i);
};

for "_i" from (_indexR + 1) to (count _array - 1) do {
    _tempArray pushBack (_array select _i);
};

call Zen_StackRemove;
(_tempArray)
