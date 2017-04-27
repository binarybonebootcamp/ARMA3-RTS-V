/* ---------------------------------------------------------------------------------------------------


_nul = [this, 2, 1] execVM "barrelRespawn.sqf";fixed by Dr.Deathjm
this goes in the init of barrel you place on map in editor.. fully mp.

---------------------------------------------------------------------------------------------------- */

private "_obj";
_obj = _this select 0;
_deadDelay = (_this select 2) * 60;
_dir = getDir _obj;
_pos = getPosWorld _obj;
_objtype = typeOf _obj;

if (isServer) then {
     While {True} Do {
       sleep 1;


        if ((!alive _obj) || (!canMove _obj)) then {
            _dead = true;

            for "_i" from 1 to _deadDelay do {
                 if ({alive _x} count (crew _obj) > 0) exitWith {_dead = false;};
                 sleep 1;
                };

        if (_dead) then {
            deleteVehicle _obj;
            sleep 1;
            _obj = createVehicle [_objtype, _pos, [], 0, "CAN_COLLIDE"];
            _obj setDir _dir;
            _obj setPos [_pos select 0, _pos select 1,0];
            _obj addEventHandler ["killed",{[_this] execVM "JBOY\JBOY_barrel_boom.sqf"; (_this select 1)}]; 
         };

      };

   };

};