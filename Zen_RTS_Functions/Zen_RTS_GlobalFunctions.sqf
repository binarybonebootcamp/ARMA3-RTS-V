GetSideID = {
    (0)
};

GetClientID = {
    (0)
};

GetNamespace = {
    (0)
};

Zen_RTS_F_RequestEconomyData = {
    (owner _this) publicVariableClient "Zen_RTS_Economy_Data";
};

Zen_RTS_F_RespawnActions = {
    while {true} do {
        0 = [player] spawn Zen_RTS_DeployPlayer;

        waitUntil {
            sleep 2;
            (alive player)
        };

        0 = [Player,player,0] spawn RTS_FNC_INIT_PLAYERACTIONS;

        waitUntil {
            sleep 2;
            !(alive player)
        };
    };
};
