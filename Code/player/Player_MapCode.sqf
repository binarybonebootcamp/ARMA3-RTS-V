	if (isDedicated) exitwith {};

	private ["_player","_marker","_veh","_mypos","_strmypos"];

	_marker = "";
	_strmypos = "";
	_player = _this select 0;

waituntil {(vehicle _player != _player)};
sleep 1;

_veh = vehicle _player;

waituntil {(!isnil {(_veh getVariable "hunt")})};

_veh vehicleChat "On The Way - Planning Route -";
_veh vehicleChat "Click On The Map To Change Our Destination";
sleep 1;

	waituntil {((visibleMap) or !(alive _veh) or !(_player in crew _veh) or (isnil {(_veh getVariable "hunt")}))};

	if (isnil {(_veh getVariable "hunt")}) exitwith {onMapSingleClick "";openMap false;};

	_mypos = _veh getvariable "hunt";
	onMapSingleClick "_pos set [2,0];((vehicle player) setVariable [""hunt"",_pos, true]);";


		while {((alive _veh) && (_player in crew _veh) && (!isnil {(_veh getVariable "hunt")}))} do
		{
		_strmypos = str(_mypos);
	
		waituntil {((_strmypos != (str(_veh getvariable "hunt"))) or !(alive _veh) or !(_player in crew _veh))};



		if (!(alive _veh) or !(_player in crew _veh) or (isnil {(_veh getVariable "hunt")})) exitwith {onMapSingleClick "";openMap false;};

		sleep .1;
		_mypos = _veh getvariable "hunt";
		};


	onMapSingleClick "";
	openMap false;

