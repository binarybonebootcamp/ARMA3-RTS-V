/* RTS_Recycle_Queue = [];
RTS_Repair_Queue = [];
RTS_Worker_Recycle_Queue = [];
RTS_Worker_Repair_Queue = [];
 */

#include "Zen_StandardLibrary.sqf"

while {true} do {
    sleep 5;
    #define TASK_WORKERS(W, O, S, T) \
        { \
            _condition = if (S == "Repair") then { \
                (damage _x > 0.1) \
            } else { \
                (_x getVariable ["Zen_RTS_IsStrategicDebris", false]) \
            }; \
            if (_condition) then { \
                player commandChat str W; \
                _repairQueueReady = [W, {(_this select 1)}] call Zen_ArrayFilterCondition; \
                player commandChat str _repairQueueReady; \
                if (count _repairQueueReady == 0) exitWith {}; \
                _assignedWorkerArray = [_repairQueueReady, compile format ["-1 * ((_this select 0) distanceSqr %1)", getPosATL _x]] call Zen_ArrayFindExtremum; \
                _globalIndex = [_assignedWorkerArray, W] call Zen_ValueFindInArray; \
                _assignedWorkerArray = W select 0; \
                player commandChat str _assignedWorkerArray; \
                _assignedWorkerArray set [1, true]; \
                _assignedWorker = _assignedWorkerArray select 0; \
                0 = [_assignedWorkerArray, _x] spawn { \
                    _assignedWorkerArray = _this select 0; \
                    _objToRepair = _this select 1; \
                    _worker = _assignedWorkerArray select 0; \
                    waitUntil { \
                        _worker move getPosATL _objToRepair; \
                        sleep 10; \
                        (([_worker, _objToRepair] call Zen_Find2dDistance) < 20) \
                    }; \
                    _h_repair = [S, [T], true] spawn Zen_RTS_RecycleRepair; \
                    ZEN_STD_Code_WaitScript(_h_repair) \
                    _assignedWorkerArray set [1, false]; \
                }; \
            }; \
        } forEach O;

    TASK_WORKERS(RTS_Worker_Repair_Queue, RTS_Repair_Queue, "Repair", "Building")
    sleep 5;
    TASK_WORKERS(RTS_Worker_Recycle_Queue, RTS_Recycle_Queue, "Recycle", "Asset")
};
