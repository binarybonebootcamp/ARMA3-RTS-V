// This file is part of Zenophon's ArmA 3 Co-op Mission Framework
// This file is released under Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)
// See Legal.txt

#include "..\Zen_StandardLibrary.sqf"
#include "..\Zen_FrameworkLibrary.sqf"

_Zen_stack_Trace = ["Zen_CreateTemplate", _this] call Zen_StackAdd;
private ["_pos", "_radius", "_objRaw", "_objResult", "_center", "_objData", "_filterWithMarker", "_marker"];

if (count _this == 1) then {
    if !([_this, [["STRING"]], [], 1] call Zen_CheckArguments) exitWith {
        call Zen_StackRemove;
        ([])
    };

    _marker = _this select 0;

    _pos = getMarkerPos _marker;
    _radius = [markerSize _marker, {_this}] call Zen_ArrayFindExtremum;
    _filterWithMarker = true;
} else {
    if !([_this, [["VOID"], ["SCALAR"]], [], 2] call Zen_CheckArguments) exitWith {
        call Zen_StackRemove;
        ([])
    };

    _pos = [(_this select 0)] call Zen_ConvertToPosition;
    _radius = _this select 1;

    _filterWithMarker = false;
};

_objRaw = [];
_objResult = [];
_objData = [];

// if (_pos nearObjectsReady _radius) then {
    _objRaw = _pos nearObjects ["All", _radius];
// } else {
    // ZEN_FMW_Code_ErrorExitValue("Zen_CreateTemplate", "", ([]))
// };

if (_filterWithMarker) then {
    private ["_objRawFilter"];
    _objRawFilter = [];
    {
        if ([_x, _marker] call Zen_IsPointInPoly) then {
            _objRawFilter pushBack _x;
        };
    } forEach _objRaw;
    _objRaw = _objRawFilter;
};

{
    if ((getNumber (configFile >> "cfgVehicles" >> typeOf _x >> "Scope")) == 2) then {
        if !((_x isKindOf "Man") || {(_x isKindOf "EmptyDetector")}) then {
            _objResult pushBack _x;
        };
    };
} forEach (_objRaw - (nearestTerrainObjects [_pos, [], _radius]));

_center = [_objResult] call Zen_FindCenterPosition;
{
    _objData pushBack ([typeOf _x, (getPosATL _x) vectorDiff _center, getDir _x]);
} forEach _objResult;

call Zen_StackRemove;
(_objData)
