




if !(isserver) exitwith {};


Server_Orders_Code_PV = compile preprocessFileLineNumbers "Code\Server\Server_Orders_Code_PV.sqf";




if (isNil "serverorders_PV") then {serverorders_PV = [objNull,""];};

"serverorders_PV" addPublicVariableEventHandler {
private["_array"];
_array = _this select 1;
[_array] spawn Server_Orders_Code_PV; 
};


HQ_status_server = compile preprocessFile "Code\server\HQ_status_server.sqf";
Server_Alarms = compile preprocessFile "Code\server\Server_Alarms.sqf";
Server_MarkerClean = compile preprocessFile "Code\server\Server_MarkerClean.sqf";
Server_BaseAlarm = compile preprocessFile "Code\server\Server_BaseAlarm.sqf";
Server_BaseCamp = compile preprocessFile "Code\server\Server_BaseCamp.sqf";
Server_BaseCamp_ammo = compile preprocessFileLineNumbers "Code\server\Server_BaseCamp_ammo.sqf";
Server_BaseDoors = compile preprocessFile "Code\server\Server_BaseDoors.sqf";
Server_Open_Code = compile preprocessFile "Code\server\Server_Open_Code.sqf";
Server_Seen_Code = compile preprocessFile "Code\server\Server_Seen_Code.sqf";
Server_SmokeCode = compile preprocessFile "Code\server\Server_SmokeCode.sqf";
Server_Dead_Building = compile preprocessFile "Code\server\Server_Dead_Building.sqf";
Server_Orders_Code = compile preprocessFile "Code\server\Server_Orders_Code.sqf";
Server_Ammo_Drop = compile preprocessFile "Code\server\Server_Ammo_Drop.sqf";
Server_Civ_Code = compile preprocessFile "Code\server\Server_Civ_Code.sqf";
Server_Fire_Code = compile preprocessFile "Code\server\Server_Fire_Code.sqf";
Server_Find_Pos = compile preprocessFile "Code\server\Server_Find_Pos.sqf";
sleep 1;
Server_Close_Code = compile preprocessFile "Code\server\Server_Close_Code.sqf";



server_object setVariable ["seen", nil, false];
[] spawn Server_Seen_Code;
server_object setVariable ["serverorders", nil, false];
[] spawn Server_Orders_Code;











