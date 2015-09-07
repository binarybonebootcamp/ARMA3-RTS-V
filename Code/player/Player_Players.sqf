


if (isDedicated) exitwith {};

private ["_player","_side","_color","_mktype","_markers","_marker","_x"];

_player = _this select 0;
_side = side _player;


_color = "colorwhite";

_mktype = "ICON";


if ((format["%1",_player]) in PlayerW) then {_side = West;_color = "colorblue";_mktype = "b_inf"};
if ((format["%1",_player]) in PlayerE) then {_side = East;_color = "colorred";_mktype = "o_inf"};
if ((format["%1",_player]) in PlayerG) then {_side = resistance;_color = "colorGreen";_mktype = "n_inf"};


if (Team_Names == 1) then 
{

[_player,_side] spawn
{
_player = _this select 0;
_side = _this select 1;
	
	sleep 0.1;
	disableserialization;

	21 cutrsc ["rscDynamicText","plain"];

	#define DISPLAY	(uinamespace getvariable "BIS_dynamicText")
	#define CONTROL	(DISPLAY displayctrl 9999)

	_w = 1;
	_h = .1;

	CONTROL ctrlsetposition [
		0,
		0,
		_w,
		_h
	];
	CONTROL ctrlsetfade 1;
	CONTROL ctrlcommit 0;

	while {(true)} do 
	{

		waituntil {((isplayer cursortarget) && (side cursortarget == _side) && (!visiblemap))}; 
		
			
			_target = cursortarget;
			_pos = getposatl _target;
			_pos set [2,2];
			_pos2D = worldtoscreen _pos;
			_text = format ["<t size='0.4' align='center' color='#D7DF01'>%1</t>", name _target];


			if ((count _pos2D > 0) && (name _target != "Error: No unit")) then 
			{

			sleep 0.1;

				CONTROL ctrlsetposition 
				[
					(_pos2D select 0)-(_w / 2),
					(_pos2D select 1),
					_w,
					_h
				];
				CONTROL ctrlsetstructuredtext parsetext _text;
				CONTROL ctrlsetfade 0;
				CONTROL ctrlcommit 0.01;
			} 
			else 
			{
				CONTROL ctrlsetfade 1;
				CONTROL ctrlcommit 0.1;
			};
	
 
		waituntil {(!isplayer cursortarget && !visiblemap)};
		
			CONTROL ctrlsetfade 1;
			CONTROL ctrlcommit 0.1;
		
		sleep 0.1;
	

	};

	21 cuttext ["","plain"];
};

};


_pickupcode =
{
_player = _this select 0;

_marker = str(random 1000);
_marker = createMarkerLocal [_marker, position _player];
_marker setMarkerShapeLocal "ICON";
_marker setMarkerTypeLocal "mil_dot";
_marker setmarkercolorLocal "ColorPink";

_marker setMarkerTextLocal "Your Lift";

	while {((!isnil {(_player getVariable "lift")}) && (visibleMap))} do
	{
	_marker setMarkerposLocal position (_player getVariable "lift");
	sleep 1;
	};

_marker setMarkerTextLocal "Your AmmoDrop";

	while {((!isnil {(_player getVariable "MyAmmo")}) && (visibleMap))} do
	{
	_marker setMarkerposLocal position (_player getVariable "MyAmmo");
	sleep 1;
	};

deleteMarker _marker;
};


_truckcode = 
{
_player = _this select 0;
_side = _this select 1;
_marker = "";

_thetrucks = if (!isnil {server_object getVariable "truckorders"}) then {server_object getVariable "truckorders"}else{[]} ;

	{if ((_side == side _x) && (alive _x)) then 
	{
	_marker = str(random 1000);
	_marker = createMarkerLocal [_marker, position _x];
	_marker setMarkerShapeLocal "ICON";
	_marker setMarkerTypeLocal "mil_dot";
	_marker setmarkercolorLocal "ColorBrown";

	[_x,_marker,_player] spawn {
		_truck = _this select 0;
		_marker = _this select 1;
		_player = _this select 2; 

			while {((alive _truck) && (alive _player) && (visibleMap))} do
			{
			sleep 1;
			if (count (nearestObjects [_truck,[HQ_Container], 5]) > 0) then {_marker setMarkerTextLocal "  HQ in Transit"}else{_marker setMarkerTextLocal " Truck"};
			_marker setMarkerposLocal position _truck;
			};

			deleteMarker _marker;
		};	

	
	}} foreach _thetrucks;

};


while {true} do
{


waituntil {((visibleMap) or (!isnil {_player getVariable "minimap"}))};
[_player,_side] spawn _truckcode;
[_player] spawn _pickupcode;

_markers = [];

{if (side _x == _side) then
	{
	_marker = name _x;
	_marker = createMarkerLocal [_marker, (position _x)];
	_marker setMarkerShapeLocal "ICON";
	_marker setMarkerSizeLocal [.9, .9];
	_marker setMarkerTypeLocal _mktype;
	_marker setMarkerTextLocal name _x; 
	_marker setmarkercolorLocal _color;
	_markers = _markers + [[_marker,_x]]; 
	}} foreach playableUnits;


while {((visibleMap) or (!isnil {_player getVariable "minimap"}))} do
{
	{(_x select 0) setMarkerposLocal (position  (_x select 1));
	if ("HEALTHY" !=  lifeState (_x select 1)) then {(_x select 0) setmarkercolorLocal "ColorOrange"}else{(_x select 0) setmarkercolorLocal _color};
	} foreach _markers;

hint

sleep 1;
};

{deleteMarkerLocal (_x select 0)} foreach _markers;
sleep 1;
};








