

private ["_player","_veh","_group","_My_HQ","_side","_gone","_team","_teamveh","_x"];


_veh = _this select 0;

if (local _veh) then {

_gone = _this select 1;

_player = _gone select 0;
_My_HQ = _gone select 1;
_side = _gone select 2;

sleep 1;

_teamveh = [];
_veh setVariable ["hunt", nil, true];
_group = createGroup _side;

{if (_player != _x) then 
{
	if !(isplayer _x) then 
	{
	[_x] join _group;
	_teamveh = _teamveh + [_x];
	_x setCombatMode "red";
	_x setSpeedMode "FULL";
	_x setSkill ["spotDistance",Aiskill];
	_x setSkill ["spotTime",Aiskill];
	_x addEventHandler ["killed",{_this execFSM "FSM\Men\AI_Cleaner.fsm";(_this select 0) setpos getPos (_this select 0);}];
	};

}} foreach crew _veh;

{_x setvariable ["MYTEAM",_teamveh,false]} foreach _teamveh;
[_veh, _side] execFSM "FSM\Vehicle\AI_Driver_Start.fsm";

_autohunt =
{
_veh = _this select 0;
_My_HQ = _this select 1;

	while {alive _veh} do
	{
	_delay = (time + 120);

	waituntil {((time > _delay) or (!isnil {(_veh getVariable "hunt")}))};
	sleep 1;
	if (isnil {(_veh getVariable "hunt")}) then {_veh setVariable ["hunt",(position _My_HQ),true]};
	sleep 5;
	waituntil {((isnil {(_veh getVariable "hunt")}) && (_veh distance _My_HQ < 150))};
	};
	
};


if !((typeOf _veh) in Base_Trucks) then 
{
[_My_HQ, _veh] execFSM "ZKsBuild\AI_Guard.fsm";
[_veh,_My_HQ] spawn _autohunt;
}else{
[_MY_HQ,_veh] execFSM "ZKsBuild\AI_GetBase.fsm";
};


sleep 1;

[_veh,_My_HQ,position _My_HQ] execVM "ZKsBuild\AI_Hunt_Com.sqf";

};