/* 
Usage: player addAction ["Push", {[objToPush, Player, 5] execVM "JBOY\JBOY_barrelPush.sqf";}] ;
*/ 
_objToPush = _this select 0;
_pusher = _this select 1;
_speed  = _this select 2;

if (isNull _objToPush) exitWith {};


_objToPush enablesimulation true;  // allow barrel to roll
_vel = velocity _objToPush;
_dir = direction _pusher;
_speed = _speed;  // 5 to 10 is good
_objToPush setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+(cos _dir*_speed),.5];
// call script to increase barrel rolling speed down hill
nul = [barrelName] execVM "JBOY\JBOY_barrel_roll.sqf";


/* if (getDammage _objToPush == 1) then 
{
	_objToPush removeAction _actionID;
}; */