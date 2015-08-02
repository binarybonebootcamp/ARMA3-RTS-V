#define IDListGroup	1020

class Base_Button : RscButton
	{
		h = 0.040;
		font = FontMAIN;
		 colorText[] = {1, 1, 1, 1};
		sizeEx = 0.025;
		w = 0.20;
	};

class RscMoneyLabel : RscText
	{
		idc = 1037;
		x = 0.00;
		y = 0.10;
		w = 0.25;
		h = 0.07;
		sizeEx = 0.035;
		font = "EtelkaNarrowMediumPro";
		text = "";
		colorText[] = {1,1,1,1};
	};

class RscSupplyLabel : RscText
	{
		idc = 1038;
		x = 0.00;
		y = 0.15;
		w = 0.25;
		h = 0.07;
		sizeEx = 0.035;
		font = "EtelkaNarrowMediumPro";
		text = "";
		colorText[] = {1,1,1,1};
	};
	class RscFPSLabel : RscText
	{
		idc = 666;
		x = 0.00;
		y = 0.20;
		w = 0.25;
		h = 0.07;
		sizeEx = 0.035;
		font = "EtelkaNarrowMediumPro";
		text = "";
		colorText[] = {1,1,1,1};
	};


class RscStatList : RscListBox
	{
		idc = 500;
		x = "(SafeZoneW + SafeZoneX) - (0.27)";
		y = "SafeZoneY + 0.55";
		w = 0.25;
		h = 0.25;
	    sizeEx = 0.025;
	    colorText[] = {0.02, 0.2, 0.7, 0.6};
	    rowHeight = 0.025;
			class ScrollBar
			{
				type = CT_XSLIDER;
				color[] = {0,0,0,0};
				colorActive[] = {0,0,0,0};
				colorText[] = {0.02, 0.2, 0.7, 0.6};
                arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
			};
			class ListScrollBar: ScrollBar
			{
				height = 0.021;
				width = 0.021;
				autoScrollEnabled = 0;
				color[] = {0,0,0,0};
			};
		};

class RscStatBackground : RscText
	{
		colorBackground[] = {0,0,0,0};
		color[] = {0,0,0,0};
		text = ;
		x = "(SafeZoneW + SafeZoneX) - (0.27)";
		y = "SafeZoneY + 0.55";
		w = 0.25;
		h = 0.25;
	};


class RscQueueList : RscListBox
	{
		idc = 600;
		x = 0.0;
		y = 0.0;
		w = 0.0;
		h = 0.0;
		colorBackground[] = {0,0,0,0};
		color[] = {0,0,0,0};
	    sizeEx = 0.0;
	    rowHeight = 0.0;
   };

class RscLabelBarracksQueue : RscText
	{
		idc = 1030;
		x = 0.0;
		y = 0.60;
		w = 0.30;
		h = 0.05;
		colorText[] = {1,0,0,1};
        sizeEx = 0.025;
		text = "Empty";

	};

class RscButtonBarracksQueue : RscButtonSmall
	{
		idc = 1031;
		x = 0.16;
		y = 0.60;
		w = 0.06;
		h = 0.05;
		 colorText[] = {1, 1, 1, 1};
        sizeEx = 0.020;
		text = "Cancel";
		action = "";
		// action = "[""Sld""] exec ""rts-build-cancel.sqs""";

	};

class RscLabelLightQueue : RscText
	{
		idc = 1032;
		x = 0.0;
		y = 0.65;
		w = 0.30;
		h = 0.05;
		colorText[] = {1,0,0,1};
		sizeEx = 0.025;
		text = "Empty";
	};

class RscButtonLightQueue : RscButtonSmall
	{
		idc = 1033;
		x = 0.16;
		y = 0.65;
		w = 0.06;
		h = 0.05;
		 colorText[] = {1, 1, 1, 1};
		sizeEx = 0.020;
		text = "Cancel";
		action = "";
		// action = "[""Vcl""] exec ""rts-build-cancel.sqs""";
	};

