//

_doPresent = _this select 0;

if (isDedicated) exitWith {};

waitUntil {!(isNull Player)};
waitUntil {(local player)};

loadChange = compileFinal preprocessFile "digitalLoadout\loadChange.sqf";
TAG_loadoutRespawnDialog = compileFinal preprocessFile "digitalLoadout\respawnUI.sqf";
TAG_missionStart_UI = compileFinal preprocessFile "digitalLoadout\missionStartUI.sqf";

if (_doPresent) then {
    waitUntil { time > 1 };

    switch (faction player) do {
       case "BLU_F":{[] call compile preprocessFile "digitalLoadout\LoadoutsBlu.sqf";};
       case "BLU_G_F":{[] call compile preprocessFile "digitalLoadout\LoadoutsFia.sqf";};
       case "IND_F":{[] call compile preprocessFile "digitalLoadout\LoadoutsInd.sqf";};
       case "OPF_F":{[] call compile preprocessFile "digitalLoadout\LoadoutsOpf.sqf";};
    };

      waitUntil {!isnil "BIS_fnc_establishingShot_playing" && {!BIS_fnc_establishingShot_playing}};
      call TAG_MissionStart_UI;
      [player] call TAG_FNC_Rifleman;
};
