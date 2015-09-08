
// Disable NPC Talk
player disableConversation true;
[] execVM "qs_icons\QS_icons.sqf";
["InitializePlayer",[player]] call BIS_fnc_dynamicGroups;
[] spawn {
	sleep 10;
	hintSilent 'Press U to open Group Manager';
};

