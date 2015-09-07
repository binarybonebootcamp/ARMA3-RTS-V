

//private ["_MY_HQ","_desk","_chair","_laptop","_board","_radio","_closecode"];

private ["_MY_HQ","_closecode"];


if !(isserver) exitwith {};

_MY_HQ = _this select 0;




[_My_HQ, "Door_1_rot", "Door_Handle_1_rot_1", "Door_Handle_1_rot_2"] execVM "\A3\Structures_F\scripts\Door_open.sqf";
[_My_HQ, "Door_2_rot", "Door_Handle_2_rot_1", "Door_Handle_2_rot_2"] execVM "\A3\Structures_F\scripts\Door_open.sqf";


_closecode = [_My_HQ];
_My_HQ setvariable ["closecode",_closecode,false];


