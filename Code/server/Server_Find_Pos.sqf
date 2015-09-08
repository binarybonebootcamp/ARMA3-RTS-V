if !(isserver) exitwith {};

private ["_My_HQ_Pos","_mywater","_posland","_radius","_basepos_tmp","_planesgo","_boat","_basepos","_fail"];

_My_HQ_Pos = _this select 0;
_radius = _this select 1;
_mywater = _this select 2;
_planesgo = _this select 3;
_boat = _this select 4;
_itemclass = _this select 5;

_basepos = [];
_fail = 0;
_waterspot = 0;
_basesize = (basearea / 1.3);


	_posland = [(_My_HQ_Pos select 0) + _basesize - (random _basesize *2 ),(_My_HQ_Pos select 1) + _basesize - (random _basesize *2 ),0];
	if ((surfaceIsWater _posland) && (count _mywater < 3)) then {_mywater = _mywater + [_posland];_waterspot = 1};
	//_basepos_tmp = _posland findEmptyPosition [0,_radius,_itemclass];



if ((count _posland > 0) && (_waterspot == 0)) then {

//_posland = _basepos_tmp;

	private ["_posTL", "_posTR", "_posBL", "_posBR"];

	_posTL = [(_posland select 0) - _radius, (_posland select 1) - _radius];
	_posTR = [(_posland select 0) + _radius, (_posland select 1) - _radius];
	_posBL = [(_posland select 0) - _radius, (_posland select 1) + _radius];
	_posBR = [(_posland select 0) + _radius, (_posland select 1) + _radius];

	private  ["_posTL_AT_Sea","_posTR_AT_Sea","_posBL_AT_Sea","_posBR_AT_Sea","_posCTR_AT_Sea"];

	_posCTR_AT_Sea = getTerrainHeightASL _posland;
	_posTL_AT_Sea = getTerrainHeightASL _posTL;
	_posTR_AT_Sea = getTerrainHeightASL _posTR;
	_posBL_AT_Sea = getTerrainHeightASL _posBL;
	_posBR_AT_Sea = getTerrainHeightASL _posBR;



	private ["_array","_zup","_zdn","_heightDiff","_grad"];

	_zup = 0;
	_zdn = 0;
	_heightDiff = 0;
	_array = [_posTL_AT_Sea,_posTR_AT_Sea,_posBL_AT_Sea,_posBR_AT_Sea,_posCTR_AT_Sea];
	_zup = 0;
	{if (_x > _zup) then {_zup = _x}} foreach _array;
	_zdn = _zup;
	{if (_x < _zdn) then {_zdn = _x}} foreach _array;

	_heightDiff = abs (_zup - _zdn);
	_grad = _heightDiff / _radius;

if ((_planesgo == 1) && (runwaybuild == 1)) then {
{if (surfaceType _x in Runway_Turf) exitwith {_fail = 1}} foreach [_posTL,_posTR,_posBL,_posBR,_posland];
};


	if (count (nearestObjects [_posland, [nobuildhere], nobuilddis]) > 0) exitwith {_fail = 1};
	{if ((isOnRoad _x) or (count (_x nearRoads 20) > 0)) exitwith {_fail = 1}} foreach [_posTL,_posTR,_posBL,_posBR,_posland];
	if ((_grad < 0.6) && (_boat == 0) && (surfaceIsWater _posland)) exitwith {_fail = 1};
	if (!(surfaceIsWater _posland) && (_boat == 1)) exitwith {_fail = 1};
	if ((_grad > 0.4) && (_boat == 0)) exitwith {_fail = 1};
	if (count (nearestObjects [_posland, [], _radius]) > 0) exitwith {_fail = 1};
}else{_fail = 1};


		if (_fail == 0) then 
		{
		_basepos = _posland;
		//_basepos_tmp = [];
		};



[_basepos,_mywater]