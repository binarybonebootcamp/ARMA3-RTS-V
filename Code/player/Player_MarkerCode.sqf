if (isDedicated) exitwith {};


private ["_player","_x","_side","_startbase"];

_player = _this select 0;
_side = _this select 1;
sleep 5;
while {alive _player} do
{
sleep .5;
waituntil {((server_object getvariable "MysideMarkers") && ((visibleMap) or (!isnil {_player getVariable "minimap"}) or !(alive _player)))};


if !(alive _player) exitwith {};



sleep 2;


_startbase = [];
if (_side == West) then {_startbase = (server_object getVariable "Weststart")};
if (_side == East) then {_startbase = (server_object getVariable "Eaststart")};
if (_side == resistance) then {_startbase = (server_object getVariable "guerstart")};


{if ((_side == West) && (civilian != _x getvariable "Myside")) then {str(_x) setmarkercolorLocal "colorblue";str(_x) setMarkerAlphaLocal 1;}else{str(_x) setMarkerAlphaLocal 0}} foreach (server_object getVariable "Weststart");
{if ((_side == East) && (civilian != _x getvariable "Myside")) then {str(_x) setmarkercolorLocal "colorred";str(_x) setMarkerAlphaLocal 1;}else{str(_x) setMarkerAlphaLocal 0}} foreach (server_object getVariable "Eaststart");
{if ((_side == resistance) && (civilian != _x getvariable "Myside")) then {str(_x) setmarkercolorLocal "colorgreen";str(_x) setMarkerAlphaLocal 1;}else{str(_x) setMarkerAlphaLocal 0}} foreach (server_object getVariable "guerstart");
server_object setVariable ["MysideMarkers",false, false];



};



