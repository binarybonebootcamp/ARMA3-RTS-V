/**
    Upgrade Tank Factory
    Upgrade Barracks
    Upgrade Air Factory
    Build Enemy Units
//*/

Zen_RTS_F_East_HQConstructor = {
    player sideChat str "East HQ constructor called";
    player sideChat str _this;

    _buildingObjData = _this select 0;
    _spawnPos = _this select 1;
    _buildingTypeData = [(_buildingObjData select 0)] call Zen_RTS_StrategicBuildingTypeGetData;

    _assetsToAdd = [];
    _assetsToAddLocal = [];
    _assetsToAddLocal pushBack Zen_RTS_Asset_Tech_East_Enemy;

    ZEN_RTS_STRATEGIC_GET_BUILDING_OBJ_ID(Zen_RTS_BuildingType_East_TankFactory, _ID)
    if (_ID != "") then {
        _assetsToAdd pushBack Zen_RTS_Asset_Tech_East_Upgrade_TankFactory;
    };

    ZEN_RTS_STRATEGIC_GET_BUILDING_OBJ_ID(Zen_RTS_BuildingType_East_Barracks, _ID)
    if (_ID != "") then {
        _assetsToAdd pushBack Zen_RTS_Asset_Tech_East_Upgrade_Barracks;
    };

    ZEN_RTS_STRATEGIC_GET_BUILDING_OBJ_ID(Zen_RTS_BuildingType_East_AirFactory, _ID)
    if (_ID != "") then {
        _assetsToAdd pushBack Zen_RTS_Asset_Tech_East_Upgrade_AirFactory;
    };

    ZEN_RTS_STRATEGIC_GET_BUILDING_OBJ_ID(Zen_RTS_BuildingType_East_NavalFactory, _ID)
    if (_ID != "") then {
        _assetsToAdd pushBack Zen_RTS_Asset_Tech_East_Upgrade_NavalFactory;
    };

    0 = [(_buildingObjData select 1), _assetsToAdd] call Zen_RTS_F_StrategicAddAssetGlobal;

    _args = [(_buildingObjData select 1), _assetsToAddLocal];
    ZEN_FMW_MP_RENonDedicated("Zen_RTS_F_StrategicAddAssetLocal", _args, call)

    sleep (call compile ([(_buildingTypeData select 5), "Time: ", ","] call Zen_StringGetDelimitedPart));
    _building = [_spawnPos, "Land_Research_HQ_F"] call Zen_SpawnVehicle;
    _building setVariable ["side", side player, true];

    ZEN_RTS_STRATEGIC_BUILDING_DESTROYED_EH(Zen_RTS_BuildingType_East_HQ)

    // to-do: || false condition needs building hacking logic
    _args = ["addAction", [_building, ["Purchase Technologies", Zen_RTS_BuildMenu, (_buildingObjData select 0), 1, false, true, "", "((_target distance _this) < 15) && {(side _this == (_target getVariable 'side')) || (false)}"]]];
    ZEN_FMW_MP_REAll("Zen_ExecuteCommand", _args, call)
    (_building)
};

Zen_RTS_F_East_HQDestructor = {
    player sideChat str "East HQ destructor";

    _buildingObjData = _this select 0;
    player commandChat str (_buildingObjData select 2);
    player commandChat str (isNull (_buildingObjData select 2));
    player commandChat str (alive (_buildingObjData select 2));
    player commandChat str (getPosATL (_buildingObjData select 2));

    // (_buildingObjData select 2) removeAllEventHandlers "Killed";
    (_buildingObjData select 2) setDamage 1;

    // _buildingTypeData = [(_buildingObjData select 0)] call Zen_RTS_StrategicBuildingTypeGetData;
    // _cost = call compile ([(_buildingTypeData select 5), "Cost: ", ","] call Zen_StringGetDelimitedPart);
    // playerMoney = playerMoney + _cost * ZEN_RTS_STRATEGIC_BUIDLING_DESTRUCTOR_REFUND_COEFF;
};

