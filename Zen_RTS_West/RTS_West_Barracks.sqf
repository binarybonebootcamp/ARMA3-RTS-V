/**
    Level 1:
        Zen_RTS_Asset_West_Rifleman
        Zen_RTS_Asset_West_GLSoldier
        Zen_RTS_Asset_West_Autorifleman
        Zen_RTS_Asset_West_Medic
    Level 2:
        Zen_RTS_Asset_West_Marksman
        Zen_RTS_Asset_West_ATSoldier
        Zen_RTS_Asset_West_AASoldier
//*/

// (_this select 1) : Array, spawn position
Zen_RTS_F_West_BarracksConstructor = {
    player sideChat str "West barracks constructor called";
    player sideChat str _this;

    _buildingData = _this select 0;
    _spawnPos = _this select 1;

    _assetsToAdd = [];
    _assetsToAdd pushBack Zen_RTS_Asset_West_Rifleman;
    _assetsToAdd pushBack Zen_RTS_Asset_West_GLSoldier;
    _assetsToAdd pushBack Zen_RTS_Asset_West_Autorifleman;
    _assetsToAdd pushBack Zen_RTS_Asset_West_Medic;

    if (Zen_RTS_TechFlag_West_BuildEnemy) then {
        // ... to do 
    };

    {
        (RTS_Used_Asset_Types select 0) pushBack _x;
    } forEach _assetsToAdd;
    publicVariable "RTS_Used_Asset_Types";

    0 = [(_buildingData select 1), _assetsToAdd] call Zen_RTS_F_StrategicAddAssetGlobal;

    ZEN_RTS_STRATEGIC_GET_BUILDING_OBJ_ID(Zen_RTS_BuildingType_West_HQ, _ID)
    if (_ID != "") then {
        0 = [_ID, [Zen_RTS_Asset_Tech_West_Upgrade_Barracks]] call Zen_RTS_F_StrategicAddAssetGlobal;
    };

    sleep 1;
    _building = [_spawnPos, "Land_Cargo_House_V1_F"] call Zen_SpawnVehicle;
    _building setVariable ["side", side player, true];

    // to-do: || false condition needs building hacking logic
    _args = ["addAction", [_building, ["Purchase Units", Zen_RTS_BuildMenu, (_buildingData select 0), 1, false, true, "", "((_target distance _this) < 15) && {(side _this == (_target getVariable 'side')) || (false)}"]]];
    ZEN_FMW_MP_REAll("Zen_ExecuteCommand", _args, call)
    (_building)
};

Zen_RTS_F_West_BarracksDestructor = {
    player sideChat str "West barracks destructor";

    _buildingObjData = _this select 0;
    deleteVehicle (_buildingObjData select 2);
};

#define UPGRADE(N, A) \
N = { \
    player sideChat str #N + " called"; \
    player sideChat str _this; \
    _buildingData = _this select 0; \
    _assetsToAdd = A; \
    if (Zen_RTS_TechFlag_West_BuildEnemy) then { \
    }; \
    publicVariable "RTS_Used_Asset_Types"; \
    0 = [(_buildingData select 1), _assetsToAdd] call Zen_RTS_F_StrategicAddAssetGlobal; \
    (true) \
};

#define ASSETS [Zen_RTS_Asset_West_Marksman, Zen_RTS_Asset_West_ATSoldier]
UPGRADE(Zen_RTS_F_West_BarracksUpgrade01, ASSETS)

#define ASSETS [Zen_RTS_Asset_West_AASoldier]
UPGRADE(Zen_RTS_F_West_BarracksUpgrade02, ASSETS)

Zen_RTS_BuildingType_West_Barracks = ["Zen_RTS_F_West_BarracksConstructor", "Zen_RTS_F_West_BarracksDestructor", ["Zen_RTS_F_West_BarracksUpgrade01", "Zen_RTS_F_West_BarracksUpgrade02"], "Barracks", "C1000, T10, Ppictures\zen.paa,", 1000] call Zen_RTS_StrategicBuildingCreate;
(RTS_Used_Building_Types select 0) pushBack Zen_RTS_BuildingType_West_Barracks;

/////////////////////////////////
// Assets
/////////////////////////////////

#define INFANTRY_CONSTRUCTOR(N, T, S, W) \
    N = { \
        player sideChat str (#N + " asset constructor called"); \
        player sideChat str _this; \
        sleep W; \
        _group = [(_this select 2), T] call Zen_SpawnGroup; \
        0 = [_group, S] call Zen_SetAISkill; \
        (units _group) join (_this select 2); \
    };

INFANTRY_CONSTRUCTOR(Zen_RTS_F_West_AssetRifleman, "B_Soldier_02_f", "infantry", 10)
INFANTRY_CONSTRUCTOR(Zen_RTS_F_West_AssetGLSoldier, "B_Soldier_GL_F", "infantry", 10)
INFANTRY_CONSTRUCTOR(Zen_RTS_F_West_AssetAutorifleman, "B_soldier_AR_F", "infantry", 10)
INFANTRY_CONSTRUCTOR(Zen_RTS_F_West_AssetMedic, "B_medic_F", "infantry", 10)
INFANTRY_CONSTRUCTOR(Zen_RTS_F_West_AssetMarksman, "B_soldier_M_F", "infantry", 10)
INFANTRY_CONSTRUCTOR(Zen_RTS_F_West_AssetATSoldier, "B_soldier_AT_F", "infantry", 10)
INFANTRY_CONSTRUCTOR(Zen_RTS_F_West_AssetAASoldier, "B_soldier_AA_F", "infantry", 10)

Zen_RTS_Asset_West_Rifleman = ["Zen_RTS_F_West_AssetRifleman", "Rifleman", "C50, T10, Ob_soldier_02_f", 50] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_West_GLSoldier = ["Zen_RTS_F_West_AssetGLSoldier", "Grenadier", "C100, T10,", 100] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_West_Autorifleman = ["Zen_RTS_F_West_AssetAutorifleman", "Autorifleman", "C100, T10,", 100] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_West_Medic = ["Zen_RTS_F_West_AssetMedic", "Medic", "C150, T10,", 150] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_West_Marksman  = ["Zen_RTS_F_West_AssetMarksman", "Marksman", "C150, T10,", 150] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_West_ATSoldier = ["Zen_RTS_F_West_AssetATSoldier", "AT Soldier", "C150, T10,", 150] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_West_AASoldier = ["Zen_RTS_F_West_AssetAASoldier", "AA Soldier", "C150, T10,", 150] call Zen_RTS_StrategicAssetCreate;

