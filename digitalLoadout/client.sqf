If (!IsDedicated) Then {
  waitUntil { !IsNull Player };
      if (local player) then {
        [] call compile preprocessFile "digitalLoadout\loadChange.sqf";
        [] call compile preprocessFile "digitalLoadout\respawnUI.sqf";
        [] call compile preprocessFile "digitalLoadout\missionStartUI.sqf";
        [] call compile preprocessFile "digitalLoadout\respawnUI.sqf";

        
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

     
};
