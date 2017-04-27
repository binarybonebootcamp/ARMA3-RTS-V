// *****************************************************
// ** JBOY_createFire.sqf 
// ** by JohnnyBoy
// **
// ** Creates fire and attaches to object.  Size, duration, and amount of damage from fire are parameter driven.
// **
// ** Attach a man-sized fire to a man:  
// **    dmy=[ _cocktail, [0,0,1], .01, .01, .03 ] execvm "JBOY_MOLO\JBOY_createFire.sqf";
// ** Attach small fire to molotov cocktail:  
// **    dmy=[ _cocktail, [0,0,1], .01, .01, .1 ] execvm "JBOY_MOLO\JBOY_createFire.sqf";
// *****************************************************
//  Parameters:
_attachToObj = _this select 0;   // Object to attach fire to.
_relPos      = _this select 1;   // Position relative to object where fire will attach
_timeout     = _this select 2;   // How many seconds the fire will last.  Zero is forever.
_effectSize  = _this select 3;   // Size of fire
_fireDamage  = _this select 4;   // How much damage per interval is applied to nearby objects. How often this is applied I don't know.

_firelogic = "logic" createVehicleLocal [0,0,0];
_emitter = "#particlesource" createVehicleLocal [0,0,0];
_logic = [_fireLogic,0,objnull,[objnull]] call bis_fnc_param;

 _logic setVariable ["effectEmitter",[ _emitter], true]; // seconds to timeout
// These are the main 3 fire parameters:
_logic setVariable ["Timeout",    _timeout, true];
_logic setVariable ["EffectSize", _effectSize, true];
_logic setVariable ["FireDamage", _fireDamage, true];

_logic setVariable ["ColorRed",0.5, true];
_logic setVariable ["ColorGreen",0.5, true];
_logic setVariable ["ColorBlue",0.5, true];
_logic setVariable ["ParticleLifeTime",1.1, true];
_logic setVariable ["ParticleDensity",20, true];
_logic setVariable ["ParticleSize",1, true];
_logic setVariable ["ParticleSpeed",1, true];
_logic setVariable ["ParticleOrientation",4, true];

// Create the fire using BIS module function
//nul=[_firelogic,"BIS_fnc_moduleEffectsFire",1] call BIS_fnc_moduleEffectsEmitterCreator;
nul = _logic call JBOY_moduleEffectsFire;
// nul = _logic call BIS_fnc_moduleEffectsFire;
_emitter attachTo [_fireLogic,[0,0,0]];
_fireLogic attachTo [_attachToObj, _relPos];
if (_attachToObj isKindOf "Man") then
{
  [_fireLogic,_emitter] spawn {
	_fireLogic = _this select 0;
	_emitter = _this select 1;
	_man =  attachedTo _fireLogic;
	[_man, _emitter] spawn { 
	             _man = _this select 0;
	             _emitter = _this select 1;
				 nul=[_man,_emitter] call JBOY_scream;
				 };
	while {alive _man} do
   {
		sleep .1;
		//detach _fireLogic;
		if (((eyepos _man) select 2) - (getPosASL _man select 2) > .8) then 
		{ 
			_fireLogic attachTo [_man, [0,0,1]];
		};
		if (((eyepos _man) select 2) - (getPosASL _man select 2) < 1.3) then {_fireLogic attachTo [_man, [0,0,-.1]];};
        
	};
	detach _firelogic;
	_fireLogic attachTo [_man, [0,0,-.1]];
	_emitter attachTo [_fireLogic,[0,0,0]];

  };
};
// If attached object no longer exists, then delete fire objects
waitUntil  { isnull attachedTo _fireLogic };
sleep .5;
deleteVehicle _fireLogic;
deleteVehicle _emitter;
