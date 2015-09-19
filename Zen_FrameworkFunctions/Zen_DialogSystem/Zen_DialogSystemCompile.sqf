// This file is part of Zenophon's ArmA 3 Co-op Mission Framework
// This file is released under Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)
// See Legal.txt

#include "Zen_FrameworkLibrary.sqf"
#include "Zen_StandardLibrary.sqf"

Zen_Dialog_Classes_Global = [];
Zen_Control_Classes_Global = [];
Zen_ActiveDialog = "";
uiNamespace setVariable ["Zen_Dialog_Object_Local", []];
/**
    Control Types:
        "Button"
        "List"
        "Text"

    Control Properties:
        "ActivationFunction"
        "SelectionFunction"
        "LinksTo"
        "Data"
        "Text"
        "Font"
        "FontColor"
        "FontSize"
        "Position"
        "Size"
        "List"
        "ListData"
//*/

Zen_LinkControl = compileFinal preprocessFileLineNumbers "Zen_FrameworkFunctions\Zen_DialogSystem\Zen_LinkControl.sqf";
Zen_CopyControl = compileFinal preprocessFileLineNumbers "Zen_FrameworkFunctions\Zen_DialogSystem\Zen_CopyControl.sqf";
Zen_CopyDialog = compileFinal preprocessFileLineNumbers "Zen_FrameworkFunctions\Zen_DialogSystem\Zen_CopyDialog.sqf";
Zen_CreateDialog = compileFinal preprocessFileLineNumbers "Zen_FrameworkFunctions\Zen_DialogSystem\Zen_CreateDialog.sqf";
Zen_CreateControl = compileFinal preprocessFileLineNumbers "Zen_FrameworkFunctions\Zen_DialogSystem\Zen_CreateControl.sqf";
Zen_ExecuteEvent = compileFinal preprocessFileLineNumbers "Zen_FrameworkFunctions\Zen_DialogSystem\Zen_ExecuteEvent.sqf";
Zen_InvokeDialog = compileFinal preprocessFileLineNumbers "Zen_FrameworkFunctions\Zen_DialogSystem\Zen_InvokeDialog.sqf";
Zen_GetControlData = compileFinal preprocessFileLineNumbers "Zen_FrameworkFunctions\Zen_DialogSystem\Zen_GetControlData.sqf";
Zen_GetDialogControls = compileFinal preprocessFileLineNumbers "Zen_FrameworkFunctions\Zen_DialogSystem\Zen_GetDialogControls.sqf";
Zen_RemoveControl = compileFinal preprocessFileLineNumbers "Zen_FrameworkFunctions\Zen_DialogSystem\Zen_RemoveControl.sqf";
Zen_RemoveDialog = compileFinal preprocessFileLineNumbers "Zen_FrameworkFunctions\Zen_DialogSystem\Zen_RemoveDialog.sqf";
Zen_UnlinkControl = compileFinal preprocessFileLineNumbers "Zen_FrameworkFunctions\Zen_DialogSystem\Zen_UnlinkControl.sqf";
Zen_UpdateControl = compileFinal preprocessFileLineNumbers "Zen_FrameworkFunctions\Zen_DialogSystem\Zen_UpdateControl.sqf";

Zen_CloseDialog = {
    uiNamespace setVariable ["Zen_Dialog_Object_Local", []];
    (findDisplay 76) closeDisplay 0;
    closeDialog 0;
};

Zen_RefreshDialog = {
    with uiNamespace do {
        missionNamespace setVariable ["Zen_ActiveDialog", Zen_Dialog_Object_Local select 0];
    };

    if (Zen_ActiveDialog != "") then {
        uiNamespace setVariable ["Zen_Dialog_Object_Local", []];
        0 = [Zen_ActiveDialog] spawn Zen_InvokeDialog;
    };
};

if (true) exitWith {};
