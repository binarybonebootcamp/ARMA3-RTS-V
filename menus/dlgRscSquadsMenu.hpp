class RscSquadList : RscListBox
	{
		font = FontMAIN;
		style = "0x90";
		y = 0.12;
		w = 0.28;
		h = 0.85;
		colorText[] = {0,1,0,1};
		colorBackground[] = {0.5, 0.5, 0.5, 0.6};
	    sizeEx = 0.025;
	    rowHeight = 0.03;

			class ScrollBar
			{
				colorText[] = {1,0,0,1};
				color[] = {0.1, 0.1, 0.3, 0.5};
				colorActive[] = {0.18,0.345,0.58,1};
				colorDisabled[] = {1,1,1,0.25};
                arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
			};
	};

class RscSquadTitle : RscText
	{
		font = FontMAIN;
		style = "0x02";
		colorText[] = {1, 0, 0, 1};
		colorBackground[] = {0.231,0.267,0.294,00.7};
		sizeEx = 0.040;
		w = 0.29;
		h = 0.05;
		y = 0.05;

	};

class RscSquadButton : RscButton
	{
		colorText[] = {0,1,0,1};
		x = 0.40;
		w = 0.2;
		h = 0.05;
	    sizeEx = 0.025;

	};

//Dialog for Custom Squads
class DlgSquads
	{
		idd = -1;
		movingEnable = true;
		class controlsBackground
			{
				class Title_Types : RscSquadTitle
					{
						idc = 4000;
						x = 0.095;
						text = "Units to Choose From";
					};

				class Title_Squad : RscSquadTitle
					{
						idc = 4001;
						x = 0.615;
						text = "Custom Squad Units";
					};


				class Background_Types : RscText
				 	{
				   		colorText[] = {0,1,0,1};
					   	colorBackground[] = {0.231,0.267,0.294,00.7};
						text = ;
						x = 0.095;
						y = 0.1;
						w = 0.29;
						h = 0.99;
					};

				class Background_Squad : RscText
				 	{
				   		colorText[] = {0,1,0,1};
					   	colorBackground[] = {0.231,0.267,0.294,00.7};
						text = ;
						x = 0.615;
						y = 0.1;
						w = 0.29;
						h = 0.99;
					};

				class Background_CustomSquads : RscText
				 	{
				   		colorText[] = {0,1,0,1};
					   	colorBackground[] = {0.231,0.267,0.294,00.7};
						text = ;
						x = 0.40;
						y = 0.48;
						w = 0.20;
						h = 0.15;
					};

			};//end controlsBackground

		class controls
			{
				class List_Types : RscSquadList
					{
						idc = 4005;
						x = 0.1;
						// onMouseButtonDblClick = "[1] execVM ""rts-squad-update.sqf""";
					};

				class List_Squad : RscSquadList
					{
						idc = 4010;
						x = 0.62;
						// onMouseButtonDblClick = "[0] execVM ""rts-squad-update.sqf""";
					};

				class List_CustomSquads : RscSquadList
					{
						idc = 4015;
						x = 0.40;
						y = 0.48;
						w = 0.20;
						h = 0.15;
						colorText[] = {0,1,0,1};
					   	colorBackground[] = {0.231,0.267,0.294,00.7};
					};

				class Button_Help : RscSquadButton
					{
						idc = -1;
						y = 0.10;
						colorText[] = {0,1,0,1};
					   	colorBackground[] = {0.231,0.267,0.294,00.7};
						text = "HELP MENU";
						action = "[] exec ""rts-z-helpmenu.sqs""";
					};

				class Button_Stats : RscSquadButton
					{
						idc = 4004;
						y = 0.16;
						colorText[] = {0,1,0,1};
					   	colorBackground[] = {0.231,0.267,0.294,00.7};
						text = "<<Back to Main Menu";
						action = "[Player,Player,0] exec ""rts-alpha-menu.sqs""";
					};


				class Button_Add : RscSquadButton
					{
						idc = 4002;
						y = 0.30;
						colorText[] = {0,1,0,1};
					   	colorBackground[] = {0.231,0.267,0.294,00.7};
						text = "Add to Squad>>";
						action = "[1] execVM ""rts-squad-update.sqf""";
					};

				class Button_Remove : RscSquadButton
					{
						idc = 4003;
						y = 0.36;
						colorText[] = {0,1,0,1};
					   	colorBackground[] = {0.231,0.267,0.294,00.7};
						text = "<<Remove from Squad";
						action = "[0] execVM ""rts-squad-update.sqf""";
					};

				class Button_Clear : RscSquadButton
					{
						idc = 4006;
						y = 0.42;
						colorText[] = {0,1,0,1};
					   	colorBackground[] = {0.231,0.267,0.294,00.7};
						text = "Clear Squad";
						action = "[-1] execVM ""rts-squad-update.sqf""";
					};


				class Button_Exit : RscSquadButton
					{
						idc = 4007;
						y = 0.9;
						colorText[] = {0,1,0,1};
					   	colorBackground[] = {0.231,0.267,0.294,00.7};
						text = "EXIT MENU";
						action = "closeDialog 0";
					};


			};//end controls

	};//end dlgSquads