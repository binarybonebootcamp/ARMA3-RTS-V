// from action

#define RECYCLE_COEFF 0.5

0 = _this spawn {
    _vehicle = vehicle player;
    _args = _this select 3;

    player setVariable ["Zen_RTS_RecycleActive", true, false];
    _heliPad = "Sign_Arrow_F" createVehicleLocal [0,0,0];

    hint "Any recyclable object will\nhave a red arrow appear over it.\nChoose Confirm Recycle to finalize.";
    player addAction ["Confirm Recycle", {
        (_this select 0) removeAction (_this select 2);
        player setVariable ["Zen_RTS_RecycleActive", false, false];
        _object = player getVariable "Zen_RTS_RecycleObject";

        if (isNull _object) then {
            player groupChat "No valid recycleable object selected.";
        } else {
            _objectVaue = _object getVariable "Zen_RTS_StrategicDebrisValue";
            playerMoney = playerMoney + _objectVaue * RECYCLE_COEFF;
            player groupChat ("You have recieved: $" + (str round (_objectVaue * RECYCLE_COEFF)) + " from recycling this object.");
            sleep 2;
            deleteVehicle _object;
        };

    }];

    while {(player getVariable "Zen_RTS_RecycleActive")} do {
        sleep 1;

        _pos = [_vehicle, 20, getDir _vehicle] call Zen_ExtendPosition;
        _objects = nearestObjects [_pos, ["All"], 10];
        player sideChat str _objects;
        player setVariable ["Zen_RTS_RecycleValid", false, false];
        player setVariable ["Zen_RTS_RecycleObject", objNull, false];
        if (player in _vehicle) then {
            {
                if (_x getVariable ["Zen_RTS_IsStrategicDebris", false]) exitWith {
                    player setVariable ["Zen_RTS_RecycleValid", true, false];
                    player setVariable ["Zen_RTS_RecycleObject", _x, false];
                    _heliPad setPosATL (getPosATL _x vectorAdd [0,0,5]);
                };
            } forEach _objects;
        };

        if !(player getVariable "Zen_RTS_RecycleValid") then {
            _heliPad setPosATL [0,0,0];
        };
    };

    deleteVehicle _heliPad;
    player setVariable ["Zen_RTS_RecycleActive", nil, false];
    player setVariable ["Zen_RTS_RecycleObject", nil, false];
    player setVariable ["Zen_RTS_RecycleValid", nil, false];
};
