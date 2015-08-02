/**
    Level 1:
        Zen_RTS_F_West_Asset_Hummingbird
        Zen_RTS_F_West_Hummingbird_stripped
    Level 2:
         Zen_RTS_F_West_AH_9_Pawnee
         Zen_RTS_F_West_UH_80_Ghost
//*/

// (_this select 1) : Array, spawn position
Zen_RTS_F_West_AirFactoryConstructor = {
    player sideChat str "West Air_factory constructor called";
    player sideChat str _this;

    _buildingData = _this select 0;
    _spawnPos = _this select 1;

    _assetsToAdd = [];
    _assetsToAdd pushBack Zen_RTS_Asset_Hummingbird;
    _assetsToAdd pushBack Zen_RTS_Asset_Hummingbird_stripped;

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
        0 = [_ID, [Zen_RTS_Asset_Tech_West_Upgrade_AirFactory]] call Zen_RTS_F_StrategicAddAssetGlobal;
    };

    sleep 10;
    _building = [_spawnPos, "Land_Airport_Tower_F"] call Zen_SpawnVehicle;
    _building setVariable ["side", side player, true];

    // to-do: || false condition needs building hacking logic
    _args = ["addAction", [_building, ["Purchase Units", Zen_RTS_BuildMenu, (_buildingData select 0), 1, false, true, "", "((_target distance _this) < 15) && {(side _this == (_target getVariable 'side')) || (false)}"]]];
    ZEN_FMW_MP_REAll("Zen_ExecuteCommand", _args, call)
    (_building)
};

Zen_RTS_F_West_AirFactoryDestructor = {
    player sideChat str "West Air_factory destructor";

    _buildingObjData = _this select 0;
    deleteVehicle (_buildingObjData select 2);
};

Zen_RTS_F_West_AirFactoryUpgrade01 = {
    player sideChat str "West barracks update 01 called";
    player sideChat str _this;

    _buildingData = _this select 0;

    _assetsToAdd = [];
    _assetsToAdd pushBack Zen_RTS_Asset_AH_9_Pawnee;
    _assetsToAdd pushBack Zen_RTS_Asset_UH_80_Ghost;

    if (Zen_RTS_TechFlag_West_BuildEnemy) then {
        // ... to do;
    };

    {
        (RTS_Used_Asset_Types select 0) pushBack _x;
    } forEach _assetsToAdd;
    publicVariable "RTS_Used_Asset_Types";

    0 = [(_buildingData select 1), _assetsToAdd] call Zen_RTS_F_StrategicAddAssetGlobal;
    (true)
};

Zen_RTS_BuildingType_West_AirFactory = ["Zen_RTS_F_West_AirFactoryConstructor", "Zen_RTS_F_West_AirFactoryDestructor", ["Zen_RTS_F_West_AirFactoryUpgrade01"], "Air Factory", "C2000, T10,", 2000] call Zen_RTS_StrategicBuildingCreate;
(RTS_Used_Building_Types select 0) pushBack  Zen_RTS_BuildingType_West_AirFactory;

/////////////////////////////////
// Assets
/////////////////////////////////

#define AIR_CONSTRUCTOR(N, T, W, U) \
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
        _pos = [_building, [20, 75], [], 1, [3, 15], 0, [1, 20, 0], 0, [1, 20], [1, 15, 10], [1, [0, 1, -1], 20], 0, 2] call Zen_FindGroundPosition; \
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

#define CREW_UNITS ["rhsusf_army_ucp_helipilot", "rhsusf_army_ucp_helipilot"]
AIR_CONSTRUCTOR(Zen_RTS_F_West_Asset_Hummingbird_stripped, "B_Heli_Light_01_stripped_F", 10, CREW_UNITS)
AIR_CONSTRUCTOR(Zen_RTS_F_West_Asset_Hummingbird, "B_Heli_Light_01_F", 10, CREW_UNITS)
AIR_CONSTRUCTOR(Zen_RTS_F_West_Asset_AH_9_Pawnee, "B_Heli_Light_01_armed_F", 10, CREW_UNITS)

#define CREW_UNITS ["rhsusf_army_ucp_helipilot", "rhsusf_army_ucp_helipilot", "rhsusf_army_ucp_helicrew", "rhsusf_army_ucp_helicrew"]
AIR_CONSTRUCTOR(Zen_RTS_F_West_Asset_UH_80_Ghost, "RHS_UH60M", 10, CREW_UNITS)

Zen_RTS_Asset_Hummingbird = ["Zen_RTS_F_West_Asset_Hummingbird", "MH6 Little Bird", "C200, T10,", 200] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_Hummingbird_stripped = ["Zen_RTS_F_West_Asset_Hummingbird_stripped", "MH6 Little Bird", "C200, T10,", 200] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_AH_9_Pawnee = ["Zen_RTS_F_West_Asset_AH_9_Pawnee", "AH6 Little Bird", "C200, T10,", 200] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_UH_80_Ghost = ["Zen_RTS_F_West_Asset_UH_80_Ghost", "UH60 Blackhawk", "C200, T10,", 200] call Zen_RTS_StrategicAssetCreate;

