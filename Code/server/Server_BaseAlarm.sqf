private ["_MY_HQ","_marker","_side","_i","_EnemyBase"];

if !(isserver) exitwith {};

_MY_HQ = _this select 0;
sleep 10;



waituntil {(!isnil {(_MY_HQ getvariable "spotted")})};
_side = (_My_HQ getvariable "Myside");



_i = 0;

for "_i" from 0 to 4 do
{

[_MY_HQ,_side,"Incoming"] execFSM "FSM\Sounds\Sounds_Say.fsm";

sleep 2.5;
};


		_marker = str(_MY_HQ) + " FoundBase";
		_marker = createMarker [_marker, position _My_HQ];
		_marker setmarkerpos (position _My_HQ);
		_marker setMarkerShape "ICON";
		_marker setMarkerType "mil_objective";
		_marker setMarkerSize [1.5,1.5];
		_marker setMarkerText "Base";


if (_side == West) then {_marker setmarkercolor "colorblue";};
if (_side == East) then {_marker setmarkercolor "colorred";};
if (_side == resistance) then {_marker setmarkercolor "colorgreen";};

_EnemyBase = (server_object getvariable "EnemyBases");
_EnemyBase = _EnemyBase + [_MY_HQ];
server_object setvariable ["EnemyBases",_EnemyBase,true];



sleep 5;

waituntil {(isnil {(_MY_HQ getvariable "spotted")})};

_EnemyBase = (server_object getvariable "EnemyBases");
_EnemyBase = _EnemyBase - [_MY_HQ];
server_object setvariable ["EnemyBases",_EnemyBase,true];

deletemarker _marker;



