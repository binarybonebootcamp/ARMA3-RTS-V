
private ["_MY_HQ","_side","_color","_flag","_pos","_ammobox","_marker"];

if !(isserver) exitwith {};


_MY_HQ = _this select 0;
	_ammobox = objnull;
	_flag = objnull;
	_tower = objnull;
	_triggerG = objnull;
	_triggerA = objnull;

	while {true} do
	{
	_side = _My_HQ getvariable "Myside";
	sleep 2;
	server_object setVariable ["MysideMarkers",false, false];
	waituntil {_side != _My_HQ getvariable "Myside"};
	sleep .1;
	_MY_HQ setVariable ["My_G_Alarm",0, true];
	_MY_HQ setVariable ["My_A_Alarm",0, true];
	_side = _My_HQ getvariable "Myside";
	sleep .1;

	_color = "colorwhite";

	_sidebase = "";
_My_HQ_Grp = createGroup _side;
_MY_HQ setVariable ["My_HQ_Grp",_My_HQ_Grp, false];




		if (_side != civilian) then {
		_flag = createVehicle ["FlagPole_F", [0,0,0], [], 1, "NONE"];
		sleep .1;
		_flag attachto[_My_HQ,[4,-7,2.5]];
		sleep .5;
		_pos = [(getpos _flag select 0) - 1,(getpos _flag select 1) - 1,0];
		waituntil {(((getposATL _My_HQ) select 2) < 1)};

sleep 1;

	if (_side == West) then {_color = "colorblue";_ammobox = createVehicle [Westammoboxtype, _pos, [], 1, "NONE"];_flag setFlagTexture "\A3\ui_f\data\map\Markers\Flags\usa_ca.paa";WestWins = WestWins + [_My_HQ];EastWins = EastWins - [_My_HQ];GuerWins = GuerWins - [_My_HQ];[_MY_HQ,_ammobox,_side] spawn Server_BaseCamp_ammo;};
	

	if (_side == East) then {_color = "colorred";_ammobox = createVehicle [Eastammoboxtype, _pos, [], 1, "NONE"];_flag setFlagTexture "\A3\ui_f\data\map\Markers\Flags\poland_ca.paa";WestWins = WestWins - [_My_HQ];EastWins = EastWins + [_My_HQ];GuerWins = GuerWins - [_My_HQ];[_MY_HQ,_ammobox,_side] spawn Server_BaseCamp_ammo;};
	
	if (_side == resistance) then {_color = "colorgreen";_ammobox = createVehicle [guerammoboxtype, _pos, [], 1, "NONE"];_flag setFlagTexture "\A3\ui_f\data\map\Markers\Flags\slovakia_ca.paa";WestWins = WestWins - [_My_HQ];EastWins = EastWins - [_My_HQ];GuerWins = GuerWins + [_My_HQ];[_MY_HQ,_ammobox,_side] spawn Server_BaseCamp_ammo;};


		detach _flag;
		_tower = createVehicle ["Land_Loudspeakers_F", [(getpos _flag select 0) - 5,(getpos _flag select 1) - 5,0], [], 1, "NONE"];
		_tower setvectorUp [0,0,.1];
		_flagpos = position _flag;
		_flagpos set [2,0];
		_flag setpos _flagpos;
		_flag setvectorUp [0,0,.1];
		_ammobox allowDamage false;
		_tower allowDamage false;
		_marker = str(_My_HQ);
		_marker setmarkerpos (position _My_HQ);
		_marker setmarkercolor _color;
		server_object setVariable ["MysideMarkers",true, true];

_my_light = server_object getvariable "my_light";
_my_light = _my_light - [objnull];
_my_light = _my_light + [_tower];
server_object setvariable ["my_light",_my_light,true];



_on = format["%1",_My_HQ] + " setVariable ['My_A_Alarm',1, true];" + format["%1",_My_HQ] + " setvariable ['iconmade',true,true];";
_off = format["%1",_My_HQ] + " setVariable ['My_A_Alarm',0, true];" + format["%1",_My_HQ] + " setvariable ['iconmade',true,true];";

if (_side == resistance) then {_sidebase = "((East countside (thislist - (thislist unitsBelowHeight 30)) > 0) or (West countside (thislist -  (thislist unitsBelowHeight 30)) > 0))";};
if (_side == West) then {_sidebase = "((resistance countside (thislist - (thislist unitsBelowHeight 30)) > 0) or (East countside (thislist - (thislist unitsBelowHeight 30)) > 0))";};
if (_side == East) then {_sidebase = "((resistance countside (thislist - (thislist unitsBelowHeight 30)) > 0) or (West countside (thislist - (thislist unitsBelowHeight 30)) > 0))";};


_dis = basearea + 350;
if (_dis < 1000) then {_dis = 1000};
_triggerA=createTrigger["EmptyDetector", _pos];
_triggerA setTriggerArea[_dis,_dis,0,true];
_triggerA setTriggerActivation["ANY","PRESENT",true];
_triggerA setTriggerTimeout[1,1,1, true ];
_triggerA setTriggerStatements[_sidebase, _on, _off];

[_My_HQ,"Planes",_side,6,"A_Alarm","My_A_Alarm",10,_triggerA] spawn Server_Alarms;

_on = format["%1",_My_HQ] + " setVariable ['My_G_Alarm',1, true];" + format["%1",_My_HQ] + " setvariable ['iconmade',true,true];";
_off = format["%1",_My_HQ] + " setVariable ['My_G_Alarm',0, true];" + format["%1",_My_HQ] + " setvariable ['iconmade',true,true];";

if (_side == resistance) then {_sidebase = "((East countside ((thislist - allUnits) unitsBelowHeight 10) > 0) or (West countside ((thislist - allUnits) unitsBelowHeight 10) > 0))";};
if (_side == West) then {_sidebase = "((resistance countside ((thislist - allUnits) unitsBelowHeight 10) > 0) or (East countside ((thislist - allUnits) unitsBelowHeight 10) > 0))";};
if (_side == East) then {_sidebase = "((resistance countside ((thislist - allUnits) unitsBelowHeight 10) > 0) or (West countside ((thislist - allUnits) unitsBelowHeight 10) > 0))";};

_dis = basearea + 250;
if (_dis < 750) then {_dis = 750};
_triggerG=createTrigger["EmptyDetector", _pos];
_triggerG setTriggerArea[_dis,_dis,0,true];
_triggerG setTriggerActivation["ANY","PRESENT",true];
_triggerG setTriggerTimeout[1,1,1, true ];
_triggerG setTriggerStatements [_sidebase, _on, _off];

[_My_HQ,"Defences",_side,10,"G_Alarm","My_G_Alarm",3,_triggerG] spawn Server_Alarms;

[_My_HQ] spawn Server_BaseAlarm;


		}else{
		
		_marker setmarkerpos [0,0,0];
		deletevehicle _ammobox;
		deletevehicle _tower;
		deletevehicle _flag;
		deletevehicle _triggerG;
		deletevehicle _triggerA;
		server_object setVariable ["MysideMarkers",true, true];
		
		};

	};