class RscLabelHeavyQueue : RscText
	{
		idc = 1034;
		x = 0.0;
		y = 0.70;
		w = 0.30;
		h = 0.05;
		colorText[] = {1, 0, 0, 1};
		sizeEx = 0.025;
		text = "Empty";
	};

class RscButtonHeavyQueue : RscButtonSmall
	{
		idc = 1035;
		x = 0.16;
		y = 0.70;
		w = 0.06;
		h = 0.05;
		 colorText[] = {1, 1, 1, 1};
		sizeEx = 0.020;
		text = "Cancel";
		action = "";
		// action = "[""Vcl""] exec ""rts-build-cancel.sqs""";
	};

class RscLabelAirQueue : RscText
	{
		idc = 1036;
		x = 0.0;
		y = 0.55;
		w = 0.30;
		h = 0.05;
		colorText[] = {1,0,0,1};
		sizeEx = 0.025;
		text = "Empty";

	};

class RscButtonAirQueue : RscButtonSmall
	{
		idc = 1039;
		x = 0.16;
		y = 0.55;
		w = 0.06;
		h = 0.05;
		 colorText[] = {1, 1, 1, 1};
        sizeEx = 0.020;
		text = "Cancel";
		action = "";
		// action = "[""Air""] exec ""rts-build-cancel.sqs""";

	};
//class RscLabelNavalQueue : RscText
	//{
	//	idc = 1041;
	//	colorBackground[] = {0.2, 0.2, 0.2, .7};
	//	x = safeZoneX + 0.440;
	//	y = safeZoneY + 0.855 + .110;
	//	w = 0.30;
	//	h = 0.05;
	//	sizeEx = 0.020;
	//	text = "Empty";
	//};

//class RscButtonNavalQueue : RscButton
	//{
		//idc = 1042;
		//x = safeZoneX + 0.750;
	//	y = safeZoneY + 0.855 + .110;
	//	w = 0.05;
	//	h = 0.05;
	//	sizeEx = 0.020;
		//text = "Cancel";
	//	action = "[""Vcl""] exec ""rts-build-cancel.sqs""";
	//};
class RscListBackground : RscText
 	{
		text = ;
		x = 0.22;
		y = 0.1;
		w = 0.55;
		h = 0.88;
		colorText[] = {1,1,1,1};
	};

class RscListMain : RscListBox
	{
		idc = -1;
		x = 0.225;
		y = 0.12;
		w = 0.54;
		h = 0.85;

	};

