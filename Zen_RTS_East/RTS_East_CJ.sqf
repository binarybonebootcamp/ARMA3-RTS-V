/**
    Level 1:
        MG
//*/

// (_this select 1) : [array, spawn position, scalar, starting level]
Zen_RTS_F_East_CJConstructor = {
    player sideChat str "East CJ constructor called";
    player sideChat str _this;

    _buildingObjData = _this select 0;
    _args = _this select 1;

    _spawnPos = _args select 0;
    _level = _args select 1;

    _assetsToAdd = [];
    _assetsToAdd pushBack Zen_RTS_Asset_East_MG;
    _assetsToAdd pushBack Zen_RTS_Asset_LAND_RAZORWIRE_F;
    _assetsToAdd pushBack Zen_RTS_Asset_LAND_BAGBUNKER_TOWER_F;
    _assetsToAdd pushBack Zen_RTS_Asset_LAND_BAGFENCE_LONG_F;
    _assetsToAdd pushBack Zen_RTS_Asset_LAND_CARGO_PATROL_V1_F;
    _assetsToAdd pushBack Zen_RTS_Asset_B_SLINGLOAD_01_MEDEVAC_F;
    _assetsToAdd pushBack Zen_RTS_Asset_B_SLINGLOAD_01_FUEL_F;
    _assetsToAdd pushBack Zen_RTS_Asset_Box_East_WpsSpecial_F;
    _assetsToAdd pushBack Zen_RTS_Asset_Land_BagFence_Corner_F;
	_assetsToAdd pushBack Zen_RTS_Asset_Land_CncWall4_F;

    if (Zen_RTS_TechFlag_East_BuildEnemy) then {
        // ... to do
    };

    {
        (RTS_Used_Asset_Types select 0) pushBack _x;
    } forEach _assetsToAdd;
    publicVariable "RTS_Used_Asset_Types";

    0 = [(_buildingObjData select 1), _assetsToAdd] call Zen_RTS_F_StrategicAddAssetGlobal;

    // ZEN_RTS_STRATEGIC_GET_BUILDING_OBJ_ID(Zen_RTS_BuildingType_East_HQ, _ID)
    // if (_ID != "") then {
        // 0 = [_ID, [Zen_RTS_Asset_Tech_East_Upgrade_Barracks]] call Zen_RTS_F_StrategicAddAssetGlobal;
    // };

    _buildingTypeData = [(_buildingObjData select 0)] call Zen_RTS_StrategicBuildingTypeGetData;
    _assetStrRaw = _buildingTypeData select 5;

    sleep (call compile ([_assetStrRaw, "Time: ", ","] call Zen_StringGetDelimitedPart));
    _vehicle = [_spawnPos, "O_MRAP_02_F"]  call Zen_SpawnVehicle;
    _vehicle setVariable ["side", East, true];
    ZEN_RTS_STRATEGIC_ASSET_DESTROYED_EH

    // to-do: || false condition needs building hacking logic
    _args = ["addAction", [_vehicle, ["CJ Menu", Zen_RTS_BuildMenu, (_buildingObjData select 0), 1, false, true, "", "(_this in _target)"]]];
    ZEN_FMW_MP_REAll("Zen_ExecuteCommand", _args, call)
    if (_level > 0) then {
        for "_i" from 0 to (_level - 1) do {
            [_buildingObjData] call (missionNamespace getVariable ((_buildingTypeData select 3) select _i));
        };
    };

    (_vehicle)
};

Zen_RTS_F_East_CJDestructor = {
    player sideChat str "East CJ destructor";

    _buildingObjData = _this select 0;
    _level = _buildingObjData select 3;
    player commandChat str _level;

    _index = [(_buildingObjData select 0), (RTS_Used_Building_Types select 1)] call Zen_ValueFindInArray;
    _array = RTS_Building_Type_Levels select 0;
    _array set [_index, _level];

    (_buildingObjData select 2) setDamage 1;
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
        (RTS_Used_Asset_Types select 0) pushBack _x; \
    } forEach _assetsToAdd; \
    publicVariable "RTS_Used_Asset_Types"; \
    0 = [(_buildingObjData select 1), _assetsToAdd] call Zen_RTS_F_StrategicAddAssetGlobal; \
    (true) \
};

// #define ASSETS []
// UPGRADE(Zen_RTS_F_East_CJUpgrade01, ASSETS)

Zen_RTS_BuildingType_East_CJ = ["Zen_RTS_F_East_CJConstructor", "Zen_RTS_F_East_CJDestructor", [], "CJ", "Cost: 1000, Time: 10,"] call Zen_RTS_StrategicBuildingCreate;
(RTS_Used_Building_Types select 1) pushBack Zen_RTS_BuildingType_East_CJ;

/////////////////////////////////
// Assets
/////////////////////////////////