Zen_RTS_BuildingType_East_HQ = ["Zen_RTS_F_East_HQConstructor", "Zen_RTS_F_East_HQDestructor", [], "HQ", "Cost: 1000, Time: 10,"] call Zen_RTS_StrategicBuildingCreate;
(RTS_Used_Building_Types select 1) pushBack Zen_RTS_BuildingType_East_HQ;

/////////////////////////////////
// Assets
/////////////////////////////////

Zen_RTS_TechFlag_East_BuildEnemy = false;
publicVariable "Zen_RTS_TechFlag_East_BuildEnemy";
Zen_RTS_F_East_Tech_Enemy = {
    player sideChat "Build enemy east asset by East called";

    Zen_RTS_TechFlag_East_BuildEnemy = true;
    // publicVariable "Zen_RTS_TechFlag_East_BuildEnemy";

    _buildingObjData = _this select 0;
    _buildingObjID = _buildingObjData select 1;

    _dataLocal = [_buildingObjID] call Zen_RTS_StrategicBuildingObjectGetDataLocal;
    _assets = _dataLocal select 1;
    0 = [_assets, Zen_RTS_Asset_Tech_East_Enemy] call Zen_ArrayRemoveValue;

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
        _assetData = _this select 1; \
        _assetStrRaw = _assetData select 3; \
        _buildingDataOther = [B, true] call Zen_RTS_StrategicBuildingObjectGetDataGlobal; \
        _typeDataOther = [(_buildingDataOther select 0)] call Zen_RTS_StrategicBuildingTypeGetData; \
        _level = _buildingDataOther select 3; \
        _maxLevel = count (_typeDataOther select 3); \
        sleep (call compile ([_assetStrRaw, "Time: ", ","] call Zen_StringGetDelimitedPart)); \
        if ((_level + 1) == _maxLevel) then { \
            _assets = _buildingDataHQ select 4; \
            0 = [_assets, A] call Zen_ArrayRemoveValue; \
        }; \
        0 = [(_buildingDataOther select 1)] call Zen_RTS_StrategicBuildingUpgrade; \
    };

UPGRADE_CONSTRUCTOR(Zen_RTS_F_East_Tech_Upgrade_TankFactory, Zen_RTS_BuildingType_East_TankFactory, Zen_RTS_Asset_Tech_East_Upgrade_TankFactory)
UPGRADE_CONSTRUCTOR(Zen_RTS_F_East_Tech_Upgrade_Barracks, Zen_RTS_BuildingType_East_Barracks, Zen_RTS_Asset_Tech_East_Upgrade_Barracks)
UPGRADE_CONSTRUCTOR(Zen_RTS_F_East_Tech_Upgrade_Barracks_AirFactory, Zen_RTS_BuildingType_East_AirFactory, Zen_RTS_Asset_Tech_East_Upgrade_AirFactory)
UPGRADE_CONSTRUCTOR(Zen_RTS_F_East_Tech_Upgrade_Barracks_NavalFactory, Zen_RTS_BuildingType_East_NavalFactory, Zen_RTS_Asset_Tech_East_Upgrade_NavalFactory)

Zen_RTS_Asset_Tech_East_Enemy = ["Zen_RTS_F_East_Tech_Enemy", "Build Enemy Units", "Cost: 50, Time: 10,", "Commander"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_Tech_East_Upgrade_TankFactory = ["Zen_RTS_F_East_Tech_Upgrade_TankFactory", "Upgrade Tank Factory", "Cost: 50, Time: 10,", "Commander"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_Tech_East_Upgrade_Barracks = ["Zen_RTS_F_East_Tech_Upgrade_Barracks", "Upgrade Barracks", "Cost: 50, Time: 10,", "Commander"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_Tech_East_Upgrade_AirFactory = ["Zen_RTS_F_East_Tech_Upgrade_Barracks_AirFactory", "Upgrade Air Factory", "Cost: 50, Time: 10,", "Commander"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_Tech_East_Upgrade_NavalFactory = ["Zen_RTS_F_East_Tech_Upgrade_Barracks_NavalFactory", "Upgrade Naval Factory", "Cost: 50, Time: 10,", "Commander"] call Zen_RTS_StrategicAssetCreate;
