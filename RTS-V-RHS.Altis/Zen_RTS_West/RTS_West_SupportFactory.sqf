/**
    Level 1:
        Zen_RTS_Asset_West_HEMTT_Repair
        Zen_RTS_Asset_West_Quadbike
        Zen_RTS_Asset_West_Offroad
    Level 2:
        Zen_RTS_Asset_West_OffroadArmed
        Zen_RTS_Asset_West_HunterHMG
//*/

// (_this select 1) : [array, spawn position, scalar, starting level]
Zen_RTS_F_West_SupportFactoryConstructor = {
    diag_log "West Support_factory constructor called";
    diag_log _this;

    _buildingObjData = _this select 0;
    _args = _this select 1;

    _spawnPos = _args select 0;
    _level = _args select 1;
    _buildingTypeData = [(_buildingObjData select 0)] call Zen_RTS_StrategicBuildingTypeGetData;

    _assetsToAdd = [];
    _assetsToAdd pushBack Zen_RTS_Asset_West_rhsusf_M1083A1P2_B_M2_d_Medical_fmtv_usarmy;
    _assetsToAdd pushBack Zen_RTS_Asset_West_rhsusf_M1083A1P2_B_M2_d_fmtv_usarmy;
    _assetsToAdd pushBack Zen_RTS_Asset_West_rhsusf_M1083A1P2_B_M2_d_open_fmtv_usarmy;
    _assetsToAdd pushBack Zen_RTS_Asset_West_rhsusf_M1083A1P2_B_M2_d_flatbed_fmtv_usarmy;
    _assetsToAdd pushBack Zen_RTS_Asset_West_rhsusf_M1083A1P2_B_M2_d_MHQ_fmtv_usarmy;

    // if (Zen_RTS_TechFlag_West_BuildEnemy) then {
        // ... to do
    // };

    {
        (RTS_Used_Asset_Types select 0) pushBack _x;
    } forEach _assetsToAdd;
    publicVariable "RTS_Used_Asset_Types";

    0 = [(_buildingObjData select 1), _assetsToAdd] call Zen_RTS_F_StrategicAddAssetGlobal;

    ZEN_RTS_STRATEGIC_GET_BUILDING_OBJ_ID(Zen_RTS_BuildingType_West_HQ, _ID)
    if (_ID != "") then {
        0 = [_ID, [Zen_RTS_Asset_Tech_West_Upgrade_SupportFactory]] call Zen_RTS_F_StrategicAddAssetGlobal;
    };

    BUILDING_VISUALS("Land_Research_house_V1_F", -1)
    ZEN_RTS_STRATEGIC_BUILDING_DESTROYED_EH(Zen_RTS_BuildingType_West_SupportFactory, West)

    // to-do: || false condition needs building hacking logic
    _args = ["addAction", [_building, ["<img size='3' image='pictures\build_CA.paa'/>", Zen_RTS_BuildMenu, [(_buildingObjData select 0), (_buildingObjData select 1)], 1, false, true, "", "((_target distance _this) < 15) && {(side _this == (_target getVariable 'Zen_RTS_StrategicBuildingSide')) || (false)}"]]];
    ZEN_FMW_MP_REAll("Zen_ExecuteCommand", _args, call)
    (_building)
};

Zen_RTS_F_West_SupportFactoryDestructor = {
    diag_log "West Support factory destructor";

    _buildingObjData = _this select 0;
    _level = _buildingObjData select 3;
    diag_log _level;

    _index = [(_buildingObjData select 0), (RTS_Used_Building_Types select 0)] call Zen_ValueFindInArray;
    _array = RTS_Building_Type_Levels select 0;
    _array set [_index, _level];

    (_buildingObjData select 2) setDamage 1;
};

