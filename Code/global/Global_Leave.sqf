

private ["_player","_veh","_group","_My_HQ","_side","_gone","_team","_teamveh","_x"];


_veh = _this select 0;

if (local _veh) then 
{
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

sleep 1;

[_veh,_My_HQ,position _My_HQ] execVM "ZKsBuild\AI_Hunt_Com.sqf";

};