/**
    Level 1:
        Zen_RTS_Asset_Ka60
        Zen_RTS_Asset_Mi8MT
    Level 2:
        Zen_RTS_Asset_Mi8MTV3
    Level 3:
        Zen_RTS_Asset_Ka52
//*/

// (_this select 1) : [array, spawn position, scalar, starting level]
Zen_RTS_F_East_AirFactoryConstructor = {
    player sideChat str "East Air_factory constructor called";
    player sideChat str _this;

    _buildingObjData = _this select 0;
    _args = _this select 1;

    _spawnPos = _args select 0;
    _level = _args select 1;
    _buildingTypeData = [(_buildingObjData select 0)] call Zen_RTS_StrategicBuildingTypeGetData;

    _assetsToAdd = [];
    _assetsToAdd pushBack Zen_RTS_Asset_Ka60;
    _assetsToAdd pushBack Zen_RTS_Asset_Mi8MT;

    // if (Zen_RTS_TechFlag_East_BuildEnemy) then {
        // ... to do
    // };

    {
        (RTS_Used_Asset_Types select 0) pushBack _x;
    } forEach _assetsToAdd;
    publicVariable "RTS_Used_Asset_Types";

    0 = [(_buildingObjData select 1), _assetsToAdd] call Zen_RTS_F_StrategicAddAssetGlobal;

    ZEN_RTS_STRATEGIC_GET_BUILDING_OBJ_ID(Zen_RTS_BuildingType_East_HQ, _ID)
    if (_ID != "") then {
        0 = [_ID, [Zen_RTS_Asset_Tech_East_Upgrade_AirFactory]] call Zen_RTS_F_StrategicAddAssetGlobal;
    };

    BUILDING_VISUALS("Land_Airport_Tower_F", 1)
    ZEN_RTS_STRATEGIC_BUILDING_DESTROYED_EH(Zen_RTS_BuildingType_East_AirFactory)

    // to-do: || false condition needs building hacking logic
    _args = ["addAction", [_building, ["Purchase Units", Zen_RTS_BuildMenu, (_buildingObjData select 0), 1, false, true, "", "((_target distance _this) < 15) && {(side _this == (_target getVariable 'side')) || (false)}"]]];
    ZEN_FMW_MP_REAll("Zen_ExecuteCommand", _args, call)
    (_building)
};

Zen_RTS_F_East_AirFactoryDestructor = {
    player sideChat str "East Air_factory destructor";

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

#define UPGRADE(N, A) \
N = { \
    player sideChat str (#N + " called"); \
    player sideChat str _this; \
    _buildingData = _this select 0; \
    _assetsToAdd = A; \
    if (Zen_RTS_TechFlag_East_BuildEnemy) then { \
    }; \
    { \
        (RTS_Used_Asset_Types select 1) pushBack _x; \
    } forEach _assetsToAdd; \
    publicVariable "RTS_Used_Asset_Types"; \
    0 = [(_buildingData select 1), _assetsToAdd] call Zen_RTS_F_StrategicAddAssetGlobal; \
    (true) \
};

#define ASSETS [Zen_RTS_Asset_Mi8MTV3]
UPGRADE(Zen_RTS_F_East_AirFactoryUpgrade01, ASSETS)

#define ASSETS [Zen_RTS_Asset_Ka52]
UPGRADE(Zen_RTS_F_East_AirFactoryUpgrade02, ASSETS)

Zen_RTS_BuildingType_East_AirFactory = ["Zen_RTS_F_East_AirFactoryConstructor", "Zen_RTS_F_East_AirFactoryDestructor", ["Zen_RTS_F_East_AirFactoryUpgrade01", "Zen_RTS_F_East_AirFactoryUpgrade02"], "Air Factory", "Cost: 2000, Time: 10,"] call Zen_RTS_StrategicBuildingCreate;
(RTS_Used_Building_Types select 1) pushBack  Zen_RTS_BuildingType_East_AirFactory;

/////////////////////////////////
// Assets
/////////////////////////////////

#define AIR_CONSTRUCTOR(N, T, U) \
    N = { \
        player sideChat str (#N + " asset constructor called"); \
        player sideChat str _this; \
        _buildingObjData = _this select 0; \
        _assetData = _this select 1; \
        _assetStrRaw = _assetData select 3; \
        _referenceUnit = _this select 2; \
        _manned = _this select 3; \
        _phi = 0; \
        _theta = 0; \
        _building = _buildingObjData select 2; \
        _pos = [_building, [20, 75], [], 1, [3, 15], 0, [1, 20, 0], 0, [1, 20], [1, 15, 10], [1, [0, 1, -1], 20], 0, 2] call Zen_FindGroundPosition; \
        sleep (call compile ([_assetStrRaw, "Time: ", ","] call Zen_StringGetDelimitedPart)); \
        _vehicle = [_pos, T, 0, getDir _building + _theta, false]  call Zen_SpawnVehicle; \
        ZEN_RTS_STRATEGIC_ASSET_DESTROYED_EH \
        if (_manned) then { \
            _crewGroup = [_vehicle, U] call Zen_SpawnGroup; \
            0 = [_crewGroup, "crew"] call Zen_SetAISkill; \
            0 = [_crewGroup, _vehicle, "All"] call Zen_MoveInVehicle; \
            (units _crewGroup) join _referenceUnit; \
            doStop (driver _vehicle); \
        }; \
    };

#define CREW_UNITS ["rhs_pilot_transport_heli", "rhs_pilot_transport_heli"]
AIR_CONSTRUCTOR(Zen_RTS_F_East_Asset_Ka60, "rhs_ka60_c", CREW_UNITS)

#define CREW_UNITS ["rhs_pilot_transport_heli", "rhs_pilot_transport_heli", "rhs_msv_rifleman", "rhs_msv_rifleman", "rhs_msv_rifleman"]
AIR_CONSTRUCTOR(Zen_RTS_F_East_Asset_Mi8MT, "RHS_Mi8mt_vvsc", CREW_UNITS)
AIR_CONSTRUCTOR(Zen_RTS_F_East_Asset_Mi8MTV, "RHS_Mi8MTV3_vvsc", CREW_UNITS)

#define CREW_UNITS ["rhs_pilot_combat_heli", "rhs_pilot_combat_heli"]
AIR_CONSTRUCTOR(Zen_RTS_F_East_Asset_Ka52, "RHS_Ka52_vvsc", CREW_UNITS)

Zen_RTS_Asset_Ka60 = ["Zen_RTS_F_East_Asset_Ka60", "Ka-60 Unarmed", "Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_Mi8MT = ["Zen_RTS_F_East_Asset_Mi8MT", "Mi-8 Unarmed", "Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_Mi8MTV3 = ["Zen_RTS_F_East_Asset_Mi8MTV", "Mi-8 Rockets", "Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_Ka52 = ["Zen_RTS_F_East_Asset_Ka52", "Ka-52", "Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
