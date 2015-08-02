

WEST setFriend [RESISTANCE, 0];
RESISTANCE setFriend [WEST, 0]; 
WEST setFriend [EAST, 0]; 
EAST setFriend [WEST, 0];
RESISTANCE setFriend [EAST, 0];
EAST setFriend [RESISTANCE, 0]; 

sleep .1;
[] execVM "ZKS\Code\server\CodeStarter.sqf";


