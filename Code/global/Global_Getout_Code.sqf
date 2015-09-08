
private ["_pos","_myman","_man","_car","_turrets","_emptyturrets"];

sleep 1;

while {1 == 1} do {

waituntil {(!isnil {(server_object GetVariable "mygunnerout")})};
_myman = (server_object GetVariable "mygunnerout");

_man = (_myman select 0);
_car = (_myman select 1);
_pos = (_myman select 2);
_turrets = (_myman select 3);
_emptyturrets = (_myman select 4);

server_object setVariable ["mygunnerout",nil, false];


if (_pos == "gunner") then {


 

	if ((_car emptypositions "Commander") == 1) then 
	{
	_man action ["moveToTurret", _car,(_emptyturrets select 0)];

	}else{

		if (count _emptyturrets == 0) then
		{


			if ((_car emptypositions "Cargo") == 0) then 
			{
			_man = if !(isplayer driver _car) then {driver _car} else {gunner _car};
			_pos = "driver";
			}else{

			_dman = driver _car;
			sleep .1;
				
				if !(isplayer leader _dman) then 
				{
				_dman action ["moveToCargo", _car];
				waituntil {((_car emptypositions "driver") == 1)};
				_man action ["moveToDriver", _car];
				};
			};
		};

	};

};





if (_pos == "driver") then 
{


	moveOut _man;
	_man action ["GETOUT", _car];
	unassignVehicle _man;
	sleep .1;
	if !(isplayer leader _man) then {_man setdamage 1;deletevehicle _man};


};



};


