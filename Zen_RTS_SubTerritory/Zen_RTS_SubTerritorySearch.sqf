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
private ["_side", "_data", "_markers"];

if !([_this, [["SIDE"], ["ARRAY"], ["ARRAY"], ["ARRAY"]], [[], ["SCALAR"], ["SCALAR"], ["SCALAR"]], 0] call Zen_CheckArguments) exitWith {
    call Zen_StackRemove;
    ([])
};

ZEN_STD_Parse_GetArgumentDefault(_side, 0, sideLogic)

// _levelsDef = [0, 100];
// ZEN_STD_Parse_GetArgumentDefault(_levels, 1, _levelsDef)

// _resourceDef = [0, 10^8];
// ZEN_STD_Parse_GetArgumentDefault(_resources, 2, _resourceDef)

// _fobDef = [0, 100];
// ZEN_STD_Parse_GetArgumentDefault(_fob, 3, _fobDef)

_markers = [];
{
    _data = _x;
    if (_side == sideLogic || {_side == (_data select 1)}) then {
        _markers pushBack (_data select 0);
    };
} forEach Zen_RTS_SubTerritory_Data;

call Zen_StackRemove;
(_markers)
