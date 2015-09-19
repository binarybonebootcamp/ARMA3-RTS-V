//Dialog for Help Menu
class DlgHelpMenu
	{
		idd = -1;
		movingEnable = true;
		class controlsBackground
			{
				class Frame_Title : RscText
					{
							idc = 3000;
							style = "0x40";
							x = 0.22;
							y = 0.05;
							w = 0.58;
							h = 0.05;
							font = FontMAIN;
							colorText[] = {1, 0, 0, 1};
					   		colorBackground[] =  {0,0,0,0.72};
							sizeEx = 0.06;
							text = "Information Menu ";
					};


				class Frame_Background : RscText
				 	{
				   		colorText[] = {1, 0, 0, 1};
					    colorBackground[] =  {0,0,0,0.72};
						text = ;
						x = 0.22;
						y = 0.1;
						w = 0.58;
						h = 0.99;
					};



				class List_HelpBackground : RscText
					{
						colorText[] = {1, 0, 0, 1};
					   	colorBackground[] = {0.5, 0.5, 0.5, 0.6};
						text = ;
						x = 0.0;
						y = 0.15;
						w = 0.2;
						h = 0.35;
					};

			};//end controlsBackground

		class controls
			{
				class Text_Help : RscStructuredText
					{
						idc = 3005;
						type = CT_STRUCTURED_TEXT;
						Style = ST_MULTI;
						x = 0.23;
						y = 0.12;
						w = 0.56;
						h = 0.85;
						font = FontHTML;
						sizeEx = 0.02;
						colorText[] = {1, 0, 0, 1};
					    colorBackground[] = {0.5, 0.5, 0.5, 0.6};
					};
				class List_Help : RscListMain
					{
						idc = 3010;
						x = 0.0;
						y = 0.15;
						w = 0.2;
						h = 0.35;
				        sizeEx = 0.02;
				        font = FontS;
				        spaceWidth = 0;
	                    spacing = 0.1;
				        rowHeight = 0.02;
						colorText[] = {1, 0, 0, 1};
					   	colorBackground[] =  {0,0,0,0.72};
						colorSelect[] = {1.0, 1.0, 1.0, 1};
						colorSelectBackground[] = {0.0, 0.0, 0.0, 1};
					};

				class Button_Exit : RscButton2
					{
						idc = -1;
						x = 0.8;
						y = 0.9;
						w = 0.2;
						h = 0.06;
						colorText[] = {1, 1, 1, 1};
						text = "EXIT MENU";
					        font = FontMAIN;
					        sizeEx = 0.025;
						action = "closeDialog 0";
					};



		};//end Controls

	};//end DlgHelpMenu
