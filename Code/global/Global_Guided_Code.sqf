

_veh = _this select 0;
_missile = _this select 1;
_target = _this select 2;

if (isplayer gunner _veh) exitwith {};

_range = 0;



if !(isnil {_target}) then {
if ((isNull _target) or !(alive _target) or (isNull _missile) or (typeName _target != "OBJECT")) exitWith {sleep 5;deletevehicle _missile;};
};

if (((getPosATL _target) select 2) < 10) then {_range = 500}else{_range = 15};


gunner _veh dowatch objnull;
_veh dowatch objnull;
gunner _veh dotarget objnull;
_veh dotarget objnull;


//diag_log str(["FIRED",typeof _target,typeof _veh,_missile,(_target distance _veh),((getPosATL _target) select 2),_range]);

//if (isnull _missile) then {_missile = _m};


waituntil {((_missile distance _veh > _range) or (_missile distance _target < 300) or !(alive _missile))};


	_homeMissile = {
	private ["_velocityX", "_velocityY", "_velocityZ", "_target", "_missile", "_missileSpeed", "_travelTime"];
	
	_velocityX = 0;
	_velocityY = 0;
	_velocityz = 0;

	_missile = _this select 0;
	_target = _this select 1;
	_missileSpeed = _this select 2;

		if (_missile distance _target > (_missileSpeed / 20)) then 
		{
		_travelTime = (_target distance _missile) / _missileSpeed;
		_relDirHor = [_missile, _target] call BIS_fnc_DirTo;
		_missile setDir _relDirHor;
		_relDirVer = asin ((((getPosASL _missile) select 2) - ((getPosASL _target) select 2)) / (_target distance _missile));
		_relDirVer = (_relDirVer * -1);
				
		[_missile, _relDirVer, 0] call BIS_fnc_setPitchBank;

		_velocityX = (((getPosASL _target) select 0) - ((getPosASL _missile) select 0)) / _travelTime;
		_velocityY = (((getPosASL _target) select 1) - ((getPosASL _missile) select 1)) / _travelTime;
		_velocityZ = (((getPosASL _target) select 2) - ((getPosASL _missile) select 2)) / _travelTime;
		};

	[_velocityX, _velocityY, _velocityZ]
	};

_isfront = true;

while {((alive _missile) && (_isfront))} do 
{

_pos1 = position _missile;
_dirV = vectorDir _missile;
_pos2 = position _target;







	if (!(isnull _target) && (_isfront) && (alive _missile)) then 
	{
	_velocityForCheck = [_missile,_target,600] call _homeMissile;
	if ({(typeName _x) == (typeName 0)} count _velocityForCheck == 3) then {_missile setVelocity _velocityForCheck;};
	};

if (_range == 15) then {
_isfront = if ((_pos1 select 0)*(_dirV select 0)+(_pos1 select 1)*(_dirV select 1)+0 < (_pos2 select 0)*(_dirV select 0)+(_pos2 select 1)*(_dirV select 1)) then [{true},{false}];
};



sleep .05;
};


sleep 5;



deletevehicle _missile;

