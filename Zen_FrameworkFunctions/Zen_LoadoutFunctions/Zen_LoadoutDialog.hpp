// This file is part of Zenophon's ArmA 3 Co-op Mission Framework
// This file is released under Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)
// See Legal.txt

class Zen_SimpleDialog {
    type = 0;
    style = 0;
    sizeEx = 0.03;
    font = "puristaMedium";
    text = "";
    colorText[] = {0, 0, 0, 1};
    colorBackground[] = {0, 0, 0, 0.75};
};

class Zen_SimpleButton {
    type = 1;
    style = "0x02 + 0x100";
    w = 0.1;
    h = 0.05;
    offsetX = 0.003;
    offsetY = 0.003;
    offsetPressedX = 0.002;
    offsetPressedY = 0.002;
    sizeEx = 0.05;
    borderSize = 0;
    font = "puristaMedium";
    colorText[] = {0.5, 0.5, 0.5, 1};
    colorDisabled[] = {0.4, 0.4, 0.4, 1};
    colorBackground[] = {1, 0.5, 0, 0.5};
    colorBackgroundActive[] = {1, 0.5, 0, 1};
    colorBackgroundDisabled[] = {0.9, 0.9, 0.9, 1};
    colorFocused[] = {1, 0.5, 0, 1};
    colorShadow[] = {0.05, 0, 0.05, 1};
    colorBorder[] = {0.05, 0, 0.05, 1}; 
    soundEnter[] = {"\a3\ui_f\data\Sound\RscButton\soundClick.wss", 0.1, 1};
    soundPush[] = {"\a3\ui_f\data\Sound\RscButton\soundClick.wss", 0.1, 1};
    soundClick[] = {"\a3\ui_f\data\Sound\RscButton\soundClick.wss", 0.1, 1};
    soundEscape[] = {"\a3\ui_f\data\Sound\RscButton\soundClick.wss", 0.1, 1};
};

class Zen_SimpleList {
    type = 5;
    style = "0 + 0x10";
    rowHeight = 0.05;
    sizeEx = 0.05;
    font = "puristaMedium";
    colorText[] = {0.5, 0.5, 0.5, 1};
    colorSelect[] = {0.9, 0.9, 0.9, 1};
    colorDisabled[] = {0.8, 0.8, 0.8, 1};
    class ListScrollBar {
        color[] = {0.5, 0.5, 0.5, 1};
        colorActive[] = {0.9, 0.9, 0.9, 1};
        colorDisabled[] = {0.8, 0.8, 0.8, 1};
        shadow = 0;
        thumb = "\a3\ui_f\data\gui\cfg\Scrollbar\thumb_ca.paa";
        arrowFull = "\a3\ui_f\data\gui\cfg\Scrollbar\arrowfull_ca.paa";
        arrowEmpty = "\a3\ui_f\data\gui\cfg\Scrollbar\arrowempty_ca.paa";
        border = "\a3\ui_f\data\gui\cfg\Scrollbar\border_ca.paa";
    };
    autoScrollRewind = 0;
    autoScrollDelay = 1;
    autoScrollSpeed = -1;
    maxHistoryDelay = 1.0;
    soundSelect[] = {};
};

class Zen_LoadoutsDialog {
    idd = 4000;
    class controls {
        class Zen_LoadoutsDialogBox : Zen_SimpleDialog {
            idc = 4001;
            x = 0;
            y = 0;
            w = 0.8;
            h = 0.9;
        };
        class Zen_DialogList : Zen_SimpleList {
            idc = 4002;
            x = 0.1;
            y = 0.1;
            w = 0.5;
            h = 0.7;
            onlbdblclick = "[] spawn Zen_LoadoutDialogEquip";
        };
        class Zen_OkButton : Zen_SimpleButton {
            idc = 4003;
            x = 0.65;
            y = 0.3;
            // text = "OK";
            text = $STR_disp_ok;
            onbuttonclick = "[] spawn Zen_LoadoutDialogEquip";
            default = 1;
        };
        class Zen_CancelButton : Zen_SimpleButton {
            idc = 4004;
            x = 0.65;
            y = 0.4;
            // text = "Cancel";
            text = $STR_disp_cancel;
            onbuttonclick = "closeDialog 4000";
        };
    };
};