#define UPGRADE(N, A) \
N = { \
    diag_log (#N + " called"); \
    diag_log _this; \
    _buildingData = _this select 0; \
    _assetsToAdd = A; \
    if (Zen_RTS_TechFlag_West_BuildEnemy) then { \
    }; \
    { \
        (RTS_Used_Asset_Types select 0) pushBack _x; \
    } forEach _assetsToAdd; \
    publicVariable "RTS_Used_Asset_Types"; \
    0 = [(_buildingData select 1), _assetsToAdd] call Zen_RTS_F_StrategicAddAssetGlobal; \
    (true) \
};

#define ASSETS [Zen_RTS_Asset_West_rhsusf_M977A2_usarmy_wd, Zen_RTS_Asset_West_rhsusf_M977A2_CPK_usarmy_wd, Zen_RTS_Asset_West_rhsusf_M978A2_usarmy_wd, Zen_RTS_Asset_West_rhsusf_M978A2_CPK_usarmy_wd]
UPGRADE(Zen_RTS_F_West_SupportFactoryUpgrade01, ASSETS)

#define ASSETS [Zen_RTS_Asset_West_rhsusf_m1025_w, Zen_RTS_Asset_West_rhsusf_m1025_d, Zen_RTS_Asset_West_rhsusf_m1025_w_s, Zen_RTS_Asset_West_rhsusf_m1025_d_s, Zen_RTS_Asset_West_rhsusf_m1025_w_m2, Zen_RTS_Asset_West_rhsusf_m1025_d_m2, Zen_RTS_Asset_West_rhs_9k79_K, Zen_RTS_Asset_West_rhs_9k79_B]
UPGRADE(Zen_RTS_F_West_SupportFactoryUpgrade02, ASSETS)

Zen_RTS_BuildingType_West_SupportFactory = ["Zen_RTS_F_West_SupportFactoryConstructor", "Zen_RTS_F_West_SupportFactoryDestructor", ["Zen_RTS_F_West_SupportFactoryUpgrade01","Zen_RTS_F_West_SupportFactoryUpgrade02"], "Support Factory", "Cost: 2000, Time: 10, Picture: pictures\support_ca.paa, Classname: Land_Research_house_V1_F,"] call Zen_RTS_StrategicBuildingCreate;
(RTS_Used_Building_Types select 0) pushBack  Zen_RTS_BuildingType_West_SupportFactory;

/////////////////////////////////
// Assets
/////////////////////////////////

#define VEHCILE_CONSTRUCTOR(N, T, U) \
    N = { \
        diag_log ("West " + T + " asset constructor called"); \
        diag_log _this; \
        _buildingObjData = _this select 0; \
        _assetData = _this select 1; \
        _assetStrRaw = _assetData select 3; \
        _referenceUnit = _this select 2; \
        _crewCount = _this select 3; \
        _phi = 0; \
        _theta = 0; \
        _building = _buildingObjData select 2; \
        ZEN_RTS_STRATEGIC_ASSET_PLACEMENT() \
        sleep (call compile ([_assetStrRaw, "Time: ", ","] call Zen_StringGetDelimitedPart)); \
        ZEN_RTS_STRATEGIC_ASSET_SPAWN_MESSAGE() \
        _vehicle = [_pos, T, 0, getDir _building + _theta, true]  call Zen_SpawnVehicle; \
        ZEN_RTS_STRATEGIC_ASSET_DESTROYED_EH \
        if (_crewCount > 0) then { \
            _crewGroup = [_vehicle, ([U, 0, (_crewCount - 1) min ((count U) - 1)] call Zen_ArrayGetIndexedSlice)] call Zen_SpawnGroup; \
            0 = [_crewGroup, "crew"] call Zen_SetAISkill; \
            0 = [_crewGroup, _vehicle, "All"] call Zen_MoveInVehicle; \
            0 = [_crewGroup, _referenceUnit] spawn { \
                _crewGroup = _this select 0; \
                _referenceUnit = _this select 1; \
                sleep 1; \
                (units _crewGroup) join _referenceUnit; \
                sleep 1; \
                {doStop _x;} forEach (units _crewGroup); \
            }; \
        }; \
    };

#define CREW_UNITS ["rhsusf_army_ocp_driver"]
VEHCILE_CONSTRUCTOR(Zen_RTS_F_West_Asset_rhsusf_M1083A1P2_B_M2_d_Medical_fmtv_usarmy, "rhsusf_M1083A1P2_B_M2_d_Medical_fmtv_usarmy", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_West_Asset_rhsusf_M1083A1P2_B_M2_d_fmtv_usarmy, "rhsusf_M1083A1P2_B_M2_d_fmtv_usarmy", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_West_Asset_rhsusf_M1083A1P2_B_M2_d_open_fmtv_usarmy, "rhsusf_M1083A1P2_B_M2_d_open_fmtv_usarmy", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_West_Asset_rhsusf_M1083A1P2_B_M2_d_flatbed_fmtv_usarmy, "rhsusf_M1083A1P2_B_M2_d_flatbed_fmtv_usarmy", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_West_Asset_rhsusf_M1083A1P2_B_M2_d_MHQ_fmtv_usarmy, "rhsusf_M1083A1P2_B_M2_d_MHQ_fmtv_usarmy", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_West_Asset_rhsusf_M978A2_CPK_usarmy_wd, "rhsusf_M978A2_CPK_usarmy_wd", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_West_Asset_rhsusf_M978A2_usarmy_wd, "rhsusf_M978A2_usarmy_wd", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_West_Asset_rhsusf_M977A2_CPK_usarmy_wd, "rhsusf_M977A2_CPK_usarmy_wd", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_West_Asset_rhsusf_M977A2_usarmy_wd, "rhsusf_M977A2_usarmy_wd", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_West_Asset_rhsusf_m1025_d_s, "rhsusf_m1025_d_s", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_West_Asset_rhsusf_m1025_w_s, "rhsusf_m1025_w_s", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_West_Asset_rhsusf_m1025_d, "rhsusf_m1025_d", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_West_Asset_rhsusf_m1025_w, "rhsusf_m1025_w", CREW_UNITS)

#define CREW_UNITS ["rhsusf_army_ocp_driver", "rhsusf_army_ucp_driver", "rhsusf_army_ucp_crewman"]
VEHCILE_CONSTRUCTOR(Zen_RTS_F_West_Asset_rhsusf_m109d_usarmy, "rhsusf_m109d_usarmy", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_West_Asset_rhsusf_m109_usarmy, "rhsusf_m109_usarmy", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_West_Asset_rhsusf_m1025_d_m2, "rhsusf_m1025_d_m2", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_West_Asset_rhsusf_m1025_w_m2, "rhsusf_m1025_w_m2", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_West_Asset_rhs_9k79_K, "rhs_9k79_k", CREW_UNITS)
VEHCILE_CONSTRUCTOR(Zen_RTS_F_West_Asset_rhs_9k79_B, "rhs_9k79_B", CREW_UNITS)

Zen_RTS_Asset_West_rhsusf_M1083A1P2_B_M2_d_Medical_fmtv_usarmy = ["Zen_RTS_F_West_Asset_rhsusf_M1083A1P2_B_M2_d_Medical_fmtv_usarmy","Medical", "Cost: 100, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_West_rhsusf_M1083A1P2_B_M2_d_fmtv_usarmy = ["Zen_RTS_F_West_Asset_rhsusf_M1083A1P2_B_M2_d_fmtv_usarmy","M2_d_fmtv", "Cost: 100, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_West_rhsusf_M1083A1P2_B_M2_d_open_fmtv_usarmy = ["Zen_RTS_F_West_Asset_rhsusf_M1083A1P2_B_M2_d_open_fmtv_usarmy","open_fmtv", "Cost: 100, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_West_rhsusf_M1083A1P2_B_M2_d_flatbed_fmtv_usarmy = ["Zen_RTS_F_West_Asset_rhsusf_M1083A1P2_B_M2_d_flatbed_fmtv_usarmy","flatbed_fmtv", "Cost: 100, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_West_rhsusf_M1083A1P2_B_M2_d_MHQ_fmtv_usarmy = ["Zen_RTS_F_West_Asset_rhsusf_M1083A1P2_B_M2_d_MHQ_fmtv_usarmy","MHQ_fmtv", "Cost: 100, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_West_rhsusf_M978A2_CPK_usarmy_wd = ["Zen_RTS_F_West_Asset_rhsusf_M978A2_CPK_usarmy_wd","M978A2_CPK_wd", "Cost: 100, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_West_rhsusf_M978A2_usarmy_wd = ["Zen_RTS_F_West_Asset_rhsusf_M978A2_usarmy_wd","M978A2_wd", "Cost: 100, Time: 10,"] call Zen_RTS_StrategicAssetCreate;

 Zen_RTS_Asset_West_rhsusf_M977A2_CPK_usarmy_wd = ["Zen_RTS_F_West_Asset_rhsusf_M977A2_CPK_usarmy_wd","M977A2_CPK_wd", "Cost: 100, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_West_rhsusf_M977A2_usarmy_wd = ["Zen_RTS_F_West_Asset_rhsusf_M977A2_usarmy_wd","M977A2_wd", "Cost: 100, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_West_rhsusf_m1025_d_m2 = ["Zen_RTS_F_West_Asset_rhsusf_m1025_d_m2","m1025_d_m2", "Cost: 100, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_West_rhsusf_m1025_w_m2 = ["Zen_RTS_F_West_Asset_rhsusf_m1025_w_m2","m1025_w_m2", "Cost: 100, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_West_rhsusf_m1025_d_s = ["Zen_RTS_F_West_Asset_rhsusf_m1025_d_s","m1025_d_s", "Cost: 100, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_West_rhsusf_m1025_w_s = ["Zen_RTS_F_West_Asset_rhsusf_m1025_w_s","m1025_w_s", "Cost: 100, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_West_rhsusf_m1025_d = ["Zen_RTS_F_West_Asset_rhsusf_m1025_d","m1025_d", "Cost: 100, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_West_rhsusf_m1025_w = ["Zen_RTS_F_West_Asset_rhsusf_m1025_w","m1025_w", "Cost: 100, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_West_rhs_9k79_K = ["Zen_RTS_F_West_Asset_rhs_9k79_K", "missile","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_West_rhs_9k79_B = ["Zen_RTS_F_West_Asset_rhs_9k79_B", "NUKE","Cost: 200, Time: 10,"] call Zen_RTS_StrategicAssetCreate;
