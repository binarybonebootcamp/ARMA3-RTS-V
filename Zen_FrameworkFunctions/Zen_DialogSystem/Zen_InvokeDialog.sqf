// This file is part of Zenophon's ArmA 3 Co-op Mission Framework
// This file is released under Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)
// See Legal.txt

disableSerialization;
#include "Zen_FrameworkLibrary.sqf"
#include "Zen_StandardLibrary.sqf"

_Zen_stack_Trace = ["Zen_InvokeDialog", _this] call Zen_StackAdd;
private ["_dialogID", "_controlsArray", "_Zen_Dialog_Controls_Local", "_idcCur", "_display", "_controlData", "_controlType", "_controlBlocks", "_controlInstanClass", "_control", "_blockID", "_data"];

if !([_this, [["STRING"]], [], 1] call Zen_CheckArguments) exitWith {
    call Zen_StackRemove;
};

_dialogID = _this select 0;
_controlsArray = [_dialogID] call Zen_GetDialogControls;

_Zen_Dialog_Controls_Local = [];
_idcCur = 7600;
#define NEXT_IDC _idcCur]; _idcCur = _idcCur + 1;
#define GRID_DIVISION 0.025
#define COLOR_STEP 255
#define FONT_DIVISION 300

(findDisplay 76) closeDisplay 0;
closeDialog 0;

createDialog "Zen_Dialog";
_display = (findDisplay 46) createDisplay "Zen_Dialog";
{
    _controlID = _x;
    _controlData = [_controlID] call Zen_GetControlData;
    if (count _controlData > 0) then {
        _controlType = _controlData select 1;
        _controlBlocks = _controlData select 2;

        _controlInstanClass = switch (toUpper _controlType) do {
            case "BUTTON": {("RSCButton")};
            case "LIST": {("RscListBox")};
            case "TEXT": {("RscText")};
            default {("")};
        };

        if (_controlInstanClass != "") then {
            _control = _display ctrlCreate [_controlInstanClass, NEXT_IDC
            _Zen_Dialog_Controls_Local pushBack [_controlID, _control];
            {
                _blockID = _x select 0;
                _data = _x select 1;
                switch (toUpper _blockID) do {
                    case "TEXT": {
                        _control ctrlSetText _data;
                    };
                    case "FONT": {
                        _control ctrlSetFont _data;
                    };
                    case "FONTSIZE": {
                        _control ctrlSetFontHeight _data / FONT_DIVISION;
                    };
                    case "FONTCOLOR": {
                        if ((toUpper _controlType) == "LIST") then {
                            for "_i" from 0 to (lbSize _control - 1) do {
                                _control lbSetColor  [_i, [(_data select 0) / COLOR_STEP, (_data select 1) / COLOR_STEP, (_data select 2) / COLOR_STEP, (_data select 3) / COLOR_STEP]];
                            };
                        } else {
                            _control ctrlSetTextColor [(_data select 0) / COLOR_STEP, (_data select 1) / COLOR_STEP, (_data select 2) / COLOR_STEP, (_data select 3) / COLOR_STEP];
                        };
                    };
                    case "POSITION": {
                        _control ctrlSetPosition [(_data select 0) * GRID_DIVISION, (_data select 1) * GRID_DIVISION];
                        _control ctrlCommit 0;
                    };
                    case "SIZE": {
                        _oldPos = ctrlPosition _control;
                        _control ctrlSetPosition (([_oldPos, 0, 1] call Zen_ArrayGetIndexedSlice) + [(_data select 0) * GRID_DIVISION, (_data select 1) * GRID_DIVISION]);
                    };
                    case "ACTIVATIONFUNCTION": {
                        switch (toUpper _controlType) do {
                            case "BUTTON": {
                                _control buttonSetAction (format ["['%1', 'ActivationFunction'] spawn Zen_ExecuteEvent", _controlID]);
                            };
                            case "LIST": {
                                _control ctrlSetEventHandler ["LBDblClick", (format ["['%1', 'ActivationFunction'] spawn Zen_ExecuteEvent", _controlID])]
                            };
                        };
                    };
                    case "SELECTIONFUNCTION": {
                       if ((toUpper _controlType) == "LIST") then {
                            _control ctrlSetEventHandler ["LBSelChanged", (format ["['%1', 'SelectionFunction'] spawn Zen_ExecuteEvent", _controlID])]
                        };
                    };
                    case "LIST": {
                        if ((toUpper _controlType) == "LIST") then {
                            {
                                _control lbAdd _x;
                            } forEach _data;
                        };
                    };
                    default {};
                };
            } forEach _controlBlocks;

            if (_controlInstanClass in ["RscListBox"]) then {
                _control lbSetCurSel 0;
            };
            _control ctrlCommit 0;
        };
    };
} forEach _controlsArray;

uiNamespace setVariable ["Zen_Dialog_Object_Local", [_dialogID, _Zen_Dialog_Controls_Local]];

call Zen_StackRemove;
if (true) exitWith {};
