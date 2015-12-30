//

// (_this select 1) : [array, spawn position, scalar, starting level]
Zen_RTS_F_East_RecyclePlantConstructor = {
    diag_log "East barracks constructor called";
    diag_log _this;

    _buildingObjData = _this select 0;
    _args = _this select 1;

    _spawnPos = _args select 0;
    _level = _args select 1;
    _buildingTypeData = [(_buildingObjData select 0)] call Zen_RTS_StrategicBuildingTypeGetData;

    _assetsToAdd = [];
    _assetsToAdd pushBack Zen_RTS_Asset_East_Repairer;
    _assetsToAdd pushBack Zen_RTS_Asset_East_Recycler;

    // if (Zen_RTS_TechFlag_East_BuildEnemy) then {
    // };

    {
        (RTS_Used_Asset_Types select 0) pushBack _x;
    } forEach _assetsToAdd;
    publicVariable "RTS_Used_Asset_Types";

    0 = [(_buildingObjData select 1), _assetsToAdd] call Zen_RTS_F_StrategicAddAssetGlobal;

    // ZEN_RTS_STRATEGIC_GET_BUILDING_OBJ_ID(Zen_RTS_BuildingType_East_HQ, _ID)
    // if (_ID != "") then {
        // 0 = [_ID, [Zen_RTS_Asset_Tech_East_Upgrade_Barracks]] call Zen_RTS_F_StrategicAddAssetGlobal;
    // };

    BUILDING_VISUALS("Land_Cargo_House_V2_F", 1)
    ZEN_RTS_STRATEGIC_BUILDING_DESTROYED_EH(Zen_RTS_BuildingType_East_RecyclePlant, east)

    // to-do: || false condition needs building hacking logic
    _args = ["addAction", [_building, ["<img size='3'image='pictures\build_CA.paa'/>", Zen_RTS_BuildMenu, [(_buildingObjData select 0), (_buildingObjData select 1)], 1, false, true, "", "((_target distance _this) < 15) && {(side _this == (_target getVariable 'Zen_RTS_StrategicBuildingSide')) || (false)}"]]];
    ZEN_FMW_MP_REAll("Zen_ExecuteCommand", _args, call)
    (_building)
};

Zen_RTS_F_East_RecyclePlantDestructor = {
    diag_log "East Recycle Plant destructor";

    _buildingObjData = _this select 0;
    _level = _buildingObjData select 3;
    diag_log _level;

    _index = [(_buildingObjData select 0), (RTS_Used_Building_Types select 0)] call Zen_ValueFindInArray;
    _array = RTS_Building_Type_Levels select 1;
    _array set [_index, _level];

    (_buildingObjData select 2) setDamage 1;
};

#define UPGRADE(N, A) \
N = { \
    diag_log (#N + " called"); \
    diag_log _this; \
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
// UPGRADE(, ASSETS)

Zen_RTS_BuildingType_East_RecyclePlant = ["Zen_RTS_F_East_RecyclePlantConstructor", "Zen_RTS_F_East_RecyclePlantDestructor", [], "Recycle Plant", "Cost: 1000, Time: 10, Picture: pictures\depot_ca.paa, Classname: Land_Cargo_House_V2_F,"] call Zen_RTS_StrategicBuildingCreate;
(RTS_Used_Building_Types select 1) pushBack Zen_RTS_BuildingType_East_RecyclePlant;

/////////////////////////////////
// Assets
/////////////////////////////////

Zen_RTS_F_East_Repairer = {
    diag_log ("Zen_RTS_F_East_Repairer asset constructor called");
    diag_log _this;
    _buildingObjData = (_this select 0);
    _assetData = _this select 1;
    _referenceUnit = _this select 2; \
    _assetStrRaw = _assetData select 3;
    sleep (call compile ([_assetStrRaw, "Time: ", ","] call Zen_StringGetDelimitedPart));
    if (alive (_buildingObjData select 2)) then {
        ZEN_RTS_STRATEGIC_ASSET_SPAWN_MESSAGE() \
        _group = [(_buildingObjData select 2), "C_man_polo_1_F_afro"] call Zen_SpawnGroup;
        0 = [_group, "crew"] call Zen_SetAISkill;
        removeAllWeapons (leader _group);
        (leader _group) setPosATL ([(_buildingObjData select 2), 5 + random 5, random 360] call Zen_ExtendPosition);
        _group setBehaviour "careless";
        (RTS_Worker_Repair_Queue select 1) pushBack [(leader _group), false, objNull];
    };
};

Zen_RTS_F_East_Recycler = {
    diag_log ("Zen_RTS_F_East_Recycler asset constructor called");
    diag_log _this;
    _buildingObjData = (_this select 0);
    _assetData = _this select 1;
    _referenceUnit = _this select 2;
    _assetStrRaw = _assetData select 3;
    sleep (call compile ([_assetStrRaw, "Time: ", ","] call Zen_StringGetDelimitedPart));
    if (alive (_buildingObjData select 2)) then {
        ZEN_RTS_STRATEGIC_ASSET_SPAWN_MESSAGE() \
        _group = [(_buildingObjData select 2), "C_man_shorts_4_F_afro"] call Zen_SpawnGroup;
        _vehicleID = [Zen_RTS_BuildingType_East_CJ, [[(_buildingObjData select 2), 10, random 360] call Zen_ExtendPosition, 0]] call Zen_RTS_StrategicBuildingInvoke;

        (leader _group) setPosATL ([(_buildingObjData select 2), 5 + random 5, random 360] call Zen_ExtendPosition);
        0 = [_group, "crew"] call Zen_SetAISkill;
        removeAllWeapons (leader _group);
        _group setBehaviour "careless";

        _CJ = ([_vehicleID] call Zen_RTS_StrategicBuildingObjectGetDataGlobal) select 2;
        _CJ setVariable ["Zen_RTS_StrategicIsAIOwned", true, true];
        _CJ setVariable ["Zen_RTS_StrategicIsAIAssigned", true, true];
        0 = [_group, _CJ, "all"] call Zen_MoveInVehicle;

        (RTS_Worker_Recycle_Queue select 1) pushBack [(leader _group), false, _CJ];
    };
};

Zen_RTS_Asset_East_Repairer = ["Zen_RTS_F_East_Repairer", "Repairer", "Cost: 50, Time: 10, Classname: C_man_polo_1_F_afro,"] call Zen_RTS_StrategicAssetCreate;
Zen_RTS_Asset_East_Recycler = ["Zen_RTS_F_East_Recycler", "Recycler", "Cost: 50, Time: 10, Classname: C_man_shorts_4_F_afro,"] call Zen_RTS_StrategicAssetCreate;
