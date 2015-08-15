
RTS_FNC_INIT_PLAYERACTIONS = {
    _playerunit = _this select 0;
    _unit = _this select 1;
    _unitname = Name _unit;
    _oldactionid = _this select 2;
    waitUntil {not (isNil "rts_Initialized")};
    waitUntil {rts_Initialized AND rts_arrays_initialized};

    _msg = Format["COMMUNICATIONS ESTABLISHED"];
    _name = "";
    rts_hq sideChat _msg;
    Hint _msg;

 actionid = _playerunit AddAction["<img size='1' color='#f77613' shadow='2' image='\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Face_ca.paa' /><t size='1' shadow='1.5' color=""#f72032"">" + ("*RTS Player Menu*") + "</t><img size='1' color='#f77613' shadow='2' image='\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Face_ca.paa'/>", Zen_RTS_AlphaMenu];
    actionid = _playerunit addAction ["<img size='1' color='#33339b' shadow='2' image='\A3\ui_f\data\map\vehicleicons\pictureParachute_ca.paa' /><t size='1.5' shadow='2' color=""#f72032"">" + ("Emergency-Eject") + "</t><img size='1' color='#33339b' shadow='2' image='\A3\ui_f\data\map\vehicleicons\pictureParachute_ca.paa'/>", "forceEject.sqf", [], -9, false, true, "", "(vehicle player) isKindOf 'Air'"];
    actionid = _playerunit addAction ["<img size='1' color='#337e9b' shadow='2' image='\A3\ui_f\data\map\vehicleicons\pictureParachute_ca.paa' /><t size='1.5' shadow='2' color=""#f72032"">" + ("Vehicle-Eject") + "</t><img size='1' color='#337e9b' shadow='2' image='\A3\ui_f\data\map\vehicleicons\pictureParachute_ca.paa'/>", "forceEject.sqf", [], -9, false, true, "", "(vehicle player) isKindOf 'Car'"];
    actionid = _playerunit addAction ["<img size='1' color='#f42a13' shadow='2' image='\A3\ui_f\data\gui\cfg\Hints\actionmenu_ca.paa' /><t size='1.5' shadow='2' color=""#136db2"">" + ("OPEN CHUTE") + "</t><img size='2' color='#f42a13' shadow='1' image='\A3\ui_f\data\gui\cfg\Hints\actionmenu_ca.paa'/>", "openParachute.sqf", [], 20, true, true, "", "vehicle player == player && (getPos player) select 2 > 2.5"];
	
execvm "RTS_JUMPACTIONS.sqf";	

    if (Side _unit == west) then {
        _msg = "Checking command status";
        rts_hq sideChat _msg;

        sleep 2;
        waitUntil {not (IsNull WestCommander) AND (Alive WestCommander)};
        _name = Name WestCommander;

    } else {
        _msg = "Checking command status";
        rts_hq sideChat _msg;

        sleep 2;
        waitUntil {not (IsNull EastCommander) AND (Alive EastCommander)};

        _name = Name EastCommander;
    };

    _msg = Format["%1 is your commander.",_name];
    rts_hq sideChat _msg;
};
