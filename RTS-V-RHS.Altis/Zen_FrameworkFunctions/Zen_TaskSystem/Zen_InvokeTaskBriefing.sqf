// This file is part of Zenophon's ArmA 3 Co-op Mission Framework
// This file is released under Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)
// See Legal.txt

#include "..\Zen_FrameworkLibrary.sqf"
#include "..\Zen_StandardLibrary.sqf"

_Zen_stack_Trace = ["Zen_InvokeTaskBriefing", _this] call Zen_StackAdd;
private ["_units", "_descriptionLong", "_descriptionShort", "_destination", "_nameString", "_parentTask", "_taskIcon"];

if !([_this, [["VOID"], ["STRING"], ["STRING"], ["STRING"], ["VOID"], ["STRING"], ["STRING"]], [], 4] call Zen_CheckArguments) exitWith {
    call Zen_StackRemove;
};

_units = [(_this select 0)] call Zen_ConvertToObjectArray;
_descriptionLong = _this select 1;
_descriptionShort = _this select 2;
_nameString = _this select 3;

_destination = [0,0,0];

if (count _this > 4) then {
    if !([(_this select 4), 0] call Zen_ValuesAreEqual) then {
        _destination = [(_this select 4)] call Zen_ConvertToPosition;
    };
};

ZEN_STD_Parse_GetArgumentDefault(_parentTask, 5, "")
ZEN_STD_Parse_GetArgumentDefault(_taskIcon, 6, "default")

if (time > 0.1) exitWith {
    0 = ["Zen_InvokeTaskBriefing", "Use this function only during the briefing", _this] call Zen_PrintError;
    call Zen_StackPrint;
    call Zen_StackRemove;
};

Zen_Task_Array_Global pushBack [_nameString, _units, "created", _destination, _descriptionLong, _descriptionShort, _parentTask, [], _taskIcon];
0 = [_units, _descriptionLong, _descriptionShort, _destination, false, _nameString, _parentTask, _taskIcon] call Zen_InvokeTaskClient;

call Zen_StackRemove;
if (true) exitWith {};