//Dialog for Mission Control  IDs 1000-1050
class DlgStatus
	{
		idd = -1;
		movingEnable = 1;
		class controlsBackground
			{
				class Frame_Title : RscText
					{
						idc =1050;
						style = "0x40";
						x = 0.22;
						y = 0.05;
						w = 0.55;
						h = 0.05;
						font = FontMAIN;
						colorText[] = {1, 0, 0, 1};
						sizeEx = 0.045;
						text = "RTS - A S S E T S";
						moving = 1;
					};

				class List_Background : RscListBackGround {};

				class Group_Background : RscText
				 	{
						idc = 2026;
						text = "";
						x = 0.771;
						y = 0.400;
						w = 0.400;
						h = 0.400;
					};

                   class Stats_Background : RscStatBackGround {};

			};//end controlsBackground

	class controls
		{

		class List_Assets : RscListMain
		{
			idc = 1000;
			onButtonClick = "[1000] exec ""rts-build-menu.sqs""";
		};

		class Button_Help : base_button
		{
			idc = -1;
			x = 0.78;
			y = 0.05;
			colorText[] = {1, 1, 1, 1};
			//colorBackground[] = {0,0,0,0.72};
			text = "HELP MENU";
			action = "[] exec ""rts-z-helpmenu.sqs""";
		};

		class Button_CustomSquads : base_button
		{
			idc = 1003;
			x = 0.78;
			y = 0.11;
			text = "Customize Squads";
			action = "[] exec ""rts-squads-Menu.sqs""";
		};



		class Button_Select : base_button
		{
			idc = 1005;
			x = 0.78;
			y = 0.30;
			text = "View Units";
			action = "[1000] exec ""rts-build-menu.sqs""";
		};


		class Button_Exit : base_button
		{
			idc = -1;
			x = 0.78;
			y = 0.92;
			text = "EXIT MENU";
			action = "closeDialog 0";
		};

		class Button_Viewdistance : base_button
		{
			idc = 1010;
			x = 0.78;
			y = 0.17;
			text = "SET VIEWDISTANCE";
			action = "[1015,2] exec ""rts-options-change.sqs""";
		};

		class List_Viewdistance : RscCombo
		{
			idc = 1015;
		    wholeHeight = 0.3;
			sizeEx = 0.02;
			x = 0.99;
			y = 0.17;
			w = 0.08;
			h = 0.04;
			class ScrollBar
			{
				color[] = {0,0,0,0};
				colorText[] = {1, 0, 0, 1};
                arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
			};
			class ComboScrollBar: ScrollBar
			{
				color[] = {0,0,0,0};
			};
        };
		class Button_FlyinHeight : base_button
		{
			idc = -1;
			x = 0.78;
			y = 0.36;
			text = "Set AI Flight Height";
			action = "[1020,1040,1] exec ""rts-units-orders.sqs""";
		};

		class List_Heights : RscCombo
		{
			idc = 1040;
		        wholeHeight = 0.3;
			sizeEx = 0.02;
			x = 0.99;
			y = 0.36;
			w = 0.08;
			h = 0.04;
			class ScrollBar
			{
				color[] ={0,0,0,0};
				colorText[] = {1, 0, 0, 1};
				thumb = "#(argb,8,8,3)color(1,1,1,1)";
				arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
				arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
				border = "#(argb,8,8,3)color(1,1,1,1)";
			};
			class ComboScrollBar: ScrollBar
			{
				color[] = {0,0,0,0};

			};
        };

	 	class List_Group : RscListBox
		{
			idc = IDListGroup;
			x = 0.78;//0.771;
			y = 0.400;
			w = 0.400;
			h = 0.400;
		    sizeEx = 0.030;
			onButtonClick = "[1020] exec ""rts-unit-release.sqs""";
			class ScrollBar
			{
				type = CT_XSLIDER;
				thumb = "#(argb,8,8,3)color(0,0,0,9)";
				arrowEmpty = "#(argb,8,8,3)color(0,0,0,9)";
				arrowFull = "#(argb,8,8,3)color(0.631,0.153,0.153,1)";
				border = "#(argb,8,8,3)color(0.361,0.349,0.353,1)";
			};
			class ListScrollBar: ScrollBar
			{
				height = 0.021;
				width = 0.021;
				autoScrollEnabled = 0;
			};
		};

		class Button_Release : RscButtonSmall
		{
			idc = -1;
			x = 0.78;
			y = 0.865;
			w = 0.20;
			h = 0.04;
			font = FontMAIN;
			text = "Disband Selected Unit";
		    sizeEx = 0.020;
			action = "[1020] exec ""rts-unit-release.sqs""";
		};
		class Label_Money : RscMoneyLabel {};
		class Label_Supply : RscSupplyLabel {};
		class Label_FPS : RscFPSLabel {};
	 	class List_Stats : RscStatList {};
	 	class List_Queue : RscQueueList {};

	 	class LabelBarracksQueue : RscLabelBarracksQueue {};
	 	class ButtonBarracksQueue : RscButtonBarracksQueue {};
	 	class LabelLightQueue : RscLabelLightQueue {};
	 	class ButtonLightQueue : RscButtonLightQueue {};
	 	class LabelHeavyQueue : RscLabelHeavyQueue {};
	 	class ButtonHeavyQueue : RscButtonHeavyQueue {};
	 	class LabelAirQueue : RscLabelAirQueue {};
	 	class ButtonAirQueue : RscButtonAirQueue {};
		//class LabelNavalQueue : RscLabelNavalQueue {};
	 	//class ButtonNavalQueue : RscButtonNavalQueue {};

		};//end controls

	};//end dlgStatus
