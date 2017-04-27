// ****************************************************************
// JBOY_scream.sqf
// 
// ****************************************************************

_man = _this select 0;
_emitter = _this select 1;

_rand = floor(random 2);
switch ( _rand )  do 
{
   case 0: { _man say "scream"; };
   case 1: { _man say "scream2"; };
   default { _man say "scream"; };
};
_case = floor(random 11);
switch (_case) do
{
  case 0:
  {
	sleep 1 + random 3;
	_man playmove "AmovPercMsprSnonWnonDf_AmovPpneMstpSnonWnonDnon";
	sleep 1;
	_man playmove "AinjPpneMstpSnonWrflDnon_rolltoback";
	sleep 1;
	_man setdamage 1;
  };
  case 1:
  {
     sleep 1+random 3;
	 _man switchmove "GetOutPara";
	 sleep .5;
	 _man setdamage 1;
  };
  case 2:
  {
    sleep 2+ random 4;
	_man switchmove "AmovPercMsprSnonWnonDf_AmovPpneMstpSnonWnonDnon";
	sleep 1;
	 _man switchmove "HaloFreeFall_non_HaloFreeFall_F";
	 sleep .3;
	 _man switchmove "HaloFreeFall_non_HaloFreeFall_F";
	 sleep .5;
	 _man setdamage 1;
  };
  case 3:
  {
	 _man playmove "AmovPercMevaSnonWnonDf";
     sleep .5;
	 _man playmove "AmovPercMevaSnonWnonDf";
     sleep .5;
	 _man playmove "AmovPercMevaSnonWnonDf";
     sleep .5;
	 _man playmove "AmovPercMevaSnonWnonDf";
     sleep .5;
	_man playmove "AmovPercMsprSnonWnonDf_AmovPpneMstpSnonWnonDnon";
	sleep .3;
	 _man setdamage 1;
  };      
  case 4:
  {
     //_man setUnitPos "Middle";
	 sleep 2;
	_man playmove "AmovPercMsprSnonWnonDf_AmovPpneMstpSnonWnonDnon";
	sleep .3;
	 _man switchmove "unconscious";
	 sleep .3;
	 _man switchmove "unconscious";	 
  };
  case 5:
  {
     //_man setUnitPos "Middle";
	 _man playmove "AmovPercMevaSnonWnonDf";
     sleep .3;
	 _man playmove "AmovPercMevaSnonWnonDf";
     sleep .3;
	 _man playmove "AmovPercMevaSnonWnonDf";
	 sleep .3;
	 _man playmove "AmovPercMevaSnonWnonDf";
	 sleep .3;
	 _man playmove "AmovPercMevaSnonWnonDf";
	 sleep .3;
	_man playmove "AmovPercMsprSnonWnonDf_AmovPpneMstpSnonWnonDnon";
	sleep .5;
	 _man setdamage 1;
  };
  case 6:
  {
     //_man setUnitPos "Middle";
	_man playmove "AmovPercMsprSnonWrflDf_AmovPpneMstpSnonWrflDnon";
     sleep 1;
	 _man playmove "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl";
     sleep 1;
	 _man playmove "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl";
	 sleep 1;
	 _man playmove "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr";
	 sleep 1;
	 _man playmove "AmovPpneMstpSrasWprflDnon_AmovPpneMevaSlowWrflDr";
	 detach _emitter;
	 _emitter attachTo [G_OBJ_AWAY,[0,0,0]];
     sleep 1;
	 _man playmove "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl";
  };
  case 7:
  {
    //_man setUnitPos "Middle";
	_man playmove "AmovPercMsprSnonWrflDf_AmovPpneMstpSnonWrflDnon";
     sleep 1;
	 _man playmove "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl";
     sleep 1;
	 _man playmove "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl";
	 sleep 1;
	 _man playmove "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr";
	 sleep 1;
	 _man playmove "AmovPpneMstpSrasWprflDnon_AmovPpneMevaSlowWrflDr";
	 detach _emitter;
	 _emitter attachTo [G_OBJ_AWAY,[0,0,0]];
	 sleep 1;
	 _man playmove "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl";
  };
  case 8:
  {
    sleep 2+ random 4;
	_man switchmove "AmovPercMsprSnonWnonDf_AmovPpneMstpSnonWnonDnon";
	sleep 1;
	 _man switchmove "HaloFreeFall_non_HaloFreeFall_F";
	 sleep .5;
	 _man setdamage 1;
  };
  case 9:
  {
    sleep 2+ random 3;
	 _man setdamage 1;
  };
  case 10:
  {
    sleep 2+ random 2;
	 _man setdamage 1;
  };
};    
