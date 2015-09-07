

private ["_MY_HQ","_building","_side","_loop","_timeout","_num","_sound","_var"];

if !(isserver) exitwith {};

_MY_HQ = _this select 0;
_building = _this select 1;
_side = _this select 2;
_num = _this select 3;
_sound = _this select 4;
_var = _this select 5;
_looptime = _this select 6;
_trigger = _this select 7;


sleep 5;


_loop = 0;

while {(!isnull _trigger)} do
{


	
	waituntil {(((_My_HQ getvariable _var) == 1) && (_building in (_My_HQ getvariable "My_Allowed")))};



	while {(_loop < _num)} do
	{
	[_MY_HQ,_side,_sound] execFSM "FSM\Sounds\Sounds_Say.fsm";
	sleep _looptime;
	_loop = _loop + 1;
	};
	
	_loop = 0;
	sleep 20;
	_timeout = (time + 120);
	waituntil {(((_My_HQ getvariable _var) == 0) or !(_building in (_My_HQ getvariable "My_Allowed")) or (time > _timeout))};


};

