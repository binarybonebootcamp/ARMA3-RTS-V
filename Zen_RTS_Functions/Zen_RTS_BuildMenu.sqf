//

#include "Zen_StandardLibrary.sqf"
#include "Zen_FrameworkLibrary.sqf"

0 = _this spawn {
    _Zen_stack_Trace = ["Zen_RTS_BuildMenu", _this] call Zen_StackAdd;

    // _idselection = _this select 0;
    // _index = lbCurSel _idselection;
    // _text = lbText [_idselection, _index];
    // _buildingType = lbData [_idselection, _index];

    _buildingType = _this select 3;
    _side = side player;
    _side2 = [east, west] select ([west, east] find _side);
    _squadNames = ["Alpha", "Bravo", "Charlie", "Delta", "Echo", "Foxtrot"];

    _buildingTypeData = [_buildingType] call Zen_RTS_StrategicBuildingTypeGetData;
    _buildingObjDataGlobal = [_buildingType, true, false] call Zen_RTS_StrategicBuildingObjectGetDataGlobal;

    if (count _buildingObjDataGlobal < 1) exitWith {
        player sideChat "A building of this type does not exist.";
    };

    if (isNull (_buildingObjDataGlobal select 2)) exitWith {
        player sideChat "This building is not fully constructed.";
    };

    _buildingObjDataLocal = [(_buildingObjDataGlobal select 1)] call Zen_RTS_StrategicBuildingObjectGetDataLocal;
    player setVariable ["Zen_RTS_Current_Building", (_buildingObjDataGlobal select 1)];
    closeDialog 0;
    sleep 0.1;

    _idlist = 2000;
    _idback = 2001;
    _idbuild = 2005;

    _iBuildManned = 2015;
    _idbuildsquad = 2020;
    _idsquadlist = 2025;
    _idtitle = 1050;

    _idBtnCustom = 2016;
    _idListCustom = 2030;
    _idBgdCustom = 2031;

    _indexCustoms = 0;
    _idstats = 500;

    _idSldQ = 1030;
    _idLightQ = 1032;
    _idHeavyQ = 1034;
    _idAirQ = 1036;
    // _idNavalQ = 1041;

    _idInfQButton = 1031;
    _idLightQButton = 1033;
    _idHeavyQButton = 1035;
    _idAirQButton = 1039;
    // // _idNavalQButton = 1042;

    _indexAssetList = 0;
    _indexSquadList = 0;
    _indexCustomList = 0;

    createDialog "DlgBuild";
    ctrlEnable [_idstats,FALSE];

    buttonSetAction [_idback, "[player, player, 0] call Zen_RTS_AlphaMenu"];
    buttonSetAction [_idbuild, "[2000, 0, false, false] call Zen_RTS_BuildUnit"];
    buttonSetAction [_iBuildManned, "[2000, 0, true, false] call Zen_RTS_BuildUnit"];
    buttonSetAction [_idbuildsquad, "[2000, 2025, true, true] call Zen_RTS_BuildUnit"];
    buttonSetAction [_idBtnCustom, "[2000, 2030, true, false] call Zen_RTS_BuildUnit"];

    if ((_buildingTypeData select 4) isEqualTo "Barracks") then {
        ctrlShow [_iBuildManned, FALSE]
    };
    {
        ctrlShow [ _x, FALSE];
    } forEach [_idBgdCustom, _idLightQButton, _idHeavyQButton, _idAirQButton, _idLightQ, _idHeavyQ, _idAirQ];

    ctrlSetText [_idbuild, "Deploy"];
    ctrlSetText [_iBuildManned, "Deploy Manned"];
    ctrlSetText [_idbuildsquad, "Deploy for Squad"];
    ctrlSetText [_idBtnCustom, "Deploy Custom Squad"];

    // ctrlSetText [ _idsldQ, "Soldier Queue Empty"];
    // ctrlSetText [ _idLightQ, "Light Queue Empty"];
    // ctrlSetText [ _idHeavyQ, "Heavy Queue Empty"];
    // ctrlSetText [ _idairQ, "Air Queue Empty"];

    // _stats = [ _side, _side2] call compile preprocessFileLineNumbers "functions\rts-statistics-array.sqf";
    // lbClear _idStats;
    // sleep 0.1;

    // {
        // _statName = _x select 0;
        // _statLimit = _x select 1;

        // _info = format ["%1 - %2", _statName, _statLimit];
        // _index = lbAdd [_idStats, _info];
    // } forEach _stats;

    while {ctrlVisible _idlist && {alive player}} do {
        _info = ((_buildingTypeData select 4) + " - level " + str (_buildingObjDataGlobal select 3));
        ctrlSetText [_idtitle, _info];

        lbClear _idlist;
        lbClear _idsquadlist;
        lbClear _idListCustom;

        // Assets
        {
            _assetData = [_x] call Zen_RTS_StrategicAssetGetData;
            _descrRaw = _assetData select 3;
            _access = _assetData select 4;

            if ((toUpper _access isEqualTo "ALL") || {player in [WestCommander, EastCommander]}) then {
                _descrText = ("Cost: " + ([_descrRaw, "Cost: ", ","] call Zen_StringGetDelimitedPart)) + (", Time: " + ([_descrRaw, "Time: ", ","] call Zen_StringGetDelimitedPart));
                _info = (_assetData select 2) + " - " + _descrText;

                _index = lbAdd [_idlist, _info];
                lbSetData [_idlist, _index, _x];
                // lbSetValue [_idlist, _index, _bTime];

                _pic = [_descrRaw, "Picture: ", ","] call Zen_StringGetDelimitedPart;
                if (_pic == "") then {
                    _type = [_descrRaw, "Classname: ", ","] call Zen_StringGetDelimitedPart;
                    if (_type != "") then {
                        _pic = getText (configFile >> "CfgVehicles" >> _type >> "picture");
                        // player sidechat str _pic; // debug
                        lbSetPicture [_idlist, _index, _pic]
                    };
                } else {
                    // player sidechat str _pic; // debug
                    lbSetPicture [_idlist, _index, _pic];
                };
            };
        } forEach ((_buildingObjDataLocal select 1) + (_buildingObjDataGlobal select 4));

        // Queue
        _currentBuilding = (_buildingObjDataGlobal select 1);
        _buildingObjData = [_currentBuilding, false, false] call Zen_RTS_StrategicBuildingObjectGetDataGlobal;
        _assetData = [_currentBuilding] call Zen_RTS_F_StrategicRequestCurrentAssetClient;

        // player commandChat str "queue display data";
        // player commandChat str _assetData;

        _text = "Queue Empty";
        _buttonCode = "[ " + str (_buildingObjData select 1) + ", 0] spawn Zen_RTS_StrategicBuildingQueueRemove";
        if (count _assetData > 0) then {
            _text = _assetData select 2;
            // player commandChat str _text;
        };

        ctrlSetText [_idSldQ, _text];
        buttonSetAction [_idInfQButton, _buttonCode];

        // Group List
        _playerArray = [_side] call Zen_ConvertToObjectArray;
        _playerArray = [_playerArray, compile format [" (switch (side _this) do { case west: {0}; case east: {1};}) != %1", (switch (_side) do { case west: {0}; case east: {1};})]] call Zen_ArrayFilterCondition;
        _playerArray = [_playerArray, {leader group _this != _this}] call Zen_ArrayFilterCondition;
        0 = [_playerArray, WestCommander] call Zen_ArrayRemoveValue;
        0 = [_playerArray, EastCommander] call Zen_ArrayRemoveValue;

        {
            _index = lbAdd [_idsquadlist, format ["%1 (%2)", (name _x), count units _x]];
            // lbSetData [_idsquadlist, _index, _unitInfo];
            // lbSetValue [_idsquadlist, _index, _x];
        } forEach _playerArray;

        // Custom Squads
        for "_i" from 0 to (count RTS_Custom_Squads_Assets - 1) do {
            _index = lbAdd [_idListCustom, _squadNames select _i];
            lbSetValue [_idListCustom, _index, _i];
            // lbSetData [_idListCustom, _index, ""];
            // lbSetColor [_idListCustom, _index, _color];
        };

        lbSetCurSel [_idlist, _indexAssetList];
        lbSetCurSel [_idsquadlist, _indexSquadList];
        lbSetCurSel [_idListCustom, _indexCustomList];
        sleep 2;
        _indexAssetList = lbCurSel _idlist;
        _indexSquadList = lbCurSel _idsquadlist;
        _indexCustomList = lbCurSel _idListCustom;
    };

    call Zen_StackRemove;
    if (true) exitWith {};
};
