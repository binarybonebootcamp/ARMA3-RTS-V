// Exec'd from an action on the player added by rts-init-playeractions.sqs

#include "Zen_StandardLibrary.sqf"
#include "Zen_FrameworkLibrary.sqf"

0 = _this spawn {
    // re-init the most basic vars in case JIP doesn't.
    rts_hq = [side player,"HQ"];

    GUER = resistance;
    CIV = civilian;
    undefined_var = "scalar bool array string 0xe0ffffef";

    sleep 0.2;
    closeDialog 0;

    // if !(rts_moneyMonitorActive) then {
        // [] exec "economy\rts-moneyMonitor.sqs";
    // };

    if ((isNil "playerMoney") || {playerMoney < 0}) then {
        playerMoney = 0;
    };

    _side = side player;

    if !(_side in [west, east]) exitWith {
        player groupChat format ["Side %1 Not Recognized.  Invalid credentials:  Access Denied", _side];
    };

    _side2 = [east, west] select ([west, east] find _side);

    // dialog id definitions
    _idassetlist = 1000;
    _idCustomSquadsMenu = 1003;
    _idselect = 1005;
    _idviewsel = 1010;
    _idviewlist = 1015;
    _idgroupList = 1020;
    _idDisband = 1025;
    _groupListIndex = 0;
    _idtitle = 1050;
    _idstats = 500;

    _idComboHeights = 1040;
    _indexComboHeights = 0;

    _idSldQ = 1030;
    _idLightQ = 1032;
    _idHeavyQ = 1034;
    _idAirQ = 1036;
    // // _idNavalQ = 1041;

    _idInfQButton = 1031;
    _idLightQButton = 1033;
    _idHeavyQButton = 1035;
    _idAirQButton = 1039;
    // _idNavalQButton = 1042;

    createDialog "DlgStatus";
    ctrlSetText [_idtitle, "RTS V Mission Status"];
    // ctrlSetText [_idselect, "Purchase Units"];
    // buttonSetAction [_idselect, "[1000] call Zen_RTS_BuildMenu"];
    buttonSetAction [_idCustomSquadsMenu, "call Zen_RTS_SquadsMenu"];
    buttonSetAction [_idDisband, "[1020] call Zen_RTS_DisbandUnit"];

    // ;;ctrlShow [_idScramble, FALSE];
    // ;;ctrlShow [_idsatellite,FALSE];
    // ;;ctrlShow [_idroles, FALSE];
    // ;;ctrlShow [_iddestruct, FALSE];

    ctrlEnable [_idstats,FALSE];
    {
        ctrlShow [ _x, FALSE];
    } forEach [_idLightQButton, _idHeavyQButton, _idAirQButton, _idLightQ, _idHeavyQ, _idAirQ, _idselect];

    if (player in [WestCommander,EastCommander]) then {
        // ctrlShow [_iddestruct, FALSE];
    };

    _viewDistSteps = [];
    for "_i" from 1 to 8 do {
        _viewDistSteps pushBack str (_i * 500);
    };
    for "_i" from 5 to 10 do {
        _viewDistSteps pushBack str (_i * 1000);
    };
    {
        _index = lbAdd [_idviewlist, _x];
        lbSetValue [_idviewlist, _index, call compile _x];
    } forEach _viewDistSteps;

    buttonSetAction [_idviewsel, "[1015] call Zen_RTS_SetViewDistance"];
    ctrlSetText [_idviewsel, "Set View Distance"];
    lbSetCurSel [_idviewlist, 0];

    _assetIndex = 0;

    _F_RTS_StatsArray = compile preprocessFileLineNumbers "functions\rts-statistics-array.sqf";
    _F_RTS_UnitInfo = compile preprocessFileLineNumbers "functions\rts-unitInfo.sqf";

    while {ctrlVisible _idassetList && {alive player}} do {
        _assetIndex = lbCurSel _idassetList;
        _groupListIndex = lbCurSel _idGroupList;
        _indexComboHeights = lbCurSel _idComboHeights;

        // Stats
        lbClear _idassetlist;
        _stats = [_side,_side2] call _F_RTS_StatsArray;

        lbClear _idStats;
        {
            _statName = _x select 0;
            _statLimit = _x select 1;

            _info = format ["%1:  %2",_statName,_statLimit];
            _index = lbAdd [_idStats,_info];
        } forEach _stats;

        // Heights
        lbClear _idComboHeights;
        _flyHeightSteps = [1,10,13,20,30,50,77,100,200,300,400,500,600,700,1000,1500,2000,2500,3000];
        {
            _index = lbAdd [_idComboHeights, str _x];
            lbSetValue [_idComboHeights, _index, _x];
        } forEach _flyHeightSteps;
        lbSetCurSel [_idComboHeights, _indexComboHeights];

        // Groups
        lbClear _idgroupList;
        _units = units player;
        {
            _uInfo = [_x] call _F_RTS_UnitInfo;

            _uClass = _uInfo select 0;
            _uVclName = _uInfo select 1;
            _cPos = _uInfo select 2;

            _info = format ["%1-%2 %3", _uClass, _cPos, _uVclName];

            _index = lbAdd [_idGroupList,_info];
            lbSetData [_idGroupList, _index, _x];
            lbSetValue [_idGroupList, _index, _forEachIndex];
        } forEach (units player);
        lbSetCurSel [_idgroupList, _groupListIndex];

        // Buildings
        {
            _bldData = [_x] call Zen_RTS_StrategicBuildingTypeGetData;
            _buildingObjData = [_x, true, false] call Zen_RTS_StrategicBuildingObjectGetDataGlobal;

            _buildingTypeData = [_x] call Zen_RTS_StrategicBuildingTypeGetData;
            _descrRaw = _buildingTypeData select 5;

            private "_info";
            _buildingName = _bldData select 4;
            if ((count _buildingObjData == 0) || {isNull (_buildingObjData select 2)}) then {
                _info = (_buildingName + " - Offline");
            } else {
                _info = (_buildingName + " - Online - Level " + str (_buildingObjData select 3));
            };

            _index = lbAdd [_idassetlist,_info];
            lbSetData [_idassetlist, _index, _x];
            lbSetValue [_idassetlist, _index, _forEachIndex];

            _pic = [_descrRaw, "Picture: ", ","] call Zen_StringGetDelimitedPart;
            if (_pic == "") then {
                _type = [_descrRaw, "Classname: ", ","] call Zen_StringGetDelimitedPart;
                if (_type != "") then {
                    _pic = getText (configFile >> "CfgVehicles" >> _type >> "picture");
                    // player sidechat str _pic; // debug
                    lbSetPicture [_idassetlist, _index, _pic];
                };
            } else {
                // player sidechat str _pic; // debug
                lbSetPicture [_idassetlist, _index, _pic];
            };
        } forEach (RTS_Used_Building_Types select ([west, east] find _side));
        lbSetCurSel [_idassetlist, _assetIndex];

        // Queue
        _currentBuildingIndex = lbCurSel _idassetlist;
        _currentBuildingType = lbData [_idassetlist, _currentBuildingIndex];

        // player commandChat str _currentBuildingType;
        _buildingObjData = [_currentBuildingType, true, false] call Zen_RTS_StrategicBuildingObjectGetDataGlobal;
        _text = "Queue Empty";
        _buttonCode = "";
        if (count _buildingObjData > 0) then {
            _assetData = [(_buildingObjData select 1)] call Zen_RTS_F_StrategicRequestCurrentAssetClient;

            // player commandChat str "queue display data";
            // player commandChat str _assetData;

            if (count _assetData > 0) then {
                _text = _assetData select 2;
                // player commandChat str _text;
            };

            _buttonCode = "[ " + str (_buildingObjData select 1) + ", 0] spawn Zen_RTS_StrategicBuildingQueueRemove";
        };

        ctrlSetText [_idSldQ, _text];
        buttonSetAction [_idInfQButton, _buttonCode];
        sleep 2;
    };

    if (true) exitWith {};
};
