// This file is part of Zenophon's ArmA 3 Co-op Mission Framework
// This file is released under Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)
// See Legal.txt

_Zen_stack_Trace = ["Zen_StringGetDelimitedPart", _this] call Zen_StackAdd;
private ["_patternString", "_totalString", "_returnString", "_startIndex", "_startDelimiter", "_endDelimiter", "_i"];

if !([_this, [["STRING"], ["STRING"]], [], 2] call Zen_CheckArguments) exitWith {
    call Zen_StackRemove;
    (_this select 0)
};

_totalString = toArray (_this select 0);
_patternString = toArray (_this select 1);

_returnString = [];
_startIndex = -1;

_startDelimiter = _patternString select 0;
_endDelimiter = _patternString select 1;

if (count _totalString > 2) then {
    {
        if (_x == _startDelimiter) then {
            _startIndex = _forEachIndex;
        };
    } forEach _totalString;
    
    if (_startIndex >= 0) then {
        for "_i" from (_startIndex + 1) to (count _totalString - 1) do {
            if ((_totalString select _i) == _endDelimiter) exitWith {};
            _returnString pushBack (_totalString select _i);
        };
    };
} else {
    0 = ["Zen_StringGetDelimitedPart", "The given string is too short,  minimum 3 characters", _this] call Zen_PrintError;
    call Zen_StackPrint;
};

call Zen_StackRemove;
(toString _returnString)
