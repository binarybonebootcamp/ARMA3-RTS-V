//

private ["_vehicle"];

_vehicle = _this select 0;

_vehicle lockTurret [[0], true];
_vehicle lockTurret [[0,0], true];
_vehicle lockCargo true;
_vehicle addEventHandler ["GetIn", {
    enableSentences false;
    _tank = _this select 0;
    _unit = _this select 2;

    _unit allowDamage false;
    _unit action ["EngineOn", _tank];
    _unit action ["MoveToGunner", _tank];

    _tank lock true;
    _tank switchCamera "EXTERNAL";

    _tank addAction [localize "str_action_getout", {
        (_this select 0) removeAction (_this select 2);
        (_this select 1) action ["GetOut", _this select 0];
    }, "", 3, false, true, "GetOver"];

    0 = _tank spawn {
        waitUntil {!isNull gunner _this};
        _ai = createAgent [
        typeOf gunner _this, [0,0,0], [], 0, "NONE" ];
        _ai allowDamage false;
        _ai moveInDriver _this;
    };
}];

_vehicle addEventHandler ["GetOut", {
    _tank = _this select 0;
    _unit = _this select 2;

    deleteVehicle driver _tank;
    _unit allowDamage true;
    _unit action ["EngineOff", _tank];

    _tank lock false;
    enableSentences true;
}];
