if !(isserver) exitwith {};

_My_HQ = _this select 0;
_My_Allowed = [];


while {(alive _My_HQ)} do
{
waituntil {((_My_HQ getvariable "Made_Base_Buildings") && (civilian != _My_HQ getvariable "Myside"))};
_My_HQ setvariable ["Made_Base_Buildings",false,false];

_My_Allowed = _My_HQ getvariable "My_Allowed";
_buildings = _My_HQ getvariable "BIS_COIN_buildings";
_buildings = _buildings - [objnull];


_Allowed = "";
_run = 0;
_My_Icons = _My_HQ getvariable "My_Icons";
_array = [];

if ((MedicClass countType _buildings) == 1) then 
{
_array = ["Base",((_My_Icons select 0) select 1),"ZKsBuild\Icons\icon_wf_building_firstaid_ca.paa"];
_My_Icons set [0,_array];
_run = 1;
};




_i = 0;
{if (!((_x select 0) in _My_Allowed) && (((_x select 1) countType _buildings) > 0)) then 
{
_run = 1;
_Allowed = (_x select 0);

			switch (_Allowed) do 
			{
			case "Remotes" : {_array = ["Remotes",(_x select 1),"ZKsBuild\Icons\icon_wf_barriers_ca.paa"]};
			case "Defences" : {_array = ["Defences",(_x select 1),"ZKsBuild\Icons\icon_wf_support_artilery_ca.paa"]};
			case "Soldiers" : {_array = ["Soldiers",(_x select 1),"ZKsBuild\Icons\icon_wf_building_barracks_ca.paa"]};
			case "Cars" : {_array = ["Cars",(_x select 1),"ZKsBuild\Icons\icon_wf_building_lvs_ca.paa"]};
			case "Trucks" : {_array = ["Trucks",(_x select 1),"ZKsBuild\Icons\icon_truck.paa"]};
			case "Tanks" : {_array = ["Tanks",(_x select 1),"ZKsBuild\Icons\icon_wf_building_hvs_ca.paa"]};
			case "Helicopters" : {_array = ["Helicopters",(_x select 1),"ZKsBuild\Icons\icon_wf_building_air_ca.paa"]};
			case "Planes" : {_array = ["Planes",(_x select 1),"ZKsBuild\Icons\icon_wf_building_hangar_ca.paa"]};
			case "Ships" : {_array = ["Ships",(_x select 1),"ZKsBuild\Icons\icon_ship.paa"]};
			case "Remote" : {_array = ["Remote",(_x select 1),"ZKsBuild\Icons\icon_remote.paa"]};
			};





_My_Icons set [_i,_array];

if ((_x select 0) != "Base") then {_My_Allowed = _My_Allowed + [_Allowed]};

};_i = _i + 1;} foreach _My_Icons;






_i = 0;
{if (((_x select 0) in _My_Allowed) && (((_x select 1) countType _buildings) == 0)) then 
{
_Allowed = (_x select 0);
_run = 1;
_array = [(_x select 0),(_x select 1),""];
_My_Icons set [_i,_array];

if ((_x select 0) != "Base") then {_My_Allowed = _My_Allowed - [_Allowed]};

};_i = _i + 1;} foreach _My_Icons;



if (_run == 1) then 
{

_My_HQ setvariable ["menumade",0,true];
_My_HQ setvariable ["My_Icons",_My_Icons,true];
_My_HQ setvariable ["My_Allowed",_My_Allowed,true];
_My_HQ setvariable ["iconmade",true,true];
sleep .2;
if (((MedicClass countType _buildings) == 0) && ((count _My_Allowed) == 1)) then {[_My_HQ] execVM "ZKsBuild\lostbase.sqf";};
};

};
