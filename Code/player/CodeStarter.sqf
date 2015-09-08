

if (isDedicated) exitwith {};




Player_Orders_Code_PV = compile preprocessFileLineNumbers "Code\Player\Player_Orders_Code_PV.sqf";


if (isNil "playerorders_PV") then {playerorders_PV = [objNull,""];};

"playerorders_PV" addPublicVariableEventHandler {
private["_array"];
_array = _this select 1;
[_array] spawn Player_Orders_Code_PV; 
};


Player_MarkerCode = compile preprocessFile "Code\player\Player_MarkerCode.sqf";
Player_ZKsBuild_Menu = compile preprocessFile "Code\player\Player_ZKsBuild_Menu.sqf";
Player_MapCode = compile preprocessFile "Code\Player\Player_MapCode.sqf";
Player_Radio_Code = compile preprocessFile "Code\Player\Player_Radio_Code.sqf";
Player_Find_Code = compile preprocessFile "Code\Player\Player_Find_Code.sqf";
Player_MapMarkerCode = compile preprocessFile "Code\player\Player_MapMarkerCode.sqf";
reviveMouseEvents = compile preprocessFile "FSM\Revive\RESPAWN_Mouse.sqf";
Player_Players = compile preprocessFile "Code\player\Player_Players.sqf";
_nil = [] execVM "Code\Player\Player_Orders_Code.sqf";
































