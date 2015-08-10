/**
    Level 1:
        Zen_RTS_Asset_East_Rifleman
        Zen_RTS_Asset_East_GLSoldier
        Zen_RTS_Asset_East_Autorifleman
        Zen_RTS_Asset_East_Medic
    Level 2:
        Zen_RTS_Asset_East_Marksman
        Zen_RTS_Asset_East_ATSoldier
        Zen_RTS_Asset_East_AASoldier
//*/

// (_this select 1) : Array, spawn position
Zen_RTS_F_East_BarracksConstructor = {
    player sideChat str "East barracks constructor called";
    player sideChat str _this;

    _buildingObjData = _this select 0;
    _spawnPos = _this select 1;
    _buildingTypeData = [(_buildingObjData select 0)] call Zen_RTS_StrategicBuildingTypeGetData;

    _assetsToAdd = [];
    _assetsToAdd pushBack Zen_RTS_Asset_East_Rifleman;
    _assetsToAdd pushBack Zen_RTS_Asset_East_GLSoldier;
    _assetsToAdd pushBack Zen_RTS_Asset_East_Autorifleman;
    _assetsToAdd pushBack Zen_RTS_Asset_East_Medic;

    if (Zen_RTS_TechFlag_East_BuildEnemy) then {
        // ... to do 
    };

    {
        (RTS_Used_Asset_Types select 0) pushBack _x;
    } forEach _assetsToAdd;
    publicVariable "RTS_Used_Asset_Types";

    0 = [(_buildingObjData select 1), _assetsToAdd] call Zen_RTS_F_StrategicAddAssetGlobal;

    ZEN_RTS_STRATEGIC_GET_BUILDING_OBJ_ID(Zen_RTS_BuildingType_East_HQ, _ID)
    if (_ID != "") then {
        0 = [_ID, [Zen_RTS_Asset_Tech_East_Upgrade_Barracks]] call Zen_RTS_F_StrategicAddAssetGlobal;
    };

    sleep (call compile ([(_buildingTypeData select 5), "Time: ", ","] call Zen_StringGetDelimitedPart));
    _building = [_spawnPos, "Land_Cargo_House_V1_F"] call Zen_SpawnVehicle;
    _building setVariable ["side", side player, true];

    ZEN_RTS_STRATEGIC_BUILDING_DESTROYED_EH(Zen_RTS_BuildingType_East_Barracks)

    // to-do: || false condition needs building hacking logic
    _args = ["addAction", [_building, ["Purchase Units", Zen_RTS_BuildMenu, (_buildingObjData select 0), 1, false, true, "", "((_target distance _this) < 15) && {(side _this == (_target getVariable 'side')) || (false)}"]]];
    ZEN_FMW_MP_REAll("Zen_ExecuteCommand", _args, call)
    (_building)
};

Zen_RTS_F_East_BarracksDestructor = {
    player sideChat str "East barracks destructor";

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
    _buildingObjData = _this select 0; \
    _assetsToAdd = A; \
    if (Zen_RTS_TechFlag_East_BuildEnemy) then { \
    }; \
    { \
        (RTS_Used_Asset_Types select 1) pushBack _x; \
    } forEach _assetsToAdd; \
    publicVariable "RTS_Used_Asset_Types"; \
    0 = [(_buildingObjData select 1), _assetsToAdd] call Zen_RTS_F_StrategicAddAssetGlobal; \
    (true) \
};

#define ASSETS [Zen_RTS_Asset_East_Marksman, Zen_RTS_Asset_East_ATSoldier]
UPGRADE(Zen_RTS_F_East_BarracksUpgrade01, ASSETS)

#define ASSETS [Zen_RTS_Asset_East_AASoldier]
UPGRADE(Zen_RTS_F_East_BarracksUpgrade02, ASSETS)

Zen_RTS_BuildingType_East_Barracks = ["Zen_RTS_F_East_BarracksConstructor", "Zen_RTS_F_East_BarracksDestructor", ["Zen_RTS_F_East_BarracksUpgrade01", "Zen_RTS_F_East_BarracksUpgrade02"], "Barracks", "Cost: 1000, Time: 10,"] call Zen_RTS_StrategicBuildingCreate;
(RTS_Used_Building_Types select 1) pushBack Zen_RTS_BuildingType_East_Barracks;

/////////////////////////////////
// Assets
/////////////////////////////////

#define INFANTRY_CONSTRUCTOR(N, T, S) \
    N = { \
        player sideChat str (#N + " asset constructor called"); \
        player sideChat str _this; \
        _assetData = _this select 1; \
        _assetStrRaw = _assetData select 3; \
        sleep (call compile ([_assetStrRaw, "Time: ", ","] call Zen_StringGetDelimitedPart)); \
        _group = [(_this select 2), T] call Zen_SpawnGroup; \
        0 = [_group, S] call Zen_SetAISkill; \
        (units _group) join (_this select 2); \
    };

INFANTRY_CONSTRUCTOR(Zen_RTS_F_East_AssetRifleman, "O_Soldier_F", "infantry")
INFANTRY_CONSTRUCTOR(Zen_RTS_F_East_AssetGLSoldier, "O_Soldier_GL_F", "infantry")
INFANTRY_CONSTRUCTOR(Zen_RTS_F_East_AssetAutorifleman, "O_Soldier_AR_F", "infantry")
INFANTRY_CONSTRUCTOR(Zen_RTS_F_East_AssetMedic, "O_medic_F", "infantry")
INFANTRY_CONSTRUCTOR(Zen_RTS_F_East_AssetMarksman, "O_Soldier_M_F", "infantry")
INFANTRY_CONSTRUCTOR(Zen_RTS_F_East_AssetATSoldier, "O_Soldier_AT_F", "infantry")
INFANTRY_CONSTRUCTOR(Zen_RTS_F_East_AssetAASoldier, "O_Soldier_AA_F", "infantry")

Zen_RTS_Asset_East_Rifleman = ["Zen_RTS_F_East_AssetRifleman", "Rifleman", "Cost: 50, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_GLSoldier = ["Zen_RTS_F_East_AssetGLSoldier", "Grenadier", "Cost: 100, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_Autorifleman = ["Zen_RTS_F_East_AssetAutorifleman", "Autorifleman", "Cost: 100, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_Medic = ["Zen_RTS_F_East_AssetMedic", "Medic", "Cost: 150, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_Marksman  = ["Zen_RTS_F_East_AssetMarksman", "Marksman", "Cost: 150, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_ATSoldier = ["Zen_RTS_F_East_AssetATSoldier", "AT Soldier", "Cost: 150, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_AASoldier = ["Zen_RTS_F_East_AssetAASoldier", "AA Soldier", "Cost: 150, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
