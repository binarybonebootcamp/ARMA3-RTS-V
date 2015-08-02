//

#include "Zen_StandardLibrary.sqf"
#include "Zen_FrameworkLibrary.sqf"

0 = _this spawn {
    _Zen_stack_Trace = ["Zen_RTS_BuildUnit", _this] call Zen_StackAdd;
    _idAssetList = _this select 0;
    _idCustomList = _this select 1;
    _manned = _this select 2;
    _forSquad = _this select 3;

    if (rating player < 0) then {
        player addRating ((rating player * -1));
    };

    _side = side player;
    _buildintObjId = player getVariable "Zen_RTS_Current_Building";
    // _buildingObjData = [_buildintObjId] call Zen_RTS_StrategicBuildingObjectGetDataGlobal;
    _buildingObjDataLocal = [_buildintObjId] call Zen_RTS_StrategicBuildingObjectGetDataLocal;

    _index = lbCurSel _idAssetList;
    // _text = lbText [_idAssetList, _index];
    // _available = lbValue [_idAssetList, _index];

    if (_idCustomList == 2030) then { // custom squad
        _index = lbCurSel _idCustomList;
        _customSquadIndex = lbValue [_idCustomList, _index];
        // _squadName = lbText [_idCustomList, _index];
        // _customArray = lbData [_idc2, _index];

        _customAssets = RTS_Custom_Squads_Assets select _customSquadIndex;
        {
            _assetData = [_x] call Zen_RTS_StrategicAssetGetData;
            _cost = _assetData select 4;

            if (playerMoney < _cost) exitWith {
                player sideChat "Insufficient funds";
            };

            // closeDialog 0;
            playerMoney = playerMoney - _cost;

            0 = [_buildintObjId, _x, player, _manned] call Zen_RTS_StrategicAssetInvoke;
        } forEach _customAssets;
    } else {
        _assetType = lbData [_idAssetList, _index];
        _assetData = [_assetType] call Zen_RTS_StrategicAssetGetData;
        _cost = _assetData select 4;

        if (playerMoney < _cost) exitWith {
            player sideChat "Insufficient funds";
        };

        // closeDialog 0;
        playerMoney = playerMoney - _cost;

        _buildingObjDataLocal set [3, (_buildingObjDataLocal select 3) + 1];

        if (_forSquad) then {
            _playerArray = [_side] call Zen_ConvertToObjectArray;
            _playerArray = [_playerArray, compile format [" (switch (side _this) do { case west: {0}; case east: {1};}) != %1", (switch (_side) do { case west: {0}; case east: {1};})]] call Zen_ArrayFilterCondition;
            _playerArray = [_playerArray, {leader group _this != _this}] call Zen_ArrayFilterCondition;
            0 = [_playerArray, WestCommander] call Zen_ArrayRemoveValue;
            0 = [_playerArray, EastCommander] call Zen_ArrayRemoveValue;

            _index = lbCurSel _idCustomList;
            _unit = _playerArray select _index;
            0 = [_buildintObjId, _assetType, _unit, _manned] call Zen_RTS_StrategicAssetInvoke;
        } else {
            0 = [_buildintObjId, _assetType, player, _manned] call Zen_RTS_StrategicAssetInvoke;
        };
    };

    call Zen_StackRemove;
    if (true) exitWith {};
};