//Dialog for Vehicle Building.  IDs 2000-2050
class DlgBuild
	{
		idd = 2002;
		movingEnable = true;

		class controlsBackground
			{
			class Center_Title : RscText
				{
					idc = 1050;
					style = "0x40";
					x = 0.22;
					y = 0.05;
					w = 0.55;
					h = 0.05;
					font = FontMAIN;
					colorText[] = {1, 0, 0, 1};
					sizeEx = 0.045;
					text = "RTS - CommandMenu";
				};

			class List_Background : RscListBackGround {};

			class Group_Background : RscText
			 	{
					idc = 2026;
					text = ;
						x = 0.78; //0.771;
						y = 0.400;
						w = 0.400;
						h = 0.400;
				};

			class Background_CustomSquads : RscText
			 	{
					text = ;
					idc = 2031;
					x = 0.81;
					y = 0.35;
					w = 0.18;
					h = 0.15;
				};

			class Stats_Background : RscStatBackGround {};

			};//end controlsBackground


		class controls
			{
			class List_Vehicles : RscListMain
				{
					idc = 2000;
					onButtonClick = "uiNamespace setVariable ['2000', _this select 0] execVM ""rts-build-unit.sqf""";
				};
			class Button_Back : Base_Button
				{
					idc = 2001;
					x = 0.8;
					y = 0.15;
					text = "<<Back to Main Menu";
					action = "[Player,Player,0] exec ""rts-alpha-menu.sqs""";
				};

			class Button_Build : Base_Button
				{
					idc = 2005;
					x = 0.8;
					y = 0.2;
					text = "";
					action = "[2000,0,False,False] execVM ""rts-build-unit.sqf""";
				};


			class Button_Manned_You : Base_Button
				{
					idc = 2015;
					x = 0.8;
					y = 0.25;
					text = "";
						//[ListID,ListID2,Manned,Squad]
					action = "[2000,0,True,False] execVM ""rts-build-unit.sqf""";
				};

			class Button_Custom_Squad : Base_Button
				{
					idc = 2016;
					x = 0.80;
					y = 0.30;
					text = "";
					action = "[2000,2030,False,False] execVM ""rts-build-unit.sqf""";
				};

			class List_CustomSquads : RscListBox
				{
					idc = 2030;
					x = 0.81;
					y = 0.35;
					w = 0.18;
					h = 0.15;
					font = FontMAIN;
			class ScrollBar
			{
				type = CT_XSLIDER;
				thumb = "#(argb,8,8,3)color(0,0,0,9)";
				arrowEmpty = "#(argb,8,8,3)color(0,0,0,9)";
				arrowFull = "#(argb,8,8,3)color(0.631,0.153,0.153,1)";
				border = "#(argb,8,8,3)color(0.361,0.349,0.353,1)";
			};
			class ListScrollBar: ScrollBar
			{
				height = 0.021;
				width = 0.021;
				autoScrollEnabled = 0;
			};
		};

			class Button_Manned_Squad : Base_Button
				{
					idc = 2020;
					x = 0.8;
					y = 0.51;
					text = "";
					action = "[2000,2025,True,True] execVM ""rts-build-unit.sqf""";
				};

		 	class List_Squads : RscListBox
				{
					idc = 2025;
					x = 0.8;
					y = 0.56;
					w = 0.20;
					h = 0.35;
				    sizeEx = 0.02;
					font = FontMAIN;
			class ScrollBar
			{
				type = CT_XSLIDER;
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
			};
			class ListScrollBar: ScrollBar
			{
				height = 0.021;
				width = 0.021;
				autoScrollEnabled = 0;
			};
		};

			class Button_Exit : Base_Button
				{
					idc = -1;
					x = 0.8;
					y = 0.92;
					font = FontMAIN;
					colorText[] = {1, 1, 1, 1};
					text = "EXIT MENU";
				    sizeEx = 0.025;
					action = "closeDialog 0";
				};

			class Label_Money : RscMoneyLabel {};
			class Label_Supply : RscSupplyLabel {};
			class Label_FPS : RscFPSLabel {};
		 	class List_Stats : RscStatList {};

		 	class LabelBarracksQueue : RscLabelBarracksQueue {};
		 	class ButtonBarracksQueue : RscButtonBarracksQueue {};
		 	class LabelLightQueue : RscLabelLightQueue {};
	 		class ButtonLightQueue : RscButtonLightQueue {};
		 	class LabelHeavyQueue : RscLabelHeavyQueue {};
		 	class ButtonHeavyQueue : RscButtonHeavyQueue {};
	 		class LabelAirQueue : RscLabelAirQueue {};
		 	class ButtonAirQueue : RscButtonAirQueue {};
		 	//class LabelNavalQueue : RscLabelAirQueue {};
		 	//class ButtonNavalQueue : RscButtonAirQueue {};

		};//End Controls

};//end dlgBuild

