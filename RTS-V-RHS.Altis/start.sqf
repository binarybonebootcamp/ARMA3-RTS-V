_mort = objNull;
_hgm = objNull;

	 _mort = player addAction ["<t color='#4e3366'>" + "CreateMortar" + "</t>", "formee.sqf", [], 100, false, true, "teamSwitchPrev", "vehicle player isKindOf 'B_MRAP_01_F'"];
     _hgm = player addAction ["<t color='#345678'>" + "CreateHGM" + "</t>", "forhgm.sqf", [], 100, false, true, "teamSwitchPrev", "vehicle player isKindOf 'B_MRAP_01_F'"];