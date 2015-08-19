//**
    Level 1:
        Zen_RTS_Asset_East_RHS_Ural_Flat_VDV_01
        Zen_RTS_Asset_East_Quadbike
        Zen_RTS_Asset_East_Offroad
    Level 2:
        Zen_RTS_Asset_East_OffroadArmed
        Zen_RTS_Asset_East_IfritHMG
//*/

// (_this select 1) : Array, spawn position
Zen_RTS_F_East_TankFactoryConstructor = {
    player sideChat str "East Tank_factory constructor called";
    player sideChat str _this;

    _buildingObjData = _this select 0;
    _spawnPos = _this select 1;
    _buildingTypeData = [(_buildingObjData select 0)] call Zen_RTS_StrategicBuildingTypeGetData;

    _assetsToAdd = [];
    _assetsToAdd pushBack Zen_RTS_Asset_East_Quadbike;
     _assetsToAdd pushBack Zen_RTS_Asset_East_Offroad;
     _assetsToAdd pushBack Zen_RTS_Asset_East_rhs_gaz66o_flat_vdv;
     _assetsToAdd pushBack Zen_RTS_Asset_East_rhs_gaz66_vdv;
     _assetsToAdd pushBack Zen_RTS_Asset_East_rhs_gaz66_r142_vdv;
    _assetsToAdd pushBack Zen_RTS_Asset_East_rhs_uaz_vdv;
    _assetsToAdd pushBack Zen_RTS_Asset_East_rhs_uaz_open_vdv;

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
        0 = [_ID, [Zen_RTS_Asset_Tech_East_Upgrade_TankFactory]] call Zen_RTS_F_StrategicAddAssetGlobal;
    };

    sleep (call compile ([(_buildingTypeData select 5), "Time: ", ","] call Zen_StringGetDelimitedPart));
    _building = [_spawnPos, "Land_Cargo_House_V1_F"] call Zen_SpawnVehicle;
    _building setVariable ["side", side player, true];

    ZEN_RTS_STRATEGIC_BUILDING_DESTROYED_EH(Zen_RTS_BuildingType_East_TankFactory)

    // to-do: || false condition needs building hacking logic
    _args = ["addAction", [_building, ["Purchase Units", Zen_RTS_BuildMenu, (_buildingObjData select 0), 1, false, true, "", "((_target distance _this) < 15) && {(side _this == (_target getVariable 'side')) || (false)}"]]];
    ZEN_FMW_MP_REAll("Zen_ExecuteCommand", _args, call)
    (_building)
};