//Dialog for Respawn IDs 1310-1312
class DlgRespawn
	{
		idd = -1;
		movingEnable = true;

		class controlsBackground
			{
				class List_Background : RscText
					{
						idc = -1;
						style = ST_CENTER;
						x = 0.78;
						y = 0.55;
						w = 0.2;
						h = 0.3;
						font = FontMAIN;
						colorText[] = {1, 1, 1, 1};
						sizeEx = 0.03;
						text = "";
					};
			};//end controlsBackground



		class controls
			{
				class LABEL_RESPAWN : RscText
					{
						idc = -1;
						style = ST_CENTER;
						x = 0.25;
						y = 0.05;
						w = 0.5;
						h = 0.07;
						font = FontMAIN;
						colorText[] = {1, 1, 1, 1};
						sizeEx = 0.05;
						text = "Choose Deployment Location";
					};

				class LABEL_LOCATION : RscText
					{
						idc = 1310;
						style = ST_CENTER;
						x = 0.25;
						y = 0.9;
						w = 0.5;
						h = 0.07;
						font = FontMAIN;
						colorText[] = {0.02, 0.2, 0.7, 0.6};
						sizeEx = 0.05;
						text = "";
					};

				class LABEL_TIMERTEXT : RscText
					{
						idc = -1;
						style = ST_LEFT;
						x = 0.78;
						y = 0.5;
						w = 0.15;
						h = 0.05;
						font = FontMAIN;
						colorText[] = {1, 1, 1, 1};
						sizeEx = 0.03;
						text = "Deploy in:";
					};

				class LABEL_TIMERNUMBER : RscText
					{
						idc = 1311;
						style = ST_RIGHT;
						x = 0.93;
						y = 0.5;
						w = 0.05;
						h = 0.05;
						font = FontMAIN;
						colorText[] = {1, 1, 1, 1};
						sizeEx = 0.03;
						text = "";
					};

				class LIST_LOCATION : RscListBox
					{
						idc = 1312;
						x = 0.78;
						y = 0.55;
						w = 0.2;
						h = 0.3;
						font = FontMAIN;
						sizeEx = 0.03;
						colorText[] = {1, 0, 0, 1};
			class ScrollBar
			{
				type = CT_XSLIDER;
				color[] = {0,0,0,0};
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
			};
			class ListScrollBar: ScrollBar
			{
				height = 0.021;
				width = 0.021;
				autoScrollEnabled = 0;
			};
		};

				class BUTTON_RESPAWN : RscButton
					{
						idc = 1313;
						x = 0.83;
						y = 0.9;
						w = 0.1;
						h = 0.05;
					    sizeEx = 0.03;
					    font = FontMAIN;
						colorText[] = {1, 1, 1, 1};
						text = "Deploy";
						action = "rts_respawn = TRUE";
					};
			};//end Controls
	};//end DlgRespawn
//Main HUD
class DlgHUD
	{

		idd = -1;
		movingEnable = 0;
		enableSimulation = 1;
	  	fadein=2;
		duration=58;
		class controlsBackground
			{
		class Stats_Background : RscStatBackGround {};
			};

		class controls
			{
			class List_Stats : RscStatList {};
			class Label_Money : RscMoneyLabel {};
			class Label_Supply : RscSupplyLabel {};
			class Labe_FPS : RscFPSLabel {};
			};

    };