// JBOY_barrel_roll.sqf
// nul = [barrelName] execVM "JBOY\JBOY_barrel_roll.sqf";
// Only call this if barrel is already rolling downhill!
if (isServer) then
{
	_barrel = _this select 0;
	waitUntil {sleep 1; (speed _barrel) > 2 };
	// sleep 1;  // sleep to allow it to move, so we can have two positions to calculate direction of roll from.
	_barrel enableSimulation  true;
	_rolling = true;
    while {_rolling} do
	{
		_startPos = getpos _barrel;
		sleep .5;
		_currPos = getpos _barrel;
		// player sidechat str (speed _barrel);
		 // player sidechat str (getdir _barrel);
		 // player sidechat (format ["damage=%1",damage _barrel]);

		_vel = velocity _barrel;
		_dir = [_startPos, _currPos] call BIS_fnc_dirTo;
		_grade = [_currPos, _dir] call BIS_fnc_terrainGradAngle;
		//hint format ["gradient=%1", _grade];
		_speed = 0.01;
		if (_grade < -40) then {_speed = 3;};
		if (_grade < -20 and  _grade >= -40) then {_speed = 1.5;};
		if (_grade < -10) then
		{
			_barrel setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+ (cos _dir*_speed),(_vel select 2)];
		} else {
			_rolling = false;
		};
	};
};