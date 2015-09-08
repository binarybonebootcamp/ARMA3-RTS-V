private ["_MY_HQ","_ammobox","_side","_ammo","_ammoty","_target","_ammotype","_z"];

if !(isserver) exitwith {};

_MY_HQ = _this select 0;
_ammobox = _this select 1;
_side = _this select 2;

_ammo = [];
_ammoty = "";
if (_side == West) then {_ammo = ((server_object getVariable "MyWepTypes") select 0);_ammoty = "ammotypeW"};
if (_side == East) then {_ammo = ((server_object getVariable "MyWepTypes") select 1);_ammoty = "ammotypeE"};
if (_side == resistance) then {_ammo = ((server_object getVariable "MyWepTypes") select 2);_ammoty = "ammotypeG"};

_target = objnull;
_ammotype = [];



for "_z" from 0 to ammodropboxsize do
{
_target = _ammo select (floor (random (count _ammo)));
_ammotype set [_z,_target];
};
_My_HQ setVariable [_ammoty, _ammotype, true];



if (_side == West) then {_nil = [_ammobox,_My_HQ,West] execFSM "ZKsBuild\Ammoboxes.fsm";};
if (_side == East) then {_nil = [_ammobox,_My_HQ,East] execFSM "ZKsBuild\Ammoboxes.fsm";};
if (_side == resistance) then {_nil = [_ammobox,_My_HQ,resistance] execFSM "ZKsBuild\Ammoboxes.fsm";};



