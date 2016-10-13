// Supplied by MooseMan for Zenophon's ArmA 3 Co-op Mission Framework
// Edited for compatibility by Zenophon
// This file is part of Zenophon's ArmA 3 Co-op Mission Framework
// This file is released under Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)
// All terms of Legal.txt apply to this file, wherein 'author' shall refer to MooseMan

#include "..\Zen_StandardLibrary.sqf"
#include "..\Zen_FrameworkLibrary.sqf"

_Zen_stack_Trace = ["Zen_SpawnFlare", _this] call Zen_StackAdd;
private ["_pos", "_class", "_color", "_direction", "_elvAng", "_initVel" , "_windFactor"];

if !([_this, [["VOID"], ["STRING"], ["ARRAY", "SCALAR"], ["SCALAR"], ["SCALAR"], ["SCALAR"]], [[], [], ["SCALAR"]], 1] call Zen_CheckArguments) exitWith {
    call Zen_StackRemove;
    (objNull)
};

_pos = [(_this select 0)] call Zen_ConvertToPosition;

ZEN_STD_Parse_GetArgumentDefault(_color, 1, "white")

_color = toLower(_color);
switch (toUpper _color) do {
    case "WHITE" : {
        _class = "F_40mm_White";
    };
    case "RED" : {
        _class = "F_40mm_Red";
    };
    case "GREEN": {
        _class = "F_40mm_Green";
    };
    case "YELLOW": {
        _class = "F_40mm_Yellow";
    };
    case "IR": {
        _class = "F_40mm_CIR";
    };
    default {
        _class = "";
        ZEN_FMW_Code_Error("Zen_SpawnFlare", "Invalid color selection")
    };
};

if (_class == "") exitWith {
    (objNull)
};

if (count _this > 2) then {
    if ((typeName (_this select 2)) == "ARRAY") then {
        _initVel = (_this select 2) select 0;
        _direction = (_this select 2) select 1;
        _elvAng = (_this select 2) select 2;
        ZEN_STD_Parse_GetArgumentDefault(_windFactor, 3, 1)
    } else {
        ZEN_STD_Parse_GetArgumentDefault(_direction, 2, 0)
        ZEN_STD_Parse_GetArgumentDefault(_elvAng, 3, 15)
        ZEN_STD_Parse_GetArgumentDefault(_initVel, 4, 25)
        ZEN_STD_Parse_GetArgumentDefault(_windFactor, 5, 1)

        _direction = [_direction] call Zen_FindTrigAngle;
        // if (typeName _direction != "SCALAR") then {
          // _direction = 90 - ([_pos, ([_direction] call Zen_ConvertToPosition)] call Zen_FindDirection);
        // };
    };
} else {
    ZEN_STD_Parse_GetArgumentDefault(_direction, 2, 0)
    ZEN_STD_Parse_GetArgumentDefault(_elvAng, 3, 15)
    ZEN_STD_Parse_GetArgumentDefault(_initVel, 4, 25)
    ZEN_STD_Parse_GetArgumentDefault(_windFactor, 5, 1)
};

_flareFired = {
    _flare = _this select 0;
    _direction = _this select 1;
    _elvAng = _this select 2;
    _initVel = _this select 3;
    _windFactor = _this select 4;

    _windVector = ([(wind select 0), (wind select 1), (0)] vectorMultiply _windFactor);

    _vector = [_initVel, _direction, _elvAng];
    _initVector = ZEN_STD_Math_VectPolarCart(_vector);
    _vertVel = _initVector select 2;

    while {((getPos _flare) select 2) > 2} do {
        _velVector = [(_initVector select 0), (_initVector select 1), _vertVel];
        _velVector = _velVector vectorAdd _windVector;
        _flare setVelocity _velVector;
        _initVector = _initVector vectorMultiply 0.98;  // "Air-resistance" slows down (X/Y)-velocity
        if (_vertVel > -2) then {
          _vertVel = _vertVel - 0.5;
        };

        sleep 0.2;
    };
};

_flare = [_pos, _class, 3] call Zen_SpawnVehicle;
0 = [_flare, _direction, _elvAng, _initVel, _windFactor] spawn _flareFired;

call Zen_StackRemove;
(_flare)
