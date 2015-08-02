/**
    Level 1:
        Zen_RTS_Asset_West_HEMTT_Repair
        Zen_RTS_Asset_West_Quadbike
        Zen_RTS_Asset_West_Offroad
    Level 2:
        Zen_RTS_Asset_West_OffroadArmed
        Zen_RTS_Asset_West_HunterHMG
//*/

// (_this select 1) : Array, spawn position
Zen_RTS_F_West_TankFactoryConstructor = {
    player sideChat str "West Tank_factory constructor called";
    player sideChat str _this;

    _buildingData = _this select 0;
    _spawnPos = _this select 1;

    _assetsToAdd = [];
    _assetsToAdd pushBack Zen_RTS_Asset_West_HEMTT_Repair;
    _assetsToAdd pushBack Zen_RTS_Asset_West_Quadbike;
    _assetsToAdd pushBack Zen_RTS_Asset_West_Offroad;
    _assetsToAdd pushBack Zen_RTS_Asset_West_M1025d;

    // if (Zen_RTS_TechFlag_West_BuildEnemy) then {
        // ... to do
    // };

    {
        (RTS_Used_Asset_Types select 0) pushBack _x;
    } forEach _assetsToAdd;
    publicVariable "RTS_Used_Asset_Types";

    0 = [(_buildingData select 1), _assetsToAdd] call Zen_RTS_F_StrategicAddAssetGlobal;

    ZEN_RTS_STRATEGIC_GET_BUILDING_OBJ_ID(Zen_RTS_BuildingType_West_HQ, _ID)
    if (_ID != "") then {
        0 = [_ID, [Zen_RTS_Asset_Tech_West_Upgrade_TankFactory]] call Zen_RTS_F_StrategicAddAssetGlobal;
    };

    sleep 10;
    _building = [_spawnPos, "Land_dp_smallFactory_F"] call Zen_SpawnVehicle;
    _building setVariable ["side", side player, true];

    // to-do: || false condition needs building hacking logic
    _args = ["addAction", [_building, ["Purchase Units", Zen_RTS_BuildMenu, (_buildingData select 0), 1, false, true, "", "((_target distance _this) < 15) && {(side _this == (_target getVariable 'side')) || (false)}"]]];
    ZEN_FMW_MP_REAll("Zen_ExecuteCommand", _args, call)
    (_building)
};

Zen_RTS_F_West_TankFactoryDestructor = {
    player sideChat str "West Tank_factory destructor";

    _buildingObjData = _this select 0;
    deleteVehicle (_buildingObjData select 2);
};

Zen_RTS_F_West_TankFactoryUpgrade01 = {
    player sideChat str "West Tank_factory update 01 called";
    player sideChat str _this;

    _buildingData = _this select 0;

    _assetsToAdd = [];
    _assetsToAdd pushBack Zen_RTS_Asset_West_OffroadArmed;
    _assetsToAdd pushBack Zen_RTS_Asset_West_HunterHMG;

    // if (Zen_RTS_TechFlag_West_BuildEnemy) then {
        // /// ... to do;
    // };

    {
        (RTS_Used_Asset_Types select 0) pushBack _x;
    } forEach _assetsToAdd;
    publicVariable "RTS_Used_Asset_Types";

    0 = [(_buildingData select 1), _assetsToAdd] call Zen_RTS_F_StrategicAddAssetGlobal;
    (true)
};

Zen_RTS_BuildingType_West_TankFactory = ["Zen_RTS_F_West_TankFactoryConstructor", "Zen_RTS_F_West_TankFactoryDestructor", ["Zen_RTS_F_West_TankFactoryUpgrade01"], "Tank factory", "C2000, T10,", 2000] call Zen_RTS_StrategicBuildingCreate;
(RTS_Used_Building_Types select 0) pushBack  Zen_RTS_BuildingType_West_TankFactory;

/////////////////////////////////
// Assets
/////////////////////////////////

#define VEHCILE_CONSTRUCTOR(N, T, W, U) \
    N = { \
        player sideChat str ("West " + T + " asset constructor called"); \
        player sideChat str _this; \
        _buildingObjData = _this select 0; \
        _assetData = _this select 1; \
        _referenceUnit = _this select 2; \
        _manned = _this select 3; \
        _phi = 0; \
        _theta = 0; \
        _building = _buildingObjData select 2; \
        _pos = [_building, 20, getDir _building + _phi] call Zen_ExtendPosition; \
        sleep W; \
        _vehicle = [_pos, T, 0, getDir _building + _theta, false]  call Zen_SpawnVehicle; \
        if (_manned) then { \
            _crewGroup = [_vehicle, U] call Zen_SpawnGroup; \
            0 = [_crewGroup, "crew"] call Zen_SetAISkill; \
            0 = [_crewGroup, _vehicle, "All"] call Zen_MoveInVehicle; \
            (units _crewGroup) join _referenceUnit; \
            doStop (driver _vehicle); \
        }; \
    };

#define CREW_UNITS ["rhsusf_army_ocp_driver", "rhsusf_army_ocp_rifleman"]
VEHCILE_CONSTRUCTOR(Zen_RTS_F_West_AssetM1025d, "rhsusf_m1025_d_m2", 10, CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_West_AssetOffroadArmed, "B_G_Offroad_01_armed_F", 10, CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_West_AssetHunterHMG, "B_MRAP_01_hmg_F", 10, CREW_UNITS)

#define CREW_UNITS ["rhsusf_army_ocp_driver"]
VEHCILE_CONSTRUCTOR(Zen_RTS_F_West_Asset_HEMTT_Repair, "B_Truck_01_Repair_F", 10, CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_West_Asset_Quadbike, "B_Quadbike_01_F", 10, CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_West_AssetOffroad, "B_G_Offroad_01_F", 10, CREW_UNITS)

Zen_RTS_Asset_West_HEMTT_Repair = ["Zen_RTS_F_West_Asset_HEMTT_Repair","Repair", "C100, T10,", 100] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_West_Quadbike = ["Zen_RTS_F_West_Asset_Quadbike", "Quadbike", "C200, T10,", 200] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_West_Offroad = ["Zen_RTS_F_West_AssetOffroad", "OffRoad", "C200, T10,", 200] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_West_OffroadArmed = ["Zen_RTS_F_West_AssetOffroadArmed", "OffRoad armed", "C200, T10,", 200] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_West_HunterHMG = ["Zen_RTS_F_West_AssetHunterHMG", "Hunter HMG","C200, T10,", 200] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_West_M1025d = ["Zen_RTS_F_West_AssetM1025d","M1025 (M2)", "C100, T10,", 100] call Zen_RTS_StrategicAssetCreate;
