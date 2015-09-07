

if !(isserver) exitwith {};

_place = {
_man = _this select 0;

_marker = str(time);
_marker = createMarker [_marker, position _man];
_marker setMarkerShape "ICON";
_marker setMarkerType "mil_dot";
_marker setmarkercolor "colororange";

	while {alive _man} do
	{
	sleep 1;
	_marker setmarkerpos position _man;
	};

deletemarker _marker;

};

_show_marker = 0;

_leader = _this select 0;
_buildspot = _this select 1; 
_myunit = typeof _leader;
_leader allowFleeing 0;
_posmywp = [];
if (_show_marker == 1) then {[_leader] spawn _place};
_rooms = server_object getvariable str(_buildspot);


while {(alive _leader)} do
{

_posmywp = (_rooms select (floor(random (count _rooms))));
_leader setDestination [_posmywp, "DoNotPlan", false];
_leader domove _posmywp;
_leader setSpeedMode "LIMITED";
_leader setBehaviour "CARELESS";
_leader forceWalk true;


_timeout = (time + 900);
sleep 10;

waituntil {((unitready _leader) or !(alive _leader) or (time > _timeout))};

sleep 2;

	if !(alive _leader) then 
	{
	_suicide = 0;
	sleep 50;
	deletevehicle _leader;
	_myunit createUnit [[0,0,0], c1g,"_leader = this", 0.0, ""];
	_leader allowFleeing 0;
	if (_show_marker == 1) then {[_leader] spawn _place};
	sleep 5;
	};

	if (alive _leader) then 
	{
	
	_rooms = [];

		while {count _rooms < 2} do
		{
		_buildspot = (Town_Spots select (floor(random (count Town_Spots))));
		_rooms = if !(isnil {server_object getvariable str(_buildspot)}) then {server_object getvariable str(_buildspot)} else {[]};
		};

	_posmywpshift = (_rooms select (floor(random (count _rooms))));
	_leader setpos _posmywpshift;
	};
};
