// This file is part of Zenophon's ArmA 3 Co-op Mission Framework
// This file is released under Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)
// See Legal.txt

_Zen_stack_Trace = ["Zen_ShowLoadoutDialog", _this] call Zen_StackAdd;
private ["_object", "_index", "_kitArray", "_user", "_id"];

if !([_this, [["OBJECT"], ["OBJECT"], ["SCALAR"], ["ARRAY"]], [], 4] call Zen_CheckArguments) exitWith {
    call Zen_StackRemove;
};

_object = _this select 0;
_user = _this select 1;
_id = _this select 2;
_kitArray = _this select 3;

createDialog "Zen_LoadoutsDialog";
{
    _index = ((findDisplay 4000) displayCtrl 4002) lbAdd _x;
    ((findDisplay 4000) displayCtrl 4002) lbSetData [_index, _x];
} forEach _kitArray;

lbSetCurSel [4002, 0];
player setVariable ["Zen_LoadoutsDialogObject", _object];
_object setVariable ["Zen_LoadoutsDialogAction", _id];
_object setVariable ["Zen_LoadoutsDialogUser", _user];

call Zen_StackRemove;
if (true) exitWith {};