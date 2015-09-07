
if (isDedicated) exitwith {};

private ["_name","_variable","_input","_submenu","_expression","_input_count","_input_start","_input_page","_input_end","_array","_item"];



scopename "main";



_name = _this select 0;
_contextsensitive = false;
if (typename _name == "ARRAY") then {_contextsensitive = _name select 1; _name = _name select 0};
_variable = _this select 1;
_input = _this select 2;
_inputNames = _input;
_inputEnable = [];

{_inputEnable = _inputEnable + [1]} foreach _input;
if (typename (_input select 0) == "ARRAY") then {
	_inputNames = _input select 1;
	if (count _input > 2) then {_inputEnable = _input select 2} else {_inputEnable = []; {_inputEnable = _inputEnable + [1]} foreach (_input select 0)};
	_input = _input select 0;
};

_submenu = _this select 3;
_expression = _this select 4;
_params = if (count _this > 5) then {_this select 5} else {""};
_displayShortcuts = if (count _this > 6) then {_this select 6} else {true};
_displayShortcuts = false;

_input_count = count _input;
_input_start = 0;
_input_page = 0;
_input_end = _input_start + 9;

//--- All lists
for "_n" from 0 to (ceil (_input_count / 9)) do {
	_array = [[_name,_contextsensitive]];
	_input_start = _input_page * 11;
	_input_end = _input_start + 10;

	//--- Specific page
	for "_i" from _input_start to _input_end do {
		if (_i >= _input_count) exitwith {
			call compile format ["%1_%2 = _array;",_variable,_input_page];
			breakto "main";
		};
		_item = _input select _i;
		_itemName = _inputNames select _i;
		_itemEnable = str (_inputEnable select _i);
		_itemShortcut = if (_displayShortcuts) then {_i + 2 - _input_start} else {0};
		_array = _array + [[_itemName, [_itemShortcut], format [_submenu,_item], -5, [["expression", format [_expression,_item,_i,_params]]], "1", _itemEnable]];
	};

	//--- Listing options
	if ((_input_end - _input_start) >= 8) then {
		_itemShortcut = if (_displayShortcuts) then {11} else {0};
		_array = _array + [[localize "STR_MORE_MENU", [_itemShortcut], format ["#USER:%1_%2",_variable,_input_page + 1], -5, [["expression", ""]], "1", "1"]];

	};
	//_array = _array + [["", actionKeys "menuback", "", -5, [["expression", ""]], "1", "1"]];

	call compile format ["%1_%2 = _array;",_variable,_input_page];

	_input_page = _input_page + 1;
};

true;


