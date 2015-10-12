
   if (isPlayer (_this select 0)) then {
       CreateDialog "DigitalLoadout";
       [(_this select 0)] call loadChange;
       [(_this select 0)] call TAG_FNC_Rifleman;
      };


