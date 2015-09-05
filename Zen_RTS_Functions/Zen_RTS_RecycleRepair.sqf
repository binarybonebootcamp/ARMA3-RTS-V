// from GUI

#define RECYCLE_COST_COEFF 0.5
#define REPAIR_COST_COEFF 0.5

0 = _this spawn {
    _actionType = _this select 0;
    _stratTypes = _this select 1;

    _checkVar = "Zen_RTS_IsStrategicDebris";
    if (_actionType == "Repair") then {
        _checkVar = "Zen_RTS_IsStrategicRepairable";
    };

    _nearestObj = objNull;
    _objects = nearestObjects [getPosATL vehicle player, ["All"], 25];
    _objects = [_objects, compile format ["_this distance %1", getPosATL vehicle player], "hash"] call Zen_ArraySort;

    player sideChat str _objects;
    // player sideChat str _checkVar;
    {
        if ((_x getVariable [_checkVar, false]) && {((_x getVariable ["Zen_RTS_StrategicType", ""]) in _stratTypes)}) exitWith {
            _nearestObj = _x;
        };
    } forEach _objects;

    if (isNull _nearestObj) exitWith {
        player groupChat "No valid object found.";
    };

    private ["_value"];
    if (_actionType == "Repair") then {
        _value = (damage _nearestObj) * (_nearestObj getVariable "Zen_RTS_StrategicValue") * REPAIR_COST_COEFF;
    } else {
        _value = (_nearestObj getVariable "Zen_RTS_StrategicValue") * RECYCLE_COST_COEFF;
    };

    _text = _actionType + " " + (getText (configFile >> "cfgVehicles" >> (typeOf _nearestObj) >> "DisplayName")) + " for $" + (str round _value);
    closeDialog 0;
    // createDialog "";
    // ctrlSetText [, _text];
    // ctrlSetText [, "Confirm"];
    // ctrlSetText [, "Cancel"];

    // buttonSetAction [, "Zen_RTS_RepairRecycleFlag = true; closeDialog 0;"];
    // buttonSetAction [, "Zen_RTS_RepairRecycleFlag = true; closeDialog 0;"];

    Zen_RTS_RepairRecycleFlag = true;
    waitUntil {
        sleep 2;
        (Zen_RTS_RepairRecycleFlag)
    };

    if (_actionType == "Repair") then {
        player groupChat ("You have paid: $" + (str round _value) + " to repair this object.");
        _nearestObj setDamage 0;
    } else {
        player groupChat ("You have received: $" + (str round _value) + " from recycling this object.");
        deleteVehicle _nearestObj;
    };
};
