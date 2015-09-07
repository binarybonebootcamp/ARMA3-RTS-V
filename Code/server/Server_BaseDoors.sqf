
private ["_MY_HQ","_closecode"];

if !(isserver) exitwith {};

_My_HQ = _this select 0;

while {true} do
{
sleep .2;
waituntil {(count (_My_HQ getvariable "My_Users") > 0)};
[_MY_HQ] spawn Server_Open_Code;
sleep 2;
_closecode = _My_HQ getvariable "closecode";

sleep 2;
waituntil {(count (_My_HQ getvariable "My_Users") == 0)};

sleep 1;
_closecode spawn Server_Close_Code;

};