Zen_RTS_F_East_TankFactoryDestructor = {
    player sideChat str "East Tank_factory destructor";

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

#define ASSETS [Zen_RTS_Asset_East_OffroadArmed, Zen_RTS_Asset_East_IfritHMG, Zen_RTS_Asset_East_Tigr,Zen_RTS_Asset_East_rhs_btr60_vmf]
UPGRADE(Zen_RTS_F_East_TankFactoryUpgrade01, ASSETS)

#define ASSETS [Zen_RTS_Asset_East_rhs_btr80_vdv, Zen_RTS_Asset_East_rhs_btr70_vdv, Zen_RTS_Asset_East_rhs_prp3_vdv, Zen_RTS_Asset_East_rhs_brm1k_vdv, Zen_RTS_Asset_East_rhs_btr80a_vdv, Zen_RTS_Asset_East_rhs_bmp1_vmf, Zen_RTS_Asset_East_rhs_bmp1k_vdv, Zen_RTS_Asset_East_rhs_bmp1d_vdv, Zen_RTS_Asset_East_rhs_bmp1p_vdv, Zen_RTS_Asset_East_rhs_bmp2e_vdv, Zen_RTS_Asset_East_rhs_bmp2k_vdv, Zen_RTS_Asset_East_rhs_bmp2d_vdv, Zen_RTS_Asset_East_rhs_bmp3_late_msv, Zen_RTS_Asset_East_rhs_bmp3mera_msv]
UPGRADE(Zen_RTS_F_East_TankFactoryUpgrade02, ASSETS)

#define ASSETS [Zen_RTS_Asset_East_rhs_bmd1, Zen_RTS_Asset_East_rhs_bmd1k, Zen_RTS_Asset_East_rhs_bmd1p, Zen_RTS_Asset_East_rhs_bmd1pk, Zen_RTS_Asset_East_rhs_bmd1r, Zen_RTS_Asset_East_rhs_bmd2, Zen_RTS_Asset_East_rhs_bmd2m, Zen_RTS_Asset_East_rhs_bmd2k, Zen_RTS_Asset_East_rhs_bmd4ma_vdv, Zen_RTS_Asset_East_rhs_sprut_vdv, Zen_RTS_Asset_East_rhs_t72bc_tv, Zen_RTS_Asset_East_rhs_zsu234_aa]
UPGRADE(Zen_RTS_F_East_TankFactoryUpgrade03, ASSETS)

#define ASSETS [Zen_RTS_Asset_East_rhs_tigr_3camo_vmf, Zen_RTS_Asset_East_rhs_tigr_ffv_vmf, Zen_RTS_Asset_East_rhs_tigr_ffv_3camo_vmf, Zen_RTS_Asset_East_rhs_t80b, Zen_RTS_Asset_East_rhs_t72bc_tv,  Zen_RTS_Asset_East_rhs_t72bd_tv, Zen_RTS_Asset_East_rhs_t72ba_tv, Zen_RTS_Asset_East_rhs_t80bk, Zen_RTS_Asset_East_rhs_t80bv, Zen_RTS_Asset_East_rhs_t80bvk, Zen_RTS_Asset_East_rhs_t80, Zen_RTS_Asset_East_rhs_t80a, Zen_RTS_Asset_East_rhs_t80u, Zen_RTS_Asset_East_rhs_t90_tv, Zen_RTS_Asset_East_rhs_9k79, Zen_RTS_Asset_East_rhs_9k79_K, Zen_RTS_Asset_East_rhs_9k79_B, Zen_RTS_Asset_East_rhs_p37, Zen_RTS_Asset_East_rhs_prv13House_F]
UPGRADE(Zen_RTS_F_East_TankFactoryUpgrade04, ASSETS)

Zen_RTS_BuildingType_East_TankFactory = ["Zen_RTS_F_East_TankFactoryConstructor", "Zen_RTS_F_East_TankFactoryDestructor", ["Zen_RTS_F_East_TankFactoryUpgrade01", "Zen_RTS_F_East_TankFactoryUpgrade02", "Zen_RTS_F_East_TankFactoryUpgrade03","Zen_RTS_F_East_TankFactoryUpgrade04"], "Tank factory", "Cost: 2000, Time: 10,"] call Zen_RTS_StrategicBuildingCreate;
(RTS_Used_Building_Types select 1) pushBack  Zen_RTS_BuildingType_East_TankFactory;

/////////////////////////////////
// Assets
/////////////////////////////////

#define VEHCILE_CONSTRUCTOR(N, T, U) \
    N = { \
        player sideChat str ("West " + T + " asset constructor called"); \
        player sideChat str _this; \
        _buildingObjData = _this select 0; \
        _assetData = _this select 1; \
        _assetStrRaw = _assetData select 3; \
        _referenceUnit = _this select 2; \
        _manned = _this select 3; \
        _phi = 0; \
        _theta = 0; \
        _building = _buildingObjData select 2; \
        _pos = [_building, 20, getDir _building + _phi] call Zen_ExtendPosition; \
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

#define CREW_UNITS ["rhs_msv_driver"]

VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_Quadbike, "O_Quadbike_01_F", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_AssetOffroad, "B_G_Offroad_01_F", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_uaz_open_vdv, "rhs_uaz_open_vdv", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_prp3_vdv, "rhs_prp3_vdv", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_gaz66_vdv, "rhs_gaz66_vdv", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_gaz66_r142_vdv, "rhs_gaz66_r142_vdv", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_uaz_vdv, "rhs_uaz_vdv", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_gaz66o_flat_vdv, "rhs_gaz66o_flat_vdv", CREW_UNITS)

#define CREW_UNITS ["rhs_vdv_driver_armored", "rhs_vdv_crew_commander", "rhs_vdv_armoredcrew", "rhs_vdv_combatcrew"]
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_bmp1k_vdv, "rhs_bmp1k_vdv", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_bmp1d_vdv, "rhs_bmp1d_vdv", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_bmp1p_vdv, "rhs_bmp1p_vdv", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_bmp2e_vdv, "rhs_bmp2e_vdv", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_bmp2k_vdv, "rhs_bmp2k_vdv", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_bmp2d_vdv, "rhs_bmp2d_vdv", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_bmp3_late_msv, "rhs_bmp3_late_msv", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_bmp3mera_msv, "rhs_bmp3mera_msv", CREW_UNITS)

#define CREW_UNITS ["rhs_msv_driver", "rhs_msv_crew"]
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_AssetOffroadArmed, "B_G_Offroad_01_armed_F", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_AssetIfritHMG, "O_MRAP_02_hmg_F", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_AssetTigr, "rhs_tigr_ffv_msv", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_btr60_vmf, "rhs_btr60_vmf", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_bmp1_vmf, "rhs_bmp1_vmf", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_RHS_BM21_MSV_01, "RHS_BM21_MSV_01", CREW_UNITS)

