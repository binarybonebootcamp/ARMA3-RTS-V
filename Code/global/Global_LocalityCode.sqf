sleep 1;
_myunit = _this select 0;


if (isnil {_myunit}) exitwith {};
if !(local _myunit) exitwith {};


_locality = _this select 1;
_veh = vehicle _myunit;
_My_HQ = (_myunit call Global_HQ);
_side = side _myunit;
_myunit removeAllEventHandlers "Local";





if !(_veh isKindOf "CAManBase") then
{


//_teamveh = [];


_boss = if (isnil {effectiveCommander _veh}) then {((crew _veh) select 0)}else{effectiveCommander _veh};

	{if !(isplayer _x) then 
	{
	_group = if ((isnil {group _boss}) or (isplayer _boss)) then {createGroup _side}else{group _boss}; //createGroup _side;
	[_x] join _group;
	_x setCombatMode "red";
	_x setSpeedMode "FULL";
	_x setSkill ["spotDistance",Aiskill];
	_x setSkill ["spotTime",Aiskill];
	_x addEventHandler ["killed",{_this execFSM "FSM\Men\AI_Cleaner.fsm";(_this select 0) setpos getPos (_this select 0);}];
	_x addEventHandler ["Local",{_this spawn Global_LocalityCode;}];

//diag_log str(["IN CAR",_x,_locality,_group,_boss,_group]);
	}} foreach crew _veh;



{_x setvariable ["MYTEAM",crew _veh,false]} foreach crew _veh;


//diag_log str(["CAR",_myunit,_locality]);

_veh setVariable ["hunt", nil, true];
[_veh, _side] execFSM "FSM\Vehicle\AI_Driver_Start.fsm";
[_veh,_My_HQ,position _My_HQ] execVM "ZKsBuild\AI_Hunt_Com.sqf";






}else{
//_group = createGroup _side;
//[_myunit] join _group;


//diag_log str(["MAN",_myunit,_locality]);

_myunit setCombatMode "red";
_myunit setSpeedMode "FULL";
_myunit setSkill ["spotDistance",Aiskill];
_myunit setSkill ["spotTime",Aiskill];
_myunit addEventHandler ["killed",{_this execFSM "FSM\Men\AI_Cleaner.fsm";}];
_myunit setvariable ["MYTEAM",[_myunit],false];
_myunit setvariable ["patrol",nil,false];
[_myunit,_My_HQ] execFSM "ZKsBuild\AI_Patrol.fsm";
_myunit addEventHandler ["Local",{_this spawn Global_LocalityCode;}];

};



