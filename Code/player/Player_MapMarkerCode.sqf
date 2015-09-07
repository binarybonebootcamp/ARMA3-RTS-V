
if (isDedicated) exitwith {};

private ["_player","_marker","_veh","_mypos","_My_HQ"];




_player = _this select 0;

waituntil {(vehicle _player != _player)};

sleep 2;

_veh = vehicle _player;
_My_HQ = (_player getvariable "UINT_MY_HQ");//_My_HQ = (_veh getvariable "UINT_MY_HQ");
_My_HQ = (_player call Global_HQ);
_mypos = position _veh;

	_marker = str(random 1000);
	_marker = createMarkerLocal [_marker, _mypos];
	_marker setMarkerShapeLocal "ICON";
	_marker setMarkerTypeLocal "mil_destroy";
	_marker setMarkerTextLocal "  My WayPoint"; 
	_marker setmarkercolorLocal "colororange";

		while {(vehicle _player != _player)} do 
		{

		_strmypos = str(_mypos);


			waituntil {(if (!isnil {(_veh getVariable "hunt")}) then {(_strmypos != (str(_veh getvariable "hunt")))}else{(isnil {(_veh getVariable "hunt")})} or !(_player in crew _veh))};

			_mypos = if (!isnil {(_veh getVariable "hunt")}) then {(_veh getvariable "hunt")}else{(position _My_HQ)};
			_marker setMarkerposLocal _mypos;

			if (isnil {(_veh getVariable "hunt")}) then 
			{
			waituntil {((!isnil {(_veh getVariable "hunt")}) or !(_player in crew _veh))};
			};
	
		sleep 5;
		};

deleteMarker _marker;


