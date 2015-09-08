if !(isserver) exitwith {};

private ["_building","_My_HQ","_initCode","_my_buildingarray","_target","_target1","_lazer","_lazer1","_side","_MyUser"];

_building = _this select 0;
_My_HQ = _this select 1;
_pos = position _building;
sleep 2;
_MyUser = _My_HQ getvariable "MyCargo";

_side = (_MyUser select 1);


_target = "";
_targetpos = [0,0,0];

/*
if (_side == West) then {_target = "I_TargetSoldier"};
if (_side == East) then {_target = "B_TargetSoldier"};
if (_side == resistance) then {_target = "O_TargetSoldier"};
*/



if (_side == West) then {_target = "B_TargetSoldier"};
if (_side == East) then {_target = "O_TargetSoldier"};
if (_side == resistance) then {_target = "I_TargetSoldier"};



	switch (typeof _building) do
	{
	case MedicClass : {_targetpos = [0,0,0.301447]};
	case RemoteUnitClass : {_targetpos = [0,0,2.94555]};
	case DefenceClass : {_targetpos = [0,0,18.3214]};
	case SoldierClass : {_targetpos = [0,0,1.7954]};
	case CarClass : {_targetpos = [0,0,4.1525]};
	case TruckClass : {_targetpos = [0,0,3.43]};
	case TankClass : {_targetpos = [0,0,9.22179]};
	case HeliClass : {_targetpos = [0,0,12.8013]};
	case PlaneClass : {_targetpos = [0,0,8.5549]};
	case ShipClass : {_targetpos = [0,-3,13.3578]};
	case RemoteClass : {_targetpos = [0,0,7.10992]};
	};

//_lazer1 = "Sign_Arrow_Direction_Yellow_F" createVehicle (position _building);

_lazer = _target createVehicle (position _building);
sleep 2;
createVehicleCrew _lazer;
//(driver _lazer) setUnitRank "COLONEL";
//_lazer addMagazine "2000Rnd_65x39_Belt_Tracer_Red";
//_lazer addWeapon "LMG_Minigun_heli";
//_lazer enableSimulation false;
_lazer setvariable ["MyBuilding",_building,false];
_lazer attachTo [_building,_targetpos];
_lazer allowDamage false;
sleep 2;

//_lazer1 attachTo [_lazer,[0,0,0]];


//diag_log str(["BUILDING",_target,typeof _building,(position _building),typeof _lazer,typeof (driver _lazer),_side]);

//hint str(["BUILDING",_target,typeof _building,(position _building),typeof _lazer,_targetpos,_side]);





waituntil {((getDammage _building > 0.3) or (isnull _building))};

_lazer allowDamage true;
_lazer setDamage 1;
deletevehicle _lazer;
sleep .5;



if !(isnull _building) then {_building setdamage 1;_MY_HQ setVariable ["DEAD_TIME",(time + BUILDINGDELAY), true]};

waituntil {(!(alive _building) or (isnull _building))};

_my_buildingarray = [];
_my_buildingarray = _my_buildingarray + (_My_HQ getvariable "BIS_COIN_buildings");
_my_buildingarray = _my_buildingarray - [_building,objnull];
_My_HQ setvariable ["BIS_COIN_buildings",_my_buildingarray,false];

sleep .1;

_My_HQ setvariable ["Made_Base_Buildings",true,false];


				_ordercodedead = {
				_pos = _this select 0;
				_building = _this select 1;
				sleep 1;
				deletevehicle _building; 
				sleep (build_delay_base - 6);
				
				_ai_list = nearestObjects [_pos, deadclass,10]; 
				
					{
					deletevehicle _X;
					sleep 1;
					} foreach _ai_list;
				};
			server_object setVariable ["globalorders", [_pos,_building,_ordercodedead], true];


