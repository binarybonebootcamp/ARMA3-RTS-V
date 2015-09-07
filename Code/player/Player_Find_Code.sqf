
if (isDedicated) exitwith {};

private ["_player","_mylift","_reinforcementstmp","_dis","_reinforcementstmp","_x","_button"];


_player = _this select 0;
_dis = _this select 1;
_reinforcementstmp = _this select 2;
_button = _this select 3;
_mylift = objnull;
_reinforcements = [];


if (_button != 3) then 
{
{if (((_x emptypositions "Cargo") > 0) or ((_x emptypositions "Commander") > 0)) then {_reinforcements = _reinforcements + [_x]}} foreach _reinforcementstmp;
}else{
{_reinforcements = _reinforcements + [_x]} foreach _reinforcementstmp;
};


_mylift = if (count _reinforcements > 0) then {(_reinforcements select 0)}else{objnull};
{if ((_x distance _player) < (_mylift distance _player)) then {_mylift = _x}} foreach _reinforcements;

_mylift




