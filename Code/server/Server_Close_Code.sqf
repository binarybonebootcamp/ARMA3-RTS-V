
private ["_MY_HQ"];
//private ["_MY_HQ","_desk","_chair","_laptop","_board","_radio"];

if !(isserver) exitwith {};

_My_HQ = _this select 0;


/*
_desk = _this select 1;
_chair = _this select 2;
_laptop = _this select 3;
_board = _this select 4;
_radio = _this select 5;
*/


_My_HQ setvariable ["My_Office",_My_HQ,true];

[_My_HQ, "Door_1_rot", "Door_Handle_1_rot_1", "Door_Handle_1_rot_2"] execVM "\A3\Structures_F\scripts\Door_close.sqf";
[_My_HQ, "Door_2_rot", "Door_Handle_2_rot_1", "Door_Handle_2_rot_2"] execVM "\A3\Structures_F\scripts\Door_close.sqf";

/*
deletevehicle _desk; 
deletevehicle _chair;
deletevehicle _laptop;
deletevehicle _board;
deletevehicle _radio;
*/