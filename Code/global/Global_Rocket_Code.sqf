
_veh = _this select 0;


_veh addEventHandler ["Fired", {

_veh = (_this select 0);
_veh_type = typeof _veh;
_missile_type = _this select 4;
_pos = position _veh;
_target = (assignedTarget _veh);
_missile = _this select 6; 


server_object setVariable ["playerorders", [_veh_type,_missile_type,_pos,_target,Global_Rocket_1_Code], true];

if (isserver) then {[_veh,_missile,_target] spawn Global_Guided_Code;};
}];




[_veh] spawn {
_veh = _this select 0;


while {alive _veh} do
{

waituntil {(!(isnull (_veh findNearestEnemy getpos _veh)) or (!isnull (assignedTarget _veh)))};

_mytarget = if (!isnull (assignedTarget _veh)) then {(assignedTarget _veh)}else{_veh findNearestEnemy getpos _veh};

_veh dowatch _mytarget;
_veh dotarget _mytarget;

waituntil {((_mytarget != (assignedTarget _veh)) or !(alive _mytarget))};
_mytarget = objnull;
_veh dowatch _mytarget;
_veh dotarget _mytarget;

sleep 2;

};

};




_firedelay = 0.05;

while {(alive _veh)} do
{
_firetime = (time + _firedelay);

waituntil {((_veh AimedAtTarget [assignedTarget _veh] > .3) && (time > _firetime) && (alive gunner _veh))};

_mytarget = assignedTarget _veh;

if !(alive _mytarget) then {_mytarget = objnull};

_veh fireAtTarget [_mytarget];
_firedelay =  2;

};