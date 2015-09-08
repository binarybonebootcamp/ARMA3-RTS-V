
if (isDedicated) exitwith {};

private ["_player","_mylift","_string","_string1","_string1tmp"];


_player = _this select 0;
_mylift = _this select 1;
_string = "";
_act = "";
_deadstring = "";

if (!isnil {(_player getVariable "lift")}) then {_act = "lift";_string = "Your Lift is a ";_deadstring = "Your Lift Cant Make It"}else{_act = "MyAmmo";_string = "Your AmmoDrop is a ";_deadstring = "Your AmmoDrop Cant Make It"};
_string = _string + (gettext (configFile >> "CfgVehicles" >> typeof _mylift >> "displayName"));
_string = _string + "\n Distance -- ";
_string = _string + str(floor(_mylift distance _player)); 
hint _string;

_string1tmp = "<t color='#283B9B'>DISTANCE</t><br/><t color='#CE2065' size='1.3'>";		


	while {(_mylift == (_player getVariable _act))} do
	{
	_string1 = _string1tmp + str(floor(_mylift distance _player));
	(ZKs_Build select 0) displayCtrl 19812 ctrlSetStructuredText parseText _string1;
	sleep 1;
	};

sleep 1;

if (!(canMove _mylift) or ((_mylift emptypositions "Driver") == 1) or !(alive _mylift)) then {hint _deadstring;_mylift = objnull};
_player setVariable ["liftaction",nil, false];
(ZKs_Build select 0) displayCtrl 19812 ctrlSetText "";