#define CREW_UNITS ["rhs_vdv_driver_armored", "rhs_vdv_officer_armored", "rhs_vdv_crew"]
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_gaz66_ap2_vdv, "rhs_gaz66_ap2_vdv", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_btr60_vmf, "rhs_btr60_vmf", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_btr80_vdv, "rhs_btr80_vdv", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_btr70_vdv, "rhs_btr70_vdv", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_prp3_vdv, "rhs_prp3_vdv", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_brm1k_vdv, "rhs_brm1k_vdv", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_btr80a_vdv, "rhs_btr80a_vdv", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_bmd1, "rhs_bmd1", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_bmd2, "rhs_bmd2", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_bmd1r, "rhs_bmd1r", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_bmd1pk, "rhs_bmd1pk", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_bmd1p, "rhs_bmd1p", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_bmd1k, "rhs_bmd1k", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_bmd2k, "rhs_bmd2k", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_bmd4ma_vdv, "rhs_bmd4ma_vdv", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_sprut_vdv, "rhs_sprut_vdv", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_t72bc_tv, "rhs_t72bc_tv", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_zsu234_aa, "rhs_zsu234_aa", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_bmd2m, "rhs_bmd2m", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_tigr_3camo_vmf, "rhs_tigr_3camo_vmf", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_tigr_ffv_vmf, "rhs_tigr_ffv_vmf", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_tigr_ffv_3camo_vmf, "rhs_tigr_ffv_3camo_vmf", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_t80b, "rhs_t80b", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_t72bd_tv, "rhs_t72bd_tv", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_t72ba_tv, "rhs_t72ba_tv", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_t80bk, "rhs_t80bk", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_t80bv, "rhs_t80bv", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_t80bvk, "rhs_t80bvk", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_t80, "rhs_t80", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_t80a, "rhs_t80a", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_t80u, "rhs_t80u", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_t90_tv, "rhs_t90_tv", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_9k79, "rhs_9k79", CREW_UNITS))//this is nuke or missle
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_9k79_K, "rhs_9k79_B", CREW_UNITS))//this is nuke or missle
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_9k79_B, "rhs_9k79_B", CREW_UNITS))//this is nuke or missle
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_p37, "rhs_p37", CREW_UNITS)//this is an animated radar I left it here for later use if we ever get radar working
VEHCILE_CONSTRUCTOR(Zen_RTS_F_East_Asset_rhs_prv13House_F, "rhs_prv13House_F", CREW_UNITS)//not shur what this is
//tank 0 upgrade assests
Zen_RTS_Asset_East_Quadbike = ["Zen_RTS_F_East_Asset_Quadbike", "Quadbike", "Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_Offroad = ["Zen_RTS_F_East_AssetOffroad", "OffRoad", "Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_gaz66o_flat_vdv = ["Zen_RTS_F_East_Asset_rhs_gaz66o_flat_vdv", "Gaz_flat", "Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_gaz66_vdv = ["Zen_RTS_F_East_Asset_rhs_gaz66_vdv", "Gaz_vdv", "Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_gaz66_r142_vdv = ["Zen_RTS_F_East_Asset_rhs_gaz66_r142_vdv", "Gaz_r142", "Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_uaz_vdv = ["Zen_RTS_F_East_Asset_rhs_uaz_vdv", "uaz-vdv","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_uaz_open_vdv = ["Zen_RTS_F_East_Asset_rhs_uaz_open_vdv","uaz_open_vdv", "Cost: 100, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
//tank 1 upgrade assests
Zen_RTS_Asset_East_OffroadArmed = ["Zen_RTS_F_East_AssetOffroadArmed", "OffRoad armed", "Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_IfritHMG = ["Zen_RTS_F_East_AssetIfritHMG", "Ifrit HMG","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_Tigr = ["Zen_RTS_F_East_AssetTigr", "GAZ-233011 Tigr","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_gaz66_ap2_vdv = ["Zen_RTS_F_East_Asset_rhs_gaz66_ap2_vdv", "gaz-ap2","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_btr60_vmf = ["Zen_RTS_F_East_Asset_rhs_btr60_vmf", "APC","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
//tank 2 upgrade assests
Zen_RTS_Asset_East_rhs_btr80_vdv = ["Zen_RTS_F_East_Asset_rhs_btr80_vdv", "btr-80","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_btr70_vdv = ["Zen_RTS_F_East_Asset_rhs_btr70_vdv", "btr-70","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_prp3_vdv = ["Zen_RTS_F_East_Asset_rhs_prp3_vdv", "prp3_vdv","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_brm1k_vdv = ["Zen_RTS_F_East_Asset_rhs_brm1k_vdv", "brm-1k","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_btr80a_vdv = ["Zen_RTS_F_East_Asset_rhs_btr80a_vdv", "btrA-80","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_bmp1_vmf = ["Zen_RTS_F_East_Asset_rhs_bmp1_vmf", "BMP","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_bmp1k_vdv = ["Zen_RTS_F_East_Asset_rhs_bmp1k_vdv", "BMP-1k","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_bmp1d_vdv = ["Zen_RTS_F_East_Asset_rhs_bmp1d_vdv", "BMP-1d","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_bmp1p_vdv = ["Zen_RTS_F_East_Asset_rhs_bmp1p_vdv", "BMP1p","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_bmp2e_vdv = ["Zen_RTS_F_East_Asset_rhs_bmp2e_vdv", "BMP-2e","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_bmp2k_vdv = ["Zen_RTS_F_East_Asset_rhs_bmp2k_vdv", "BMP-2k","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_bmp2d_vdv = ["Zen_RTS_F_East_Asset_rhs_bmp2d_vdv", "BMP-2d","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_bmp3_late_msv = ["Zen_RTS_F_East_Asset_rhs_bmp3_late_msv", "BM3-late","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_bmp3mera_msv = ["Zen_RTS_F_East_Asset_rhs_bmp3mera_msv", "BMP3-mera","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
//tank 3 upgrade assests
Zen_RTS_Asset_East_rhs_bmd1 = ["Zen_RTS_F_East_Asset_rhs_bmd1", "bmd1","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_bmd1k = ["Zen_RTS_F_East_Asset_rhs_bmd1k", "bmd1k","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_bmd1p = ["Zen_RTS_F_East_Asset_rhs_bmd1p", "bmd1p","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_bmd1pk = ["Zen_RTS_F_East_Asset_rhs_bmd1pk", "bmd1pk","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_bmd1r = ["Zen_RTS_F_East_Asset_rhs_bmd1r", "bmd1r","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_bmd2 = ["Zen_RTS_F_East_Asset_rhs_bmd2", "bmd2","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_bmd2m = ["Zen_RTS_F_East_Asset_rhs_bmd2m", "bmd2m","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_bmd2k = ["Zen_RTS_F_East_Asset_rhs_bmd2k", "bmd2k","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_bmd4ma_vdv = ["Zen_RTS_F_East_Asset_rhs_bmd4ma_vdv", "BMD4ma","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_sprut_vdv = ["Zen_RTS_F_East_Asset_rhs_sprut_vdv", "Spurt","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_t72bc_tv = ["Zen_RTS_F_East_Asset_rhs_t72bc_tv", "T72-BC","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_zsu234_aa = ["Zen_RTS_F_East_Asset_rhs_zsu234_aa", "ZSU234-AA","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
//tank 4 upgrade assests
Zen_RTS_Asset_East_rhs_tigr_3camo_vmf = ["Zen_RTS_F_East_Asset_rhs_tigr_3camo_vmf", "tigr-3","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_tigr_ffv_vmf = ["Zen_RTS_F_East_Asset_rhs_tigr_ffv_vmf", "tigr-ffv","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_tigr_ffv_3camo_vmf = ["Zen_RTS_F_East_Asset_rhs_tigr_ffv_3camo_vmf", "tigr-ffv-3","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_t80b = ["Zen_RTS_F_East_Asset_rhs_t80b", "t80b","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_t72bc_tv = ["Zen_RTS_F_East_Asset_rhs_t72bc_tv", "t72bc-tv","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_t72bd_tv = ["Zen_RTS_F_East_Asset_rhs_t72bd_tv", "t72bd-tv","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_t72ba_tv = ["Zen_RTS_F_East_Asset_rhs_t72ba_tv", "t72ba-tv","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_t80bk = ["Zen_RTS_F_East_Asset_rhs_t80bk", "t80-bk","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_t80bv = ["Zen_RTS_F_East_Asset_rhs_t80bv", "t80-tv","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_t80bvk = ["Zen_RTS_F_East_Asset_rhs_t80bvk", "t80-bvk","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_t80 = ["Zen_RTS_F_East_Asset_rhs_t80", "t80","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_t80a = ["Zen_RTS_F_East_Asset_rhs_t80a", "t80-a","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_t80u = ["Zen_RTS_F_East_Asset_rhs_t80u", "t80-u","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_t90_tv = ["Zen_RTS_F_East_Asset_rhs_t90_tv", "T90","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_9k79 = ["Zen_RTS_F_East_Asset_rhs_9k79", "test9k79k","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_9k79_K = ["Zen_RTS_F_East_Asset_rhs_9k79_K", "bmd1","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_9k79_B = ["Zen_RTS_F_East_Asset_rhs_9k79_B", "test9k79b","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_p37 = ["Zen_RTS_F_East_Asset_rhs_p37", "test37","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_rhs_prv13House_F = ["Zen_RTS_F_East_Asset_rhs_prv13House_F", "test","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;