#define FORT_CONSTRUCTOR(N, T) \
    N = { \
        player sideChat str ("East " + T + " asset constructor called"); \
        player sideChat str _this; \
        _buildingObjData = _this select 0; \
        _assetData = _this select 1; \
        _assetStrRaw = _assetData select 3; \
        _building = _buildingObjData select 2; \
        Zen_RTS_CJ_DoPlace = false; \
        _redArrow = "Sign_Arrow_Large_F" createVehicleLocal [0,0,0]; \
        _building addAction ["<t color='#D80000'>Place</t>", {Zen_RTS_CJ_DoPlace = true; (_this select 0) removeAction (_this select 2);}, [], 1, false, true, "", "(_this in _target)"]; \
        waitUntil { \
            sleep 1; \
            _redArrow setPosATL ([_building, 10, getDir _building, "compass", 1] call Zen_ExtendPosition); \
            (Zen_RTS_CJ_DoPlace) \
        }; \
        sleep (call compile ([_assetStrRaw, "Time: ", ","] call Zen_StringGetDelimitedPart)); \
        deleteVehicle _redArrow; \
        _vehicle = [_redArrow, T, 0, getDir _building, false]  call Zen_SpawnVehicle; \
        ZEN_RTS_STRATEGIC_ASSET_DESTROYED_EH \
    };

FORT_CONSTRUCTOR(Zen_RTS_F_East_AssetMG, "O_HMG_01_high_F")
FORT_CONSTRUCTOR(Zen_RTS_F_East_AssetLAND_RAZORWIRE_F, "LAND_RAZORWIRE_F")
FORT_CONSTRUCTOR(Zen_RTS_F_East_AssetLAND_BAGBUNKER_TOWER_F, "Land_BAGBUNKER_TOWER_F")
FORT_CONSTRUCTOR(Zen_RTS_F_East_AssetLAND_BAGFENCE_LONG_F, "Land_BagFence_Long_F")
FORT_CONSTRUCTOR(Zen_RTS_F_East_AssetLAND_CARGO_PATROL_V1_F, "LAND_CARGO_PATROL_V1_F")
FORT_CONSTRUCTOR(Zen_RTS_F_East_AssetB_SLINGLOAD_01_MEDEVAC_F, "B_SLINGLOAD_01_MEDEVAC_F")
FORT_CONSTRUCTOR(Zen_RTS_F_East_AssetB_SLINGLOAD_01_FUEL_F, "B_SLINGLOAD_01_FUEL_F")
FORT_CONSTRUCTOR(Zen_RTS_F_East_AssetBox_East_WpsSpecial_F, "Box_East_WpsSpecial_F")
//FORT_CONSTRUCTOR(Zen_RTS_F_East_AssetB_Slingload_01_Ammo_F, "B_Slingload_01_Ammo_F")
//FORT_CONSTRUCTOR(Zen_RTS_F_East_AssetB_Slingload_01_Repair_F, "B_Slingload_01_Repair_F")
FORT_CONSTRUCTOR(Zen_RTS_F_East_Asset_Land_BagFence_Corner_F, "Land_BagFence_Corner_F")
FORT_CONSTRUCTOR(Zen_RTS_F_West_Asset_Land_CncWall4_F, "Land_CncWall4_F")

Zen_RTS_Asset_East_MG = ["Zen_RTS_F_East_AssetMG", "MG", "Cost: 50, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_LAND_RAZORWIRE_F= ["Zen_RTS_F_East_AssetLAND_RAZORWIRE_F", "razor wire", "Cost: 50, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_LAND_BAGBUNKER_TOWER_F= ["Zen_RTS_F_East_AssetLAND_BAGBUNKER_TOWER_F", "bunker", "Cost: 50, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_LAND_BAGFENCE_LONG_F= ["Zen_RTS_F_East_AssetLAND_BAGFENCE_LONG_F", "fence shelter", "Cost: 50, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_LAND_CARGO_PATROL_V1_F= ["Zen_RTS_F_East_AssetLAND_CARGO_PATROL_V1_F", "patrol tower", "Cost: 50, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_B_SLINGLOAD_01_MEDEVAC_F= ["Zen_RTS_F_East_AssetB_SLINGLOAD_01_MEDEVAC_F", "med tent", "Cost: 50, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_B_SLINGLOAD_01_FUEL_F= ["Zen_RTS_F_East_AssetB_SLINGLOAD_01_FUEL_F", "fuel port", "Cost: 50, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_Box_East_WpsSpecial_F= ["Zen_RTS_F_East_AssetBox_East_WpsSpecial_F", "Supply Box [NATO]", "Cost: 50, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_Land_BagFence_Corner_F= ["Zen_RTS_F_East_Asset_Land_BagFence_Corner_F", "repair port", "Cost: 50, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_Land_CncWall4_F= ["Zen_RTS_F_West_Asset_Land_CncWall4_F", "repair port", "Cost: 50, Time: 10,"] call Zen_RTS_StrategicAssetCreate;