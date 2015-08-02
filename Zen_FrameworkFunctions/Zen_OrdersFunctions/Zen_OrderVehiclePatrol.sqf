// This file is part of Zenophon's ArmA 3 Co-op Mission Framework
// This file is released under Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)
// See Legal.txt

#include "Zen_StandardLibrary.sqf"
#include "Zen_FrameworkLibrary.sqf"

_Zen_stack_Trace = ["Zen_OrderVehiclePatrol", _this] call Zen_StackAdd;
private ["_vehicleArray", "_movecenter", "_blackList", "_maxx", "_speedMode", "_mpos", "_limitAngles", "_vehDist", "_cleanupDead", "_crewGroupArray", "_crew"];

if !([_this, [["ARRAY", "OBJECT"], ["ARRAY", "OBJECT", "GROUP", "STRING"], ["ARRAY", "SCALAR"], ["ARRAY", "SCALAR"], ["STRING"], ["BOOL"]], [["OBJECT", "ARRAY"], [], ["STRING"], ["SCALAR"]], 2] call Zen_CheckArguments) exitWith {
    call Zen_StackRemove;
};

_vehicleArray = [(_this select 0)] call Zen_ConvertToObjectArray;
_movecenter = _this select 1;

if (typeName _vehicleArray != "ARRAY") then {
    _vehicleArray = [_vehicleArray];
};

_blackList = [];
_maxx = 500;
_speedMode = "limited";
_limitAngles = [0, 360];

if !(typeName _movecenter == "String") then {
    if (count _this > 2) then {
        _maxx = _this select 2;
    };
} else {
    if (markerShape _movecenter == "ICON") then {
        _movecenter = [_movecenter] call Zen_ConvertToPosition;
        if (count _this > 2) then {
            _maxx = _this select 2;
        };
    } else {
        if (count _this > 2) then {
            _blackList = _this select 2;
        };
    };
};

if (count _this > 3) then {
    _limitAngles = _this select 3;
};

if (count _this > 4) then {
    _speedMode = _this select 4;
};

ZEN_STD_Parse_GetArgumentDefault(_cleanupDead, 5, false)

_vehicleArray = [([_vehicleArray] call Zen_ConvertToObjectArray)] call Zen_ArrayRemoveDead;
_crewGroupArray = [];

{
    private "_veh";
    _veh = _x;
    _mpos = [0,0,0];
    _crewGroupArray pushBack (group driver _veh);

    _vehDist = [_veh, _movecenter] call Zen_Find2dDistance;
    #define CALC_POS \
    if (typeName _movecenter == "String") then { \
        _mpos = [_movecenter, 0,_blackList, 1, [1, 2*(((getMarkerSize _movecenter) select 0) max ((getMarkerSize _movecenter) select 1))], _limitAngles] call Zen_FindGroundPosition; \
    } else { \
        _mpos = [_movecenter, [0, _maxx], [], 1, [1, 2*_maxx], _limitAngles, 0, [1, _veh, _maxx / 4]] call Zen_FindGroundPosition; \
    };

    CALC_POS

    _veh move _mpos;
    _veh setBehaviour "aware";
    _veh setCombatMode "Red";
    _veh setSpeedMode _speedMode;
} forEach _vehicleArray;

while {(count _vehicleArray != 0)} do {
    {
        if (isNull _x) then {
            _vehicleArray set [_forEachIndex, 0];
            _crewGroupArray set [_forEachIndex, 0];
        } else {
            private "_veh";
            _veh = _x;
            if (!(alive _veh) || (({alive _x} count crew _veh) == 0)) then {
                _vehicleArray set [_forEachIndex, 0];
                _crew = _crewGroupArray select _forEachIndex;
                _crewGroupArray set [_forEachIndex, 0];
                if (_cleanupDead) then {
                    0 = [_veh, _crew] spawn {
                        sleep 60;
                        deleteVehicle (_this select 0);
                        {
                            deleteVehicle _x;
                        } forEach units (_this select 1);
                    };
                };
            } else {
                if ([_veh] call Zen_IsReady) then {
                    _mpos = [0,0,0];
                    _vehDist = [_veh, _movecenter] call Zen_Find2dDistance;

                    CALC_POS

                    _veh move _mpos;
                    _veh setBehaviour "aware";
                    _veh setCombatMode "Red";
                    _veh setSpeedMode _speedMode;
                };
            };
        };
    } forEach _vehicleArray;
    sleep 10;
    0 = [_vehicleArray, 0] call Zen_ArrayRemoveValue;
    0 = [_crewGroupArray, 0] call Zen_ArrayRemoveValue;
};

call Zen_StackRemove;
if (true) exitWith {};
