/**
    Upgrade Tank Factory
    Upgrade Barracks
    Upgrade Air Factory
    Build Enemy Units
//*/

Zen_RTS_F_West_HQConstructor = {
    player sideChat str "West HQ constructor called";
    player sideChat str _this;

    _buildingData = _this select 0;
    _spawnPos = _this select 1;

    _assetsToAdd = [];
    _assetsToAddLocal = [];
    _assetsToAddLocal pushBack Zen_RTS_Asset_Tech_West_Enemy;

    ZEN_RTS_STRATEGIC_GET_BUILDING_OBJ_ID(Zen_RTS_BuildingType_West_TankFactory, _ID)
    if (_ID != "") then {
        _assetsToAdd pushBack Zen_RTS_Asset_Tech_West_Upgrade_TankFactory;
    };

    ZEN_RTS_STRATEGIC_GET_BUILDING_OBJ_ID(Zen_RTS_BuildingType_West_Barracks, _ID)
    if (_ID != "") then {
        _assetsToAdd pushBack Zen_RTS_Asset_Tech_West_Upgrade_Barracks;
    };

    ZEN_RTS_STRATEGIC_GET_BUILDING_OBJ_ID(Zen_RTS_BuildingType_West_AirFactory, _ID)
    if (_ID != "") then {
        _assetsToAdd pushBack Zen_RTS_Asset_Tech_West_Upgrade_AirFactory;
    };

    0 = [(_buildingData select 1), _assetsToAdd] call Zen_RTS_F_StrategicAddAssetGlobal;

    _args = [(_buildingData select 1), _assetsToAddLocal];
    ZEN_FMW_MP_RENonDedicated("Zen_RTS_F_StrategicAddAssetLocal", _args, call)

    sleep 1;
    _building = [_spawnPos, "Land_Research_HQ_F"] call Zen_SpawnVehicle;
    _building setVariable ["side", side player, true];

    // to-do: || false condition needs building hacking logic
    _args = ["addAction", [_building, ["Purchase Units", Zen_RTS_BuildMenu, (_buildingData select 0), 1, false, true, "", "((_target distance _this) < 15) && {(side _this == (_target getVariable 'side')) || (false)}"]]];
    ZEN_FMW_MP_REAll("Zen_ExecuteCommand", _args, call)
    (_building)
};

Zen_RTS_F_West_HQDestructor = {
    player sideChat str "West HQ destructor";

    _buildingObjData = _this select 0;
    deleteVehicle (_buildingObjData select 2);
};

Zen_RTS_BuildingType_West_HQ = ["Zen_RTS_F_West_HQConstructor", "Zen_RTS_F_West_HQDestructor", [], "HQ", "Cost: 1000, Time: 10,", 1000] call Zen_RTS_StrategicBuildingCreate;
(RTS_Used_Building_Types select 0) pushBack Zen_RTS_BuildingType_West_HQ;

/////////////////////////////////
// Assets
/////////////////////////////////

Zen_RTS_TechFlag_West_BuildEnemy = false;
publicVariable "Zen_RTS_TechFlag_West_BuildEnemy";
Zen_RTS_F_West_Tech_Enemy = {
    player sideChat "Build enemy east asset by west called";

    Zen_RTS_TechFlag_West_BuildEnemy = true;
    // publicVariable "Zen_RTS_TechFlag_West_BuildEnemy";

    _buildingData = _this select 0;
    _buildingObjID = _buildingData select 1;

    _dataLocal = [_buildingObjID] call Zen_RTS_StrategicBuildingObjectGetDataLocal;
    _assets = _dataLocal select 1;
    0 = [_assets, Zen_RTS_Asset_Tech_West_Enemy] call Zen_ArrayRemoveValue;

    {
        _typeData = [_x] call Zen_RTS_StrategicBuildingTypeGetData;

        _indexes = [Zen_RTS_Strategic_Building_Objects_Global, _x, 0] call Zen_ArrayGetNestedIndex;
        _objData = Zen_RTS_Strategic_Building_Objects_Global select (_indexes select 0);

        _level = _objData select 3;
        for "_i" from 0 to _level do {
            [_objData] call (missionNamespace getVariable ((_typeData select 3) select _i));
        };
    } forEach (RTS_Used_Building_Types select 0);
};

#define UPGRADE_CONSTRUCTOR(N, B, A) \
    N = { \
        player sideChat ("upgrade " + #N + " called"); \
        ZEN_RTS_STRATEGIC_GET_BUILDING_OBJ_ID(B, _ID) \
        _buildingDataHQ = _this select 0; \
        _buildingDataOther = [B, true] call Zen_RTS_StrategicBuildingObjectGetDataGlobal; \
        _typeDataOther = [(_buildingDataOther select 0)] call Zen_RTS_StrategicBuildingTypeGetData; \
        _level = _buildingDataOther select 3; \
        _maxLevel = count (_typeDataOther select 3); \
        if ((_level + 1) == _maxLevel) then { \
            _assets = _buildingDataHQ select 4; \
            0 = [_assets, A] call Zen_ArrayRemoveValue; \
        }; \
        0 = [(_buildingDataOther select 1)] call Zen_RTS_StrategicBuildingUpgrade; \
    };

UPGRADE_CONSTRUCTOR(Zen_RTS_F_West_Tech_Upgrade_TankFactory, Zen_RTS_BuildingType_West_TankFactory, Zen_RTS_Asset_Tech_West_Upgrade_TankFactory)
UPGRADE_CONSTRUCTOR(Zen_RTS_F_West_Tech_Upgrade_Barracks, Zen_RTS_BuildingType_West_Barracks, Zen_RTS_Asset_Tech_West_Upgrade_Barracks)
UPGRADE_CONSTRUCTOR(Zen_RTS_F_West_Tech_Upgrade_AirFactory, Zen_RTS_BuildingType_West_AirFactory, Zen_RTS_Asset_Tech_West_Upgrade_AirFactory)

Zen_RTS_Asset_Tech_West_Enemy = ["Zen_RTS_F_West_Tech_Enemy", "Build Enemy Units", "Cost: 50, Time: 10,", 50] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_Tech_West_Upgrade_TankFactory = ["Zen_RTS_F_West_Tech_Upgrade_TankFactory", "Upgrade Tank Factory", "Cost: 50, Time: 10,", 50] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_Tech_West_Upgrade_Barracks = ["Zen_RTS_F_West_Tech_Upgrade_Barracks", "Upgrade Barracks", "Cost: 50, Time: 10,", 50] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_Tech_West_Upgrade_AirFactory = ["Zen_RTS_F_West_Tech_Upgrade_AirFactory", "Upgrade Air Factory", "Cost: 50, Time: 10,", 50] call Zen_RTS_StrategicAssetCreate;
