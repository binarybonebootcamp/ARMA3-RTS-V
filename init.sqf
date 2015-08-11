#include "Zen_FrameworkFunctions\Zen_InitHeader.sqf"

enableSaving [false, false];

#include "Zen_RTS_Functions\Zen_RTS_GlobalFunctions.sqf"
#include "Zen_RTS_Functions\Zen_RTS_GlobalVariables.sqf"
#include "Zen_RTS_Functions\Zen_RTS_ParseParams.sqf"
#include "Zen_RTS_Functions\Zen_RTS_JIPSync.sqf"
#include "functions\RTS_FNC_INIT_PLAYERACTIONS.sqf"
#include "functions\RTS_FNC_flipACTIONS.sqf"
#include "functions\RTS_FNC_PUSH.sqf"

sleep 1;

//ZKS Respawn -----------------------
if (isServer) then {
    [] execVM "ZKS\Code\server\CodeStarter.sqf";
};

if !(isDedicated) then {
    [] execVM "ZKS\Code\Player\CodeStarter.sqf";
};
//---------------------- -------------
#include "Zen_RTS_Functions\Zen_RTS_ClientExec.sqf"
Zen_RTS_AlphaMenu = compileFinal preprocessFileLineNumbers "Zen_RTS_Functions\Zen_RTS_AlphaMenu.sqf";
Zen_RTS_BuildMenuStructures = compileFinal preprocessFileLineNumbers "Zen_RTS_Functions\Zen_RTS_BuildMenuStructures.sqf";
Zen_RTS_BuildStructure = compileFinal preprocessFileLineNumbers "Zen_RTS_Functions\Zen_RTS_BuildStructure.sqf";
Zen_RTS_BuildMenu = compileFinal preprocessFileLineNumbers "Zen_RTS_Functions\Zen_RTS_BuildMenu.sqf";
Zen_RTS_BuildUnit = compileFinal preprocessFileLineNumbers "Zen_RTS_Functions\Zen_RTS_BuildUnit.sqf";
Zen_RTS_DisbandUnit = compileFinal preprocessFileLineNumbers "Zen_RTS_Functions\Zen_RTS_DisbandUnit.sqf";
Zen_RTS_DestroyStructure = compileFinal preprocessFileLineNumbers "Zen_RTS_Functions\Zen_RTS_DestroyStructure.sqf";
Zen_RTS_EconomyManager = compileFinal preprocessFileLineNumbers "Zen_RTS_Functions\Zen_RTS_EconomyManager.sqf";
Zen_RTS_Recycle = compileFinal preprocessFileLineNumbers "Zen_RTS_Functions\Zen_RTS_Recycle.sqf";
Zen_RTS_SquadsMenu = compileFinal preprocessFileLineNumbers "Zen_RTS_Functions\Zen_RTS_SquadsMenu.sqf";
Zen_RTS_SetViewDistance = compileFinal preprocessFileLineNumbers "Zen_RTS_Functions\Zen_RTS_SetViewDistance.sqf";

call compileFinal preprocessFileLineNumbers "Zen_RTS_Strategic\Zen_RTS_StrategicCompile.sqf";
call compileFinal preprocessFileLineNumbers "Zen_RTS_Territory\Zen_RTS_TerritoryCompile.sqf";
call compileFinal preprocessFileLineNumbers "Zen_RTS_SubTerritory\Zen_RTS_SubTerritoryCompile.sqf";

// Data structure for custom squads, this is local to each player and side specific
// indexes pair with names/colors, 0 - Alpha, etc.
RTS_Custom_Squads_Assets = [[], [], [], []];

if !(isServer) exitWith {};

0 = [] spawn Zen_RTS_EconomyManager;

// [] exec "economy\rts-supplyMonitor.sqs";
[] exec "rts-build-serverside.sqs";
[] exec "rts-init-commandermonitor.sqs";
[] exec "test.sqs";
//[] exec "rts-build-serverSideMonitor.sqs";
aiLimit = 10;
{
    call compile format ["xp%1 = 0", _x];
} forEach ([west, east] call Zen_ConvertToObjectArray);
Zen_JIP_Args_Server = [overcast, fog, vd];
// rts_hq sideChat "Global Scripts and Variables Initialized";
rts_Initialized = TRUE;

