//

#include "Zen_StandardLibrary.sqf"
#include "Zen_FrameworkLibrary.sqf"

#define ZEN_RTS_STRATEGIC_GET_BUILDING_OBJ_ID(N, I) \
    _objIndexes = [Zen_RTS_Strategic_Building_Objects_Global, N, 0] call Zen_ArrayGetNestedIndex; \
    I = ""; \
    if (count _objIndexes > 0) then { \
        _objData = Zen_RTS_Strategic_Building_Objects_Global select (_objIndexes select 0); \
        I = _objData select 1; \
    };

0 = _this spawn {
    _Zen_stack_Trace = ["Zen_RTS_BuildStructure", _this] call Zen_StackAdd;
    _idc = _this;

    _index = lbCurSel _idc;
    _text = lbText [_idc, _index];
    _type = lbData [_idc, _index];

    _buildingObjs = [Zen_RTS_Strategic_Building_Objects_Global, _type, 0] call Zen_ArrayGetNestedIndex;
    if (count _buildingObjs > 0) exitWith {
        player sideChat "This building type has already been constructed.";
    };

    _buildingData = [_type] call Zen_RTS_StrategicBuildingTypeGetData;
    _descrRaw = _buildingData select 5;
    _cost = call compile  ([_descrRaw, "Cost: ", ","] call Zen_StringGetDelimitedPart);
    if (playerMoney < _cost) exitWith {
        player sideChat "Insufficient funds.";
    };

    _buildingTypeHQ = missionNamespace getVariable ("Zen_RTS_BuildingType_" + (str side player) + "_HQ");
    ZEN_RTS_STRATEGIC_GET_BUILDING_OBJ_ID(_buildingTypeHQ, _ID)
    if ((_ID == "") && {_type != _buildingTypeHQ}) exitWith {
        player sideChat "HQ must be built first.";
    };

    cLoseDialog 0;
    playerMoney = playerMoney - _cost;

    hintSilent "When helipad appears,\nbuilding placement is valid\nUse confirm action to build";
    _heliPad = "Land_HelipadCivil_F" createVehicleLocal [0,0,0];
    _vehicle = vehicle player;

    Zen_RTS_Show_Preview = true;
    player addAction ["Confirm Building Placement", {Zen_RTS_Show_Preview = false; (_this select 0) removeAction (_this select 2);}];

    _objectType = [_descrRaw, "Classname", ","] call Zen_StringGetDelimitedPart;
    _objectType = if (_objectType == "") then {("Land_HelipadCivil_F")};

    scopeName "main";
    while {true} do {
        _pos = [_vehicle, 25, getDir _vehicle] call Zen_ExtendPosition;

        _slope = [_pos, 15] call Zen_FindTerrainSlope;
        _clutter = [_pos, 20] call Zen_GetAmbientClutterCount;
        _objects = nearestObjects [_pos, [""], 20];

        if ((_slope < 10) && (count _objects < 2) && {((_clutter vectorDotProduct [1, 1, 0]) < 2)}) then {
            _heliPad setPosATL _pos;
            if !(Zen_RTS_Show_Preview) then {
                _blfObjID = [_type, _pos] call Zen_RTS_StrategicBuildingInvoke;
                breakTo "main";
            };
        } else {
            _heliPad setPosATL [0,0,0];
            if !(Zen_RTS_Show_Preview) then {
                player sideChat "Building here is not allowed";
                breakTo "main";
            };
        };

        ZEN_STD_Code_SleepFrames(2)
    };

    deleteVehicle _heliPad;
    call Zen_StackRemove;
    if (true) exitWith {};
};

if (true) exitWith {};
