if !(isserver) exitwith {};

private ["_player","_veh","_pos","_smk","_pad"];

_veh = _this select 0;	
_player = (_veh getVariable "lift");

_side = side _player;
_SmokeShell = "SmokeShellYellow";
if (_side == West) then {_SmokeShell = "SmokeShellBlue";};
if (_side == East) then {_SmokeShell = "SmokeShellRed";};
if (_side == resistance) then {_SmokeShell = "SmokeShellGreen";};

sleep 1;



_pos = position _player;
_smk = _SmokeShell createVehicle [(_pos select 0),(_pos select 1),(_pos select 2) + 15]; 
_smk attachto [_player,[0,25,15]];

sleep .2;
detach _smk;
sleep 3;
_pad = "Land_HelipadEmpty_F" createVehicle (position _smk);

waituntil {(((position _veh select 2) < 5) or !(alive _veh) or !(alive _player))};

sleep 2;

if (!isnull _pad) then {deletevehicle _pad;deletevehicle _smk};