TitleRsc ["Title","BLACK FADED"];
CutRsc ["Black","BLACK FADED"];
// ====================================================================================
// Zen_RTS_SubTerritory
// ====================================================================================

westFC = 0;
eastFC = 0;
civFC = 0;

0 = [] spawn Zen_RTS_SubTerritoryManager;

_flagMarkers = [];
for "_i" from 1 to 32 do {
    _marker = [missionNamespace getVariable ("Flag" + str _i), "", "colorBlack", [100, 100], "ellipse"] call Zen_SpawnMarker;
    _flagMarkers pushBack _marker;
    0 = [_marker, "Flag " + str _i, [0, 5, 10, 20]] call Zen_RTS_SubTerritoryCreate;
};

// ====================================================================================
// Zen_RTS_Territory
// ====================================================================================

#define MKR(I) (_flagMarkers select (I - 1))

0 = [] spawn Zen_RTS_TerritoryManager;

_Zen_TerritorySouth_East_TerritoryMarker = [ListFlag1, "", "colorRed", [0, 0], "rectangle", 0, 1] call Zen_SpawnMarker;
0 = ["South_east", [MKR(1), MKR(2),MKR(3),MKR(4)]] call Zen_RTS_TerritoryCreate;

_Zen_TerritoryEast_TerritoryMarker = [ListFlag5, "", "colorRed", [0, 0], "rectangle", 0, 1] call Zen_SpawnMarker;
0 = ["East", [MKR(5),MKR(6),MKR(7),MKR(26)]] call Zen_RTS_TerritoryCreate;

_Zen_TerritoryDesert_TerritoryMarker = [ListFlag8, "", "colorRed", [0, 0], "rectangle", 0, 1] call Zen_SpawnMarker;
0 = ["Desert", [MKR(8),MKR(9)]] call Zen_RTS_TerritoryCreate;

_Zen_TerritorySouthBay_TerritoryMarker = [ListFlag10, "", "colorRed", [0, 0], "rectangle", 0, 1] call Zen_SpawnMarker;
0 = ["SouthBay", [MKR(10), MKR(11), MKR(12)]] call Zen_RTS_TerritoryCreate;

_Zen_TerritorySouth_West_TerritoryMarker = [ListFlag13, "", "colorRed", [0, 0], "rectangle", 0, 1] call Zen_SpawnMarker;
0 = ["South_West", [MKR(13), MKR(14),MKR(15)]] call Zen_RTS_TerritoryCreate;

_Zen_TerritoryNorthWest_TerritoryMarker = [ListFlag16, "", "colorRed", [0, 0], "rectangle", 0, 1] call Zen_SpawnMarker;
0 = ["North_West", [MKR(16),MKR(17), MKR(18)]] call Zen_RTS_TerritoryCreate;

_Zen_TerritoryNorth_TerritoryMarker = [ListFlag19, "", "colorRed", [0, 0], "rectangle", 0, 1] call Zen_SpawnMarker;
0 = ["North", [MKR(19),MKR(20),MKR(21)]] call Zen_RTS_TerritoryCreate;

_Zen_TerritorynwAir_port_TerritoryMarker = [ListFlag22, "", "colorRed", [0, 0], "rectangle", 0, 1] call Zen_SpawnMarker;
0 = ["N-W_Air_port", [MKR(22)]] call Zen_RTS_TerritoryCreate;

_Zen_TerritoryAir_port_TerritoryMarker = [ListFlag23, "", "colorRed", [0, 0], "rectangle", 0, 1] call Zen_SpawnMarker;
0 = ["Air_port", [MKR(23)]] call Zen_RTS_TerritoryCreate;

_Zen_TerritoryswAir_port_TerritoryMarker = [ListFlag24, "", "colorRed", [0, 0], "rectangle", 0, 1] call Zen_SpawnMarker;
0 = ["S-W_Air_port", [MKR(24)]] call Zen_RTS_TerritoryCreate;

_Zen_TerritoryneAir_port_TerritoryMarker = [ListFlag25, "", "colorRed", [0, 0], "rectangle", 0, 1] call Zen_SpawnMarker;
0 = ["N-E_Air_port", [MKR(25)]] call Zen_RTS_TerritoryCreate;

