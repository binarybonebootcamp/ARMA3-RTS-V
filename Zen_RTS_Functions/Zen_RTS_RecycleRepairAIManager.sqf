//

#include "..\Zen_FrameworkFunctions\Zen_FrameworkLibrary.sqf"
#include "..\Zen_FrameworkFunctions\Zen_StandardLibrary.sqf"

#define CLEAN_WORKERS(A, O, V) \
    { \
        _array = A select _x; \
        _indexesToRemove = []; \
        { \
            if !(alive O) then { \
                _indexesToRemove pushBack _forEachIndex; \
                if (V && {!(isNull (_x select 2))}) then { \
                    (_x select 2) setVariable ["Zen_RTS_StrategicIsAIAssigned", false]; \
                }; \
            }; \
        } forEach _array; \
        ZEN_FMW_Array_RemoveIndexes(_array, _indexesToRemove) \
    } forEach [0, 1];

#define TASK_WORKERS(W, O, S, T) \
    _indexesToRemove = []; \
    _workerArray = W; \
    { \
        if (count _workerArray == 0) exitWith {}; \
        _repairQueueReady = []; \
        _condition = if (S == "Repair") then { \
            _repairQueueReady = [_workerArray, {(_this select 1)}] call Zen_ArrayFilterCondition; \
            (damage _x > 0.1) \
        } else { \
            _repairQueueReady = [_workerArray, {(_this select 1) || ((isNull (_this select 2)) || {!((_this select 0) in (_this select 2))})}] call Zen_ArrayFilterCondition; \
            (_x getVariable ["Zen_RTS_IsStrategicDebris", false]) \
        }; \
        if (_condition) then { \
            if (count _repairQueueReady == 0) exitWith {}; \
            diag_log ("Zen_RTS_RecycleRepairAIManager  All ready workers  " + S + "  " + T + str _repairQueueReady); \
            _assignedWorkerArray = [_repairQueueReady, compile format ["-1 * ((_this select 0) distanceSqr %1)", getPosATL _x]] call Zen_ArrayFindExtremum; \
            _globalIndex = [_assignedWorkerArray, _workerArray] call Zen_ValueFindInArray; \
            _assignedWorkerArray = _workerArray select 0; \
            diag_log ("Zen_RTS_RecycleRepairAIManager  selected task worker  " + S + "  " + T + str _assignedWorkerArray); \
            _assignedWorkerArray set [1, true]; \
            _assignedWorker = _assignedWorkerArray select 0; \
            0 = [_assignedWorkerArray, _x, _forEachIndex, _indexesToRemove] spawn { \
                _assignedWorkerArray = _this select 0; \
                _objToRepair = _this select 1; \
                _index = _this select 2; \
                _indexesToRemove = _this select 3; \
                _worker = _assignedWorkerArray select 0; \
                waitUntil { \
                    _worker move getPosATL _objToRepair; \
                    sleep 5; \
                    (([vehicle _worker, _objToRepair] call Zen_Find2dDistance) < 20) \
                }; \
                _assignedWorkerArray set [1, false]; \
                diag_log (S + " complete: " + str _objToRepair + str _assignedWorkerArray); \
                if ((S == "Recycle") || {S == "Repair" && (damage _objToRepair == 1)}) then { \
                    _indexesToRemove pushBack _index; \
                }; \
                _h_repair = [S, [T], true, _worker] spawn Zen_RTS_RecycleRepair; \
            }; \
        }; \
        sleep 0.2; \
    } forEach O; \
    ZEN_FMW_Array_RemoveIndexes(O, _indexesToRemove) \

sleep 10;
while {true} do {
    sleep 5;
    CLEAN_WORKERS(RTS_Worker_Repair_Queue, (_x select 0), true)
    CLEAN_WORKERS(RTS_Worker_Recycle_Queue, (_x select 0), true)
    CLEAN_WORKERS(RTS_CJ_Repair_Queue, _x, false)

    {
        _CJArray = RTS_CJ_Repair_Queue select _x;
        {
            _worker = _x select 0;
            _vehicle = _x select 2;
            if (isNull _vehicle) then {
                _nextAvailCJ = objNull;
                {
                    if !(alive _x) then {
                        _CJArray set [_forEachIndex, 0];
                    };
                    if ((alive _x) && (_x getVariable "Zen_RTS_StrategicIsAIOwned") && {!(_x getVariable "Zen_RTS_StrategicIsAIAssigned")}) exitWith {
                        _nextAvailCJ = _x;
                    };
                } forEach _CJArray;
                0 = [_CJArray, 0] call Zen_ArrayRemoveValue;

                if (!(isNull _nextAvailCJ) && {(alive _nextAvailCJ)}) then {
                    _x set [2, _nextAvailCJ];
                    _nextAvailCJ setVariable ["Zen_RTS_StrategicIsAIAssigned", true];
                    _worker assignAsDriver _nextAvailCJ;
                    [_worker] orderGetIn true;
                };
            } else {
                if !(_vehicle getVariable "Zen_RTS_StrategicIsAIOwned") then {
                    _vehicle setVariable ["Zen_RTS_StrategicIsAIAssigned", false];
                    ZEN_STD_OBJ_OrderGetOut([_worker], (_vehicle))
                    _x set [2, objNull];
                };
            };
        } forEach (RTS_Worker_Recycle_Queue select _x);
    } forEach [0, 1];

    TASK_WORKERS((RTS_Worker_Repair_Queue select 0), (RTS_Repair_Queue select 0), "Repair", "Building")
    TASK_WORKERS((RTS_Worker_Recycle_Queue select 0), (RTS_Recycle_Queue select 0), "Recycle", "Asset")

    TASK_WORKERS((RTS_Worker_Repair_Queue select 1), (RTS_Repair_Queue select 1), "Repair", "Building")
    TASK_WORKERS((RTS_Worker_Recycle_Queue select 1), (RTS_Recycle_Queue select 1), "Recycle", "Asset")
};
