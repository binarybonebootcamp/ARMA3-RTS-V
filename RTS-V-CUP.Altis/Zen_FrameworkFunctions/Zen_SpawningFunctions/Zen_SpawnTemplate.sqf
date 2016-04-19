// This file is part of Zenophon's ArmA 3 Co-op Mission Framework
// This file is released under Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)
// See Legal.txt

#include "..\Zen_StandardLibrary.sqf"
#include "..\Zen_FrameworkLibrary.sqf"

_Zen_stack_Trace = ["Zen_SpawnTemplate", _this] call Zen_StackAdd;
private ["_pos", "_template", "_objects", "_obj"];

if !([_this, [["VOID"], ["ARRAY"]], [[], ["ARRAY", "STRING", "SCALAR"]], 2] call Zen_CheckArguments) exitWith {
    call Zen_StackRemove;
    ([])
};

_pos = [(_this select 0)] call Zen_ConvertToPosition;
_template = _this select 1;

_objects = [];
{
    _obj = [(_x select 1) vectorAdd _pos, (_x select 0), 0, (_x select 2), true] call Zen_SpawnVehicle;
    _objects pushBack _obj;

    _obj allowDamage false;
    _obj enableSimulationGlobal false;
} forEach _template;

{
    _x allowDamage true;
} forEach _objects;

{
    _x enableSimulationGlobal true;
} forEach _objects;

call Zen_StackRemove;
(_objects)
