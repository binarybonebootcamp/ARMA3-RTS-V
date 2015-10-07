//

#include "Zen_StandardLibrary.sqf"
#include "Zen_FrameworkLibrary.sqf"

if !(isServer) exitWith {};
sleep 2;

_westQueue = ([west] call Zen_ConvertToObjectArray);
_eastQueue = ([east] call Zen_ConvertToObjectArray);

if (isMultiplayer) then {
    _westQueuePlayers = [_westQueue, {!(isPlayer _this)}] call Zen_ArrayFilterCondition;
    _eastQueuePlayers = [_eastQueue, {!(isPlayer _this)}] call Zen_ArrayFilterCondition;

    if (count _westQueuePlayers > 0) then {
        _westQueue = _westQueuePlayers;
    };

    if (count _eastQueuePlayers > 0) then {
        _eastQueue = _eastQueuePlayers;
    };
};

WestCommander = _westQueue select 0;
EastCommander = _eastQueue select 0;

publicVariable "WestCommander";
publicVariable "EastCommander";

while {true} do {
    sleep 5;

    #define PROCESS_COMMANDER_QUEUE(S, V, A) \
    { \
        if (alive _x) exitWith { \
            if (V != _x) then { \
                V = _x; \
                publicVariable #V; \
                _args = ["sideChat", [[S,"HQ"], (format ["Reassigning %1 as %2 Commander", Name V, S])]]; \
                ZEN_FMW_MP_REAll("Zen_ExecuteCommand", _args, call) \
            }; \
        }; \
    } forEach A;

    PROCESS_COMMANDER_QUEUE(west, WestCommander, _westQueue)
    PROCESS_COMMANDER_QUEUE(east, EastCommander, _eastQueue)
};