_Zen_TerritoryNorth_East_TerritoryMarker = [ListFlag27, "", "colorRed", [0, 0], "rectangle", 0, 1] call Zen_SpawnMarker;
0 = ["North_East", [MKR(27),MKR(28), MKR(29)]] call Zen_RTS_TerritoryCreate;

_Zen_TerritoryWest_TerritoryMarker = [ListFlag30, "", "colorRed", [0, 0], "rectangle", 0, 1] call Zen_SpawnMarker;
0 = ["West", [MKR(30),MKR(31), MKR(32)]] call Zen_RTS_TerritoryCreate;

//////////
// Zen RTS Strategic
/////////

// #define ZEN_RTS_STRATEGIC_BUIDLING_DESTRUCTOR_REFUND_COEFF 0.5

#define ZEN_RTS_STRATEGIC_GET_BUILDING_OBJ_ID(N, I) \
    _objIndexes = [Zen_RTS_Strategic_Building_Objects_Global, N, 0] call Zen_ArrayGetNestedIndex; \
    I = ""; \
    if (count _objIndexes > 0) then { \
        _objData = Zen_RTS_Strategic_Building_Objects_Global select (_objIndexes select 0); \
        I = _objData select 1; \
    };

#define ZEN_RTS_STRATEGIC_ASSET_DESTROYED_EH \
    _vehicle setVariable ["Zen_RTS_StrategicDebrisValue", (call compile ([_assetStrRaw, "Cost: ", ","] call Zen_StringGetDelimitedPart)), true]; \
    _vehicle addEventHandler ["Killed", { \
        (_this select 0) setVariable ["Zen_RTS_IsStrategicDebris", true, true]; \
    }];

#define ZEN_RTS_STRATEGIC_BUILDING_DESTROYED_EH(T) \
    _building addEventHandler ["Killed", { \
        0 = _this spawn { \
            _buildingTypeData = [T] call Zen_RTS_StrategicBuildingTypeGetData; \
            _cost = call compile ([(_buildingTypeData select 5), "Cost: ", ","] call Zen_StringGetDelimitedPart); \
            _buildingObjData = [T, true, false] call Zen_RTS_StrategicBuildingObjectGetDataGlobal; \
            if (count _buildingObjData > 0) then { \
                0 = [(_buildingObjData select 1)] call Zen_RTS_StrategicBuildingDestroy; \
            }; \
            _building = _this select 0; \
            _pos = getPosATL _building; \
            sleep 5; \
            _objects = nearestObjects [_pos, ["Ruins"], 10]; \
            _deadBuilding = objNull; \
            { \
                if (alive _x) exitWith { \
                    _deadBuilding = _x; \
                }; \
            } forEach _objects; \
            if !(isNull _deadBuilding) then { \
                player sideChat str _deadBuilding; \
                _deadBuilding setVariable ["Zen_RTS_IsStrategicDebris", true, true]; \
                _deadBuilding setVariable ["Zen_RTS_StrategicDebrisValue", _cost, true]; \
            } else { \
                player sidechat ("Destroyed Building" + str _building + " has no dead object"); \
            }; \
        }; \
    }];

// all building types must be added here, or they will not be considered
// must be [[west building types], [east '']]
RTS_Used_Building_Types = [[], []]; // global

// all asset types must be added here, or they will not be considered for custom squads
// must be [[west asset types, [east '']]
RTS_Used_Asset_Types = [[], []]; // global

// 0 = [] spawn Zen_RTS_BuildMenuQueue;

#include "Zen_RTS_West\RTS_West_HQ.sqf"
#include "Zen_RTS_West\RTS_West_Barracks.sqf"
#include "Zen_RTS_West\RTS_West_TankFactory.sqf"
#include "Zen_RTS_West\RTS_West_AirFactory.sqf"

#include "Zen_RTS_East\RTS_East_HQ.sqf"
#include "Zen_RTS_East\RTS_East_Barracks.sqf"
#include "Zen_RTS_East\RTS_East_TankFactory.sqf"
#include "Zen_RTS_East\RTS_East_AirFactory.sqf"

publicVariable "RTS_Used_Building_Types";
// publicVariable "RTS_Used_Asset_Types";

