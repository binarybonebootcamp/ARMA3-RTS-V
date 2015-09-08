
if !(isserver) exitwith {};

private ["_target","_guard","_startbase","_MY_HQ","_who","_type","_pos","_class","_mk1","_marker","_array","_My_Type","_my_enemy","_color","_k","_guard","_whos","_side"];



_callforsupport = {
if !(isServer) exitwith {};
private ["_pos","_reinforcementstmp","_reinforcements","_k","_guard","_x","_reinforcementsnew","_whos","_helper","_startbase","_side","_number","_My_Type"];
_side = _this select 0;
_pos = _this select 1;
_whos = _this select 2;
_My_Type = _this select 3;
_guard = _this select 4;
_who = _this select 5;
_startbase = _this select 6;

_pos set [2,0]; 
_reinforcementstmp = [];
_reinforcements = [];
_reinforcementsnew = [];


{_reinforcements = _reinforcements + (_x getvariable "hunt")} foreach _startbase;


_k = 0;
for "_k" from 0 to ((count _reinforcements) -1) do
{
_helper = if (typeName (_reinforcements select _k) == "OBJECT") then {(_reinforcements select _k)}else{objnull};
_my_marker = str(_helper getVariable "hunt");

	if ((!isnil {_my_marker}) && !(_helper iskindof "AIR")) then {
	_helper = if (getmarkercolor _my_marker != "colorwhite") then {(_reinforcements select _k)}else{objnull}; 
	};

	{if (_helper isKindOf _x) then {_reinforcementsnew = _reinforcementsnew + [_helper]}} foreach _My_Type;






};

_number = HELP_No;
if (count _whos > 1) then {_number = 1};

{if ((count _reinforcementstmp < _number) && (someAmmo _x) && (isnull (assignedTarget _x)) && (_x distance _pos < helpdis) && (_x != _guard)) then {_reinforcementstmp = _reinforcementstmp + [_x]}} foreach _reinforcementsnew;

{_x setVariable ["hunt",_pos, true];_x reveal _who;_x doTarget _who;} foreach _reinforcementstmp; 

//diag_log str(["HELP","   ",_reinforcementstmp]);


};


//-----------------------------------------------------------------------------------------------------------------


while {1 == 1} do
{

waituntil {(!isnil {(server_object getvariable "seen")})};
_target = (server_object getvariable "seen");
server_object setVariable ["seen", nil, false];

_whos = _target select 0;
_MY_HQ = _target select 1;
_side = _target select 2;
_color = "colororange";

_startbase = [];
if (_side == West) then {_startbase = (server_object getVariable "Weststart")};
if (_side == East) then {_startbase = (server_object getVariable "Eaststart")};
if (_side == resistance) then {_startbase = (server_object getVariable "guerstart")};




for "_i" from 0 to (count _whos - 1) do
{
_my_whos = _whos select _i;
_who = _my_whos select 0;
_guard = _my_whos select 1;

_type = typeof _who;
_pos = position _who;





_class = "";
if (_who isKindOf "MAN") then {_class = "Soldier"};
if (_who isKindOf "StaticWeapon") then {_class = "StaticWeapon"};
if (_who isKindOf "Car") then {_class = "Car"};
if (_who isKindOf "Tank") then {_class = "Tank"};
if (_who isKindOf "Helicopter") then {_class = "Helicopter"};
if (_who isKindOf "Plane") then {_class = "Plane"};
if (_who isKindOf "Ship") then {_class = "Ship"};
if (!isnil {(_who getVariable "search")}) then {_class = "Truck"};
if (_who iskindof "TargetSoldierBase") then {_class = "Building"};

_mk1 = if (isnil {((_who getVariable str(_who)) select 3)}) then {} else {((_who getVariable str(_who)) select 3)};

if ((isnil "_mk1") && (((count crew _who) > 0) or (_class == "Building"))) then
{

_marker = str(_who);
_marker = createMarker [_marker, _pos];
_marker setMarkerShape "ICON";
_marker setMarkerType "mil_dot";


_array = [_who,_type,_pos,_marker];
_who setVariable [str(_who), _array, false];
[_who,_marker,_guard] spawn Server_MarkerClean;



_My_Type = [];
if (_who isKindOf "MAN") then {_My_Type = ["Car","Helicopter"]};
if (_who isKindOf "StaticWeapon") then {_My_Type = ["Car","Tank","Helicopter","Plane"]};
if (_who isKindOf "Car") then {_My_Type = ["Car","Helicopter","Plane"]};
if (_who isKindOf "Tank") then {_My_Type = ["Tank","Helicopter","Plane"]};
if (_who isKindOf "Helicopter") then {_My_Type = ["Helicopter","Plane"]};
if (_who isKindOf "Plane") then {_My_Type = ["Helicopter","Plane"]};
if (_who isKindOf "Ship") then {_My_Type = ["Ship","Helicopter","Plane"]};
if (_class == "Building") then {_My_Type = ["Car","Tank","Helicopter","Plane"]};
_marker setMarkerText _class; 

_My_HQ = (_guard call Global_HQ);

[_side,_pos,_whos,_My_Type,_guard,_who,_startbase] spawn _callforsupport;


if (side _who == West) then {_color = "colorblue"};
if (side _who == East) then {_color = "colorred"};
if (side _who == resistance) then {_color = "colorGreen"};

_marker setmarkercolor _color;

	if (_class == "Building") then {

	private ["_HQ_target","_my_HQ_array"];

	_HQ_target = ((nearestObject [position _who, "Building"]) getVariable "homebase"); 

		if !(_HQ_target in (_My_HQ getvariable "enemybasearray")) then
		{
		_my_HQ_array = [];
		_my_HQ_array = (_My_HQ getvariable "enemybasearray");
		_my_HQ_array = _my_HQ_array + [_HQ_target];
		{_x setvariable ["enemybasearray",_my_HQ_array,false]} foreach _startbase;

		if (isnil {(_HQ_target getvariable "spotted")}) then {_HQ_target setVariable ["spotted", _MY_HQ, false]};

		};
	};

}
else
{

	if ((count crew _who) > 0) then 
	{
	_mk1 setMarkerpos _pos;
	_mk1 setMarkerText _class; 
	_array = [_who,_type,_pos,_mk1];
	_who setVariable [str(_who), _array, false];
	};

};

};
};

