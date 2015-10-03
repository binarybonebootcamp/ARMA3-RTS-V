// from GUI

#include "Zen_StandardLibrary.sqf"
#include "Zen_FrameworkLibrary.sqf"
#define RECYCLE_COST_COEFF 0.5
#define REPAIR_COST_COEFF 0.5

#define ZEN_RTS_STRATEGIC_ASSET_DESTROYED_EH \
    _vehicle setVariable ["Zen_RTS_StrategicValue", (call compile ([_assetStrRaw, "Cost: ", ","] call Zen_StringGetDelimitedPart)), true]; \
    _vehicle setVariable ["Zen_RTS_IsStrategicRepairable", true, true]; \
    _vehicle setVariable ["Zen_RTS_StrategicType", "Asset", true]; \
    _vehicle setVariable ["Zen_RTS_StrategicAssetType", (_assetData select 0), true]; \
    (RTS_Recycle_Queue select (([west, east] find ([_vehicle] call Zen_GetSide)) max 0)) pushBack _vehicle; \
    _vehicle addEventHandler ["Killed", { \
        if ((damage (_this select 0)) > ZEN_RTS_STRATEGIC_DEBRIS_THRESHOLD) then { \
            (_this select 0) setVariable ["Zen_RTS_IsStrategicDebris", true, true]; \
            _vehicle setVariable ["Zen_RTS_IsStrategicRepairable", false, true]; \
        }; \
    }];

private ["_isAI", "_value"];

_actionType = _this select 0;
_stratTypes = _this select 1;
ZEN_STD_Parse_GetArgumentDefault(_isAI, 2, false)

_checkVar = "Zen_RTS_IsStrategicDebris";
if (_actionType == "Repair") then {
    _checkVar = "Zen_RTS_IsStrategicRepairable";
};

_nearestObj = objNull;
_objects = nearestObjects [getPosATL vehicle player, ["All"], 25];
_objects = [_objects, compile format ["_this distance %1", getPosATL vehicle player], "hash"] call Zen_ArraySort;

// player sideChat str _objects;
// player sideChat str _checkVar;
{
    if ((_x getVariable [_checkVar, false]) && {((_x getVariable ["Zen_RTS_StrategicType", ""]) in _stratTypes)}) exitWith {
        _nearestObj = _x;
    };
} forEach _objects;

if (isNull _nearestObj) exitWith {
    player groupChat "No valid object found.";
};

if (_actionType == "Repair") then {
    _value = (damage _nearestObj) * (_nearestObj getVariable "Zen_RTS_StrategicValue") * REPAIR_COST_COEFF;
} else {
    _value = (_nearestObj getVariable "Zen_RTS_StrategicValue") * RECYCLE_COST_COEFF;
};

if (_isAI) then {
    if (_actionType == "Repair") then {
        // if (playerMoney > _value) then {
            // playerMoney = playerMoney - _value;
            if (damage _nearestObj == 1) then {
                _assetType = _nearestObj getVariable "Zen_RTS_StrategicAssetType";
                _pos = getPosATL _nearestObj;
                _classname = typeOf _nearestObj;
                _dir = getDir _nearestObj;
                deleteVehicle _nearestObj;

                if (_assetType in [Zen_RTS_BuildingType_West_CJ, Zen_RTS_BuildingType_East_CJ]) then {
                    _args = [_assetType, [_pos, 0]];
                    ZEN_FMW_MP_REServerOnly("Zen_RTS_StrategicBuildingInvoke", _args, call)
                } else {
                    _assetData = ([_assetType] call Zen_RTS_StrategicAssetGetData);
                    _assetStrRaw = _assetData select 3;
                    _vehicle = [_pos, _classname, 0, _dir, true] call Zen_SpawnVehicle;
                    ZEN_RTS_STRATEGIC_ASSET_DESTROYED_EH
                };
            } else {
                _nearestObj setDamage 0;
            };
        // };
    } else {
        if (({alive _x} count (crew _nearestObj)) == 0) then {
            // playerMoney = playerMoney + _value;
            deleteVehicle _nearestObj;
        };
    };
} else {
    _text = _actionType + " " + (getText (configFile >> "cfgVehicles" >> (typeOf _nearestObj) >> "DisplayName")) + " for $" + (str round _value);
    closeDialog 0;
    createDialog "DlgConfirm";

    _idText = 1300;
    _idConfirm = 1305;
    _idCancel = 1315;

    ctrlSetText [_idText, _text];
    // ctrlSetText [_idConfirm, "Confirm"];
    // ctrlSetText [_idCancel, "Cancel"];

    buttonSetAction [_idConfirm, "Zen_RTS_RepairRecycleFlag = 1; closeDialog 0;"];
    buttonSetAction [_idCancel, "Zen_RTS_RepairRecycleFlag = 2; closeDialog 0;"];

    Zen_RTS_RepairRecycleFlag = 0;
    waitUntil {
        sleep 1;
        (Zen_RTS_RepairRecycleFlag in [1,2])
    };

    closeDialog 0;
    if (Zen_RTS_RepairRecycleFlag == 1) then {
        if (_actionType == "Repair") then {
            if (playerMoney > _value) then {
                playerMoney = playerMoney - _value;
                player groupChat ("You have paid: $" + (str round _value) + " to repair this object.");
                if (damage _nearestObj == 1) then {
                    _assetType = _nearestObj getVariable "Zen_RTS_StrategicAssetType";
                    _pos = getPosATL _nearestObj;
                    _classname = typeOf _nearestObj;
                    _dir = getDir _nearestObj;
                    deleteVehicle _nearestObj;

                    if (_assetType in [Zen_RTS_BuildingType_West_CJ, Zen_RTS_BuildingType_East_CJ]) then {
                        _args = [_assetType, [_pos, 0]];
                        ZEN_FMW_MP_REServerOnly("Zen_RTS_StrategicBuildingInvoke", _args, call)
                    } else {
                        _assetData = ([_assetType] call Zen_RTS_StrategicAssetGetData);
                        _assetStrRaw = _assetData select 3;
                        _vehicle = [_pos, _classname, 0, _dir, true] call Zen_SpawnVehicle;
                        ZEN_RTS_STRATEGIC_ASSET_DESTROYED_EH
                    };
                } else {
                    _nearestObj setDamage 0;
                };
            } else {
                player groupChat ("Insufficient funds, you need $" + (str round _value) + " to repair this object.");
            };
        } else {
            if (({alive _x} count (crew _nearestObj)) == 0) then {
                playerMoney = playerMoney + _value;
                player groupChat ("You have received: $" + (str round _value) + " from recycling this object.");
                deleteVehicle _nearestObj;
            } else {
                player groupChat ("You cannot recycle a vehicle with a crew in it!");
            };
        };
    };
    Zen_RTS_RepairRecycleFlag = nil;
};
