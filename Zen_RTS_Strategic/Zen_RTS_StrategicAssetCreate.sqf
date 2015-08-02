/**
    Zen_RTS_StrategicAssetCreate
    by Zenophon
    for RTS V
*/

#include "Zen_StandardLibrary.sqf"
#include "Zen_FrameworkLibrary.sqf"

_Zen_stack_Trace = ["Zen_RTS_StrategicAssetCreate", _this] call Zen_StackAdd;
private ["_constructor", "_name", "_description", "_identifier", "_access", "_cost"];

if !([_this, [["STRING"], ["STRING"], ["STRING"], ["SCALAR"], ["STRING"]], [], 4] call Zen_CheckArguments) exitWith {
    call Zen_StackRemove;
    ("")
};

_constructor = _this select 0;
_name = _this select 1;
_description = _this select 2;
_cost = _this select 3;
ZEN_STD_Parse_GetArgumentDefault(_access, 4, "All")

_identifier = "Zen_RTS_Strategic_Asset_Type_" + ([10] call Zen_StringGenerateRandom);

Zen_RTS_Strategic_Asset_Types pushBack [_identifier, "", "", "", 0, ""];
// publicVariable "Zen_RTS_Strategic_Asset_Types";

0 = [_identifier, _constructor, _name, _description, _cost, _access] call Zen_RTS_StrategicAssetUpdate;

call Zen_StackRemove;
(_identifier)
