//

#include "Zen_StandardLibrary.sqf"
#include "Zen_FrameworkLibrary.sqf"

if !(isServer) exitWith {};

WestCommander = ([([west] call Zen_ConvertToObjectArray)] call Zen_ArrayRemoveDead) select 0;
EastCommander = ([([east] call Zen_ConvertToObjectArray)] call Zen_ArrayRemoveDead) select 0;

publicVariable "WestCommander";
publicVariable "EastCommander";

while {true} do {
    sleep 5;

    #define HANDLE_DEATH(S, V) \
        if !(alive V) then { \
            V = objNull; \
            _unitArray = [([S] call Zen_ConvertToObjectArray)] call Zen_ArrayRemoveDead; \
            if (count _unitArray > 0) then { \
                V = _unitArray select 0; \
            }; \
            if !(isNull V) then { \
                _args = ["sideChat", [[S,"HQ"], (format ["Reassigning %1 as %2 Commander", Name V, S])]]; \
                ZEN_FMW_MP_REAll("Zen_ExecuteCommand", _args, call) \
            }; \
        };

    HANDLE_DEATH(west, WestCommander)
    HANDLE_DEATH(east, EastCommander)
};
