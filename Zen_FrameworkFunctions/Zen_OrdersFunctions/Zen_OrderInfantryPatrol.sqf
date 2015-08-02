// This file is part of Zenophon's ArmA 3 Co-op Mission Framework
// This file is released under Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)
// See Legal.txt

#include "Zen_StandardLibrary.sqf"
#include "Zen_FrameworkLibrary.sqf"

_Zen_stack_Trace = ["Zen_OrderInfantryPatrol", _this] call Zen_StackAdd;
private ["_grpsArray", "_movecenter", "_minx", "_maxx", "_mpos", "_man", "_MMDist", "_blackList", "_speedMode", "_limitAngles", "_target", "_behaviorMode", "_chaseEnemy", "_waterPosition", "_divers", "_joinWeak", "_joined"];

if !([_this, [["VOID"], ["ARRAY", "OBJECT", "GROUP", "STRING"], ["ARRAY"], ["ARRAY", "SCALAR"], ["STRING"], ["STRING"], ["BOOL"], ["BOOL"], ["BOOL"]], [[], [], ["STRING", "SCALAR"], ["SCALAR"]], 2] call Zen_CheckArguments) exitWith {
    call Zen_StackRemove;
};

_grpsArray = [(_this select 0)] call Zen_ConvertToGroupArray;
_movecenter = _this select 1;

_blackList = [];
_minx = 50;
_maxx = 200;

if !(typeName _movecenter == "String") then {
    if (count _this > 2) then {
        _MMDist = _this select 2;
        _minx = (_MMDist select 0);
        _maxx = (_MMDist select 1);
    };
} else {
    if (markerShape _movecenter == "ICON") then {
        _movecenter = [_movecenter] call Zen_ConvertToPosition;
        if (count _this > 2) then {
            _MMDist = _this select 2;
            _minx = (_MMDist select 0);
            _maxx = (_MMDist select 1);
        };
    } else {
        if (count _this > 2) then {
            _blackList = _this select 2;
        };
        _maxx = (((getMarkerSize _movecenter) select 1) + ((getMarkerSize _movecenter) select 0)) / 2;
    };
};

ZEN_STD_Parse_GetArgumentDefault(_limitAngles, 3, 0)
ZEN_STD_Parse_GetArgumentDefault(_speedMode, 4, "limited")
ZEN_STD_Parse_GetArgumentDefault(_behaviorMode, 5, "aware")
ZEN_STD_Parse_GetArgumentDefault(_chaseEnemy, 6, true)
ZEN_STD_Parse_GetArgumentDefault(_joinWeak, 7, false)
ZEN_STD_Parse_GetArgumentDefault(_divers, 8, false)

_waterPosition = 1;
if (_divers) then {
    _waterPosition = 2;
};

_grpsArray = [_grpsArray] call Zen_ArrayRemoveDead;
{
    private "_group";

    _group = _x;
    _man = leader _group;

    _mpos = [0,0,0];

    #define CALC_POS if (typeName _movecenter == "String") then { \
        _mpos = [_movecenter, 0,_blackList, _waterPosition, [1,50], _limitAngles] call Zen_FindGroundPosition; \
    } else { \
        if (([_man, _movecenter] call Zen_Find2dDistance) < _minx) then { \
            _mpos = [_movecenter, [_minx, _maxx], [], _waterPosition, [1,50], _limitAngles] call Zen_FindGroundPosition; \
        } else { \
            while {true} do { \
                _mpos = [_movecenter, [_minx, _maxx], [], _waterPosition, [1,50], _limitAngles] call Zen_FindGroundPosition; \
                if !([_man, (2 * _maxx), ([_man, _mpos] call Zen_FindDirection), _moveCenter, [_minx, _minx], 0, "ELLIPSE"] call Zen_IsRayInPoly) exitWith {}; \
            }; \
        }; \
    };

    CALC_POS
    _group = group _man;

    if !(isPlayer _man) then {
        if (_divers) then {
            _mpos set [2, -10];
            {
                _x swimInDepth -10;
            } forEach (units _group);
        };

        _group move _mpos;
        _group setCombatMode "Red";
        _group setSpeedMode _speedMode;
        if (side _group == civilian) then {
            _group setBehaviour "careless";
        } else {
            _group setBehaviour _behaviorMode;
        };
    };

} forEach _grpsArray;

while {(count _grpsArray != 0)} do {
    {
        private "_group";
        _group = _x;
        if (({alive _x} count (units _group)) > 0) then {
            _joined = false;

            if (_joinWeak && {(({alive _x} count (units _group)) < 3)}) then {
                _nearGroup = [_grpsArray - [_group], compile format["_this distanceSqr %1", getPosATL leader _group]] call Zen_ArrayFindExtremum;

                if (([_group, _nearGroup] call Zen_Find2dDistance) < 100) then {
                    _joined = true;
                    (units _group) join _nearGroup;
                };
            };

            if !(_joined) then {
                _man = leader _group;
                if ((unitReady _man) && {(alive _man)}) then {
                    _mpos = [0,0,0];

                    CALC_POS

                    if !(isPlayer _man) then {
                        if (_divers) then {
                            _mpos set [2, -10];
                            {
                                _x swimInDepth -10;
                            } forEach (units _group);
                        };

                        _group move _mpos;
                        _group setBehaviour _behaviorMode;
                        _group setCombatMode "Red";
                        _group setSpeedMode _speedMode;
                    };
                } else {
                    if (_chaseEnemy) then {
                        if (side _group == civilian) then {
                            {
                                civilian setFriend [_x, 0];
                            } forEach [west, east, resistance];
                            _target = _man findNearestEnemy _man;
                            {
                                civilian setFriend [_x, 1];
                            } forEach [west, east, resistance];
                        } else {
                            _target = _man findNearestEnemy _man;
                        };
                        if (!(isNull _target) && {((([_man, _target] call Zen_Find2dDistance) < (_maxx * 2)) && (_target isKindOf "Man"))}) then {
                            _mpos = [_target, (random (150 / ((_man knowsAbout _target) + 0.1))), (random 360)] call Zen_ExtendPosition;

                            if !(isPlayer _man) then {
                                if (_divers) then {
                                    _mpos set [2, -10];
                                    {
                                        _x swimInDepth -10;
                                    } forEach (units _group);
                                };

                                _man move _mpos;
                                _group setCombatMode "Red";
                                _group setSpeedMode _speedMode;
                                if (side _group == civilian) then {
                                    _group setBehaviour "careless";
                                };
                            };
                        };
                    };
                };
            };
        };
    } forEach _grpsArray;
    sleep 10;
    _grpsArray = [_grpsArray] call Zen_ArrayRemoveDead;
};

call Zen_StackRemove;
if (true) exitWith {};
