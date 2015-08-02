/**
    Zen_RTS_TerritorySearch
    by Zenophon
    for RTS V

    Returns array of all territory markers that meet the given search parameters.
    Usage : Call
    Params: 1. (opt.) Side, the side of the territory, (default: sideLogic [All])
     (opt.) 2. Scalar, territory has a number of sub-markers > (2), (default: 0)
     (opt.) 3. Scalar, territory has a number of sub-markers < (3), (default: -1 [infinite])
    Return: Array of strings
//*/

#include "Zen_StandardLibrary.sqf"
#include "Zen_FrameworkLibrary.sqf"

_Zen_stack_Trace = ["Zen_RTS_TerritorySearch", _this] call Zen_StackAdd;
private ["_side", "_lowerSubMarkers", "_upperSubMarkers", "_subMarkerCount", "_markers", "_data"];

if !([_this, [["SIDE"], ["SCALAR"], ["SCALAR"], ["SIDE"]], [], 0] call Zen_CheckArguments) exitWith {
    call Zen_StackRemove;
    ([])
};

ZEN_STD_Parse_GetArgumentDefault(_side, 0, sideLogic)
ZEN_STD_Parse_GetArgumentDefault(_lowerSubMarkers, 1, 0)
ZEN_STD_Parse_GetArgumentDefault(_upperSubMarkers, 2, -1)

_markers = [];
{
    _data = _x;
    _subMarkerCount = count (_data select 2);
    if (_side == sideLogic || {_side == (_data select 1)}) then {
        if ((_lowerSubMarkers <= _subMarkerCount) && {((_upperSubMarkers < 0) || (_upperSubMarkers >= _subMarkerCount))}) then {
            _markers pushBack (_data select 0);
        };
    };
} forEach Zen_RTS_Territory_Data;

call Zen_StackRemove;
(_markers)
