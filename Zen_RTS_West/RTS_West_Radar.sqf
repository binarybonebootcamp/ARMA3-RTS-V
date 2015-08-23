
Zen_RTS_F_West_RadarConstructor = {
    player sideChat str "West Radar constructor called";
    player sideChat str _this;

    _buildingObjData = _this select 0;
    _spawnPos = _this select 1;
    _buildingTypeData = [(_buildingObjData select 0)] call Zen_RTS_StrategicBuildingTypeGetData;

    sleep (call compile ([(_buildingTypeData select 5), "Time: ", ","] call Zen_StringGetDelimitedPart));
    _building = [_spawnPos, "rhs_prv13"] call Zen_SpawnVehicle;
    _building setVariable ["side", side player, true];

    ZEN_RTS_STRATEGIC_BUILDING_DESTROYED_EH(Zen_RTS_BuildingType_West_RadarFactory)
};
Zen_RTS_F_West_RadarDestructor = {
    player sideChat str "West Radar destructor";

    _buildingObjData = _this select 0;
    player commandChat str (_buildingObjData select 2);
    player commandChat str (isNull (_buildingObjData select 2));
    player commandChat str (alive (_buildingObjData select 2));
    player commandChat str (getPosATL (_buildingObjData select 2));

    (_buildingObjData select 2) setDamage 1;
};

Zen_RTS_BuildingType_West_RadarFactory = ["Zen_RTS_F_West_RadarConstructor", "Zen_RTS_F_West_RadarDestructor", "Radar Factory", "Cost: 2000, Time: 10,"] call Zen_RTS_StrategicBuildingCreate;
(RTS_Used_Building_Types select 1) pushBack  Zen_RTS_BuildingType_West_RadarFactory;


