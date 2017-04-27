/*
	File: JBOY_moduleEffectsFire.sqf
	Original BIS Author: Borivoj Hlava (Thanks Borivoj!)
	Modified by:         Johnnyboy

	Description:
	Module function. Creates fire on position of module (called usually by BIS_fnc_moduleEffectsEmitterCreator).
	Modified so that the fire casts ambient light at night. And added smoke to it.
	Messed with all the lightpoint parameters until I got the casting light looking good.

	Parameter(s):
	_this select 0 (Object) - Module logic.
	
	Returned value:
	None.
*/

_logic = _this;
_emitter = (_logic getVariable "effectEmitter") select 0;
_pos = getPos _logic;
_emitter setPos _pos;

//--- variables set by user
_colorRed         = _logic getVariable ["ColorRed","0.5"];
_colorGreen       = _logic getVariable ["ColorGreen","0.5"];
_colorBlue        = _logic getVariable ["ColorBlue","0.5"];
_timeout          = _logic getVariable ["Timeout",0];
_particleLifeTime = _logic getVariable ["ParticleLifeTime",2];
_particleDensity  = _logic getVariable ["ParticleDensity",25];
_particleSize     = _logic getVariable ["ParticleSize",1];
_particleSpeed    = _logic getVariable ["ParticleSpeed",1];
_effectSize       = _logic getVariable ["EffectSize",1];                // .005 is molotov bottle size, .01 is man-sized
_orientation      = _logic getVariable ["ParticleOrientation",5.4];
_damage           = _logic getVariable ["FireDamage",1];
//_effectSize = .001;

if (_colorRed > 1) then {_colorRed = 1};
if (_colorRed < 0) then {_colorRed = 0};
if (_colorGreen > 1) then {_colorGreen = 1};
if (_colorGreen < 0) then {_colorGreen = 0};
if (_colorBlue > 1) then {_colorBlue = 1};
if (_colorBlue < 0) then {_colorBlue = 0};

//--- particle effect creation
_emitter setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal",16,10,32],"","billboard",1,_particleLifeTime,[0,0,0],[0,0,0.4*_particleSpeed],0,0.0565,0.05,0.03,[0.9*_particleSize,0],
						[[1*_colorRed,1*_colorGreen,1*_colorBlue,-0],[1*_colorRed,1*_colorGreen,1*_colorBlue,-1],[1*_colorRed,1*_colorGreen,1*_colorBlue,-1],[1*_colorRed,1*_colorGreen,1*_colorBlue,-1],[1*_colorRed,1*_colorGreen,1*_colorBlue,-1],[1*_colorRed,1*_colorGreen,1*_colorBlue,0]],
						[1], 0.01, 0.02, "", "", "",_orientation,false,-1,[[3,3,3,0]]];
_emitter setParticleRandom [_particleLifeTime/4, [0.15*_effectSize,0.15*_effectSize,0], [0.2,0.2,0],  0.4,               0,  [0,0,0,0], 0, 0, 0.2];
						//[lifeTime,             position,                              moveVelocity, rotationVelocity, size, color, randomDirectionPeriod, randomDirectionIntensity] 
if (_damage > 0) then {_emitter setParticleFire [0.6*_damage, 0.25*_damage, 0.1];};
_emitter setDropInterval (1/_particleDensity);

//--- light
_lightSize = (_particleSize + _effectSize)/2;

_light = createVehicle ["#lightpoint", (getPos _emitter), [], 0, "CAN_COLLIDE"];
//_light setLightUseFlare true;
_light lightAttachObject [_emitter, [0,0,0]];
_light setLightColor [1,0.65,0.4];
_light setLightDayLight false;
_light setLightFlareMaxDistance 200; 
if (_effectSize >= .09) then
{
	_light setLightFlareSize 3;  // flareSize 50 makes awesome heavenly light ball
	_light setLightAttenuation [2,0,0,4.31918e-005]; 
	_light setLightIntensity 30; 
} else
{
	_light setLightFlareSize 2;  // flareSize 50 makes awesome heavenly light ball
	_light setLightAttenuation [1,0,0,0]; 
	_light setLightIntensity 20; 
};
_logic setVariable ["effectLight",[_light],true];


//--- variables set by user
_colorRed = 0.5;
_colorGreen = 0.5;
_colorBlue = 0.5;
_colorAlpha = 0.5;
_particleLifeTime = 20; //50, 5 is HUGE amount of smoke, so lower is more
_particleDensity = 2; //10
_particleSize = 2; //1
_particleSpeed = 2; //1
_particleLifting = 1;
_windEffect = 1;
_effectSize = .5; //1
_expansion = 1;
_emitterSmoke = "#particlesource" createVehicleLocal [0,0,0];

//--- particle effect creation
_emitterSmoke setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02",8,0,40,1],"","billboard",1,_particleLifeTime,[0,0,0],[0,0,2*_particleSpeed],0,0.05,0.04*_particleLifting,0.05*_windEffect,[1 *_particleSize + 1,1.8 * _particleSize + 15],
		[[0.7*_colorRed,0.7*_colorGreen,0.7*_colorBlue,0.7*_colorAlpha],[0.7*_colorRed,0.7*_colorGreen,0.7*_colorBlue,0.6*_colorAlpha],[0.7*_colorRed,0.7*_colorGreen,0.7*_colorBlue,0.45*_colorAlpha],
		[0.84*_colorRed,0.84*_colorGreen,0.84*_colorBlue,0.28*_colorAlpha],[0.84*_colorRed,0.84*_colorGreen,0.84*_colorBlue,0.16*_colorAlpha],[0.84*_colorRed,0.84*_colorGreen,0.84*_colorBlue,0.09*_colorAlpha],
		[0.84*_colorRed,0.84*_colorGreen,0.84*_colorBlue,0.06*_colorAlpha],[1*_colorRed,1*_colorGreen,1*_colorBlue,0.02*_colorAlpha],[1*_colorRed,1*_colorGreen,1*_colorBlue,0*_colorAlpha]],
		[1,0.55,0.35], 0.1, 0.08*_expansion, "", "", ""];
_emitterSmoke setParticleRandom [_particleLifeTime/2, [0.5*_effectSize,0.5*_effectSize,0.2*_effectSize], [0.3,0.3,0.5], 1, 0, [0,0,0,0.06], 0, 0];
						//[lifeTime, position, moveVelocity, rotationVelocity, size, color, randomDirectionPeriod, randomDirectionIntensity] 
_emitterSmoke setDropInterval (1/_particleDensity);
_emitterSmoke attachTo [_emitter, [0,0,0]];



//--- timeout
if (_timeout != 0) then {
	[_logic,_timeout,_emitterSmoke] spawn {
		_logic = _this select 0;
		_timeout = _this select 1;
		_emitterSmoke = _this select 2;
		
		sleep _timeout;
		deleteVehicle ((_logic getVariable "effectEmitter") select 0);
		deleteVehicle ((_logic getVariable "effectLight") select 0);
		deleteVehicle _emitterSmoke;
	};
};