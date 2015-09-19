#define IDListGroup	1020

 class RscMoneyLabel : RscActiveText
    {
        idc = 1037;
		style = ST_LEFT;
        x = 0.02;
        y = 0.10;
        w = 0.25;
        h = 0.10;
        sizeEx = 0.025; 
        text = "";
        
    };

class RscSupplyLabel : RscActiveText
    {
        idc = 1038;
		style = ST_LEFT;
        x = 0.02;
        y = 0.20;
        w = 0.25;
        h = 0.10;
        sizeEx = 0.025;
        text = "";
        
    };
    class RscFPSLabel : RscActiveText
    {
        idc = 666;
		style = ST_LEFT;
        x = 0.02;
        y = 0.30;
         w = 0.25;
        h = 0.10;
        sizeEx = 0.025;
        text = "";
        
    };


//class RscStatList : RscListBox
//    {
//        idc = 500;
//        x = "(SafeZoneW + SafeZoneX) - (0.27)";
//        y = "SafeZoneY + 0.55";
//         w = 0.25;
//        h = 0.25;
//        sizeEx = 0.025;
//        colorText[] = {0.02, 0.2, 0.7, 0.6};
//        rowHeight = 0.025;
//        };

//class RscStatBackground : RscText
//    {
//        colorBackground[] = {0,0,0,0};
//        color[] = {0,0,0,0};
//        text = ;
//        x = "(SafeZoneW + SafeZoneX) - (0.27)";
//        y = "SafeZoneY + 0.55";
//         w = 0.25;
//        h = 0.25;
//    };


class RscQueueList : RscListBox
    {
        idc = 600;
        x = 0.0;
        y = 0.0;
        w = 0.0;
        h = 0.0;
        colorBackground[] = {0,0,0,0};
        color[] = {0,0,0,0};
        sizeEx = 0.3;
        rowHeight = 0.0;
   };

class RscLabelBarracksQueue : RscActiveText
    {
        idc = 1030;
        x = 0.02;
        y = 0.60;
		sizeEx = 0.025;
        colorText[] = {0, 1, 0, 1};
        text = "Empty";

    };

class RscButtonBarracksQueue : RscButton
    {
        idc = 1031;
        x = 0.15;
        y = 0.60;
		 w = 0.07;
		h = 0.05;
		colorDisabled[] = {0,0,0,0.3};
        colorBackground[] = { 0, 0, 0, 0 };
	    colorText[] = { 1, 0, 0, 1 };
		color[] = {1,1,1,0.8};
	    colorActive[] = { 1, 0.2, 0.2, 1 };
        soundPush[] = {"a3\sounds_f\weapons\closure\sfx1.wss", 0.1, 1};
        soundClick[] = {"a3\sounds_f\weapons\closure\sfx3.wss", 0.2, 1};
        soundEscape[] = {"a3\sounds_f\weapons\closure\sfx11.wss", 0.2, 1};
        soundEnter[] = {"a3\sounds_f\weapons\closure\sfx4.wss",0.20,1};
	    action = "hint ""Good choice!""";
        sizeEx = 0.020;
        text = "Cancel";
        // action = "[""Sld""] exec ""rts-build-cancel.sqs""";

    };

class RscLabelLightQueue : RscActiveText
    {
        idc = 1032;
        x = 0.02;
        y = 0.65;
		sizeEx = 0.025;
        colorText[] = {0, 1, 1, 1};
        text = "Empty";
    };

class RscButtonLightQueue : RscButton
    {
        idc = 1033;
        x = 0.15;
        y = 0.65;
		w = 0.07;
		h = 0.05;
		colorDisabled[] = {0,0,0,0.3};
        colorBackground[] = { 0, 0, 0, 0 };
	    colorText[] = { 1, 0, 0, 1 };
		color[] = {1,1,1,0.8};
	    colorActive[] = { 1, 0.2, 0.2, 1 };
        soundPush[] = {"a3\sounds_f\weapons\closure\sfx1.wss", 0.1, 1};
        soundClick[] = {"a3\sounds_f\weapons\closure\sfx3.wss", 0.2, 1};
        soundEscape[] = {"a3\sounds_f\weapons\closure\sfx11.wss", 0.2, 1};
        soundEnter[] = {"a3\sounds_f\weapons\closure\sfx4.wss",0.20,1};
	    action = "hint ""Good choice!""";
        sizeEx = 0.020;
        text = "Cancel";
        // action = "[""Vcl""] exec ""rts-build-cancel.sqs""";
    };

class RscLabelHeavyQueue : RscActiveText
    {
        idc = 1034;
        x = 0.02;
        y = 0.70;
		sizeEx = 0.025;
        colorText[] = {0, 1, 1, 1};
        text = "Empty";
    };

class RscButtonHeavyQueue : RscButton
    {
        idc = 1035;
        x = 0.15;
        y = 0.70;
		w = 0.07;
		h = 0.05;
 		colorDisabled[] = {0,0,0,0.3};
        colorBackground[] = { 0, 0, 0, 0 };
	    colorText[] = { 1, 0, 0, 1 };
		color[] = {1,1,1,0.8};
	    colorActive[] = { 1, 0.2, 0.2, 1 };
        soundPush[] = {"a3\sounds_f\weapons\closure\sfx1.wss", 0.1, 1};
        soundClick[] = {"a3\sounds_f\weapons\closure\sfx3.wss", 0.2, 1};
        soundEscape[] = {"a3\sounds_f\weapons\closure\sfx11.wss", 0.2, 1};
        soundEnter[] = {"a3\sounds_f\weapons\closure\sfx4.wss",0.20,1};
	    action = "hint ""Good choice!""";
        sizeEx = 0.020;
        text = "Cancel";
        // action = "[""Vcl""] exec ""rts-build-cancel.sqs""";
    };

class RscLabelAirQueue : RscActiveText
    {
        idc = 1036;
        x = 0.02;
        y = 0.55;
		sizeEx = 0.025;
        colorText[] = {0, 1, 1, 1};
        text = "Empty";

    };

class RscButtonAirQueue : RscButton
    {
        idc = 1039;
        x = 0.15;
        y = 0.55;
		w = 0.07;
		h = 0.05;
		colorDisabled[] = {0,0,0,0.3};
        colorBackground[] = { 0, 0, 0, 0 };
	    colorText[] = { 1, 0, 0, 1 };
		color[] = {1,1,1,0.8};
	    colorActive[] = { 1, 0.2, 0.2, 1 };
        soundPush[] = {"a3\sounds_f\weapons\closure\sfx1.wss", 0.1, 1};
        soundClick[] = {"a3\sounds_f\weapons\closure\sfx3.wss", 0.2, 1};
        soundEscape[] = {"a3\sounds_f\weapons\closure\sfx11.wss", 0.2, 1};
        soundEnter[] = {"a3\sounds_f\weapons\closure\sfx4.wss",0.20,1};
	    action = "hint ""Good choice!""";
        sizeEx = 0.020;
        text = "Cancel";
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
        text = "";
        x = 0.22;
        y = 0.0;
        w = 0.58;
        h = 0.50;
		font = FontS;
		sizeEx = 0.35;
        colorText[] = {1,1,1,1};
		
    };

    class RESEARCH_LIST : RscListBox
    {
        idc = -1;//400;
        rowHeight = 0.035;
        x = 0.22;
        y = 0.1;
        w = 0.58;
        h = 0.50;
		sizeEx = 0.047;
		
    };
    class RESEARCH_TITLE : RscSmallTitleBlack
    {
        idc = -1;
        x = 0.22;
        y = 0.1;
        w = 0.30;
        h = 0.03;
		font = FontTITLE;
        text = "RESEARCH STATS";
    };

        class RscListMain : RscListBox
    {
        idc = -1;
        rowHeight = 0.035;
        x = 0.22;
        y = 0.1;
        w = 0.58;
        h = 0.50;
		sizeEx = 0.040;

    };
	    class RscListMain2 : RscListBox
    {
        idc = -1;
        rowHeight = 0.035;
        x = 0.22;
        y = 0.1;
        w = 0.58;
        h = 0.50;
		sizeEx = 0.047;

    };
//Dialog for Mission Control  IDs 1000-1050
class DlgStatus
{
    idd = -1;
    movingEnable = true;
    controlsBackground[] =
    {
        CENTER_FRAME_TITLE
        , TOP_RIGHT_TITLE		
        , RIGHT_FRAME_PICTURE
        , RIGHT_FRAME_TEXT2
        , TOP_left_TITLE
		
    };

        class CENTER_FRAME_TITLE : RscText
        {
        idc = 1050;
            style = ST_FRAME;
            x = 0.22;
            y = 0.0;
            w = 0.58;
            h = 0.99;
            font = FontTITLE;
            colorText[] = {1, 0, 0, 1};
            colorBackground[] = {0,0,0,0};
            sizeEx = 0.050;
            text = " RTS V Mission Status";
    };

   class TOP_RIGHT_TITLE : RscText
    {
            idc = -1;
            style = ST_FRAME;
            x = 0.8;
            y = 0.0;
            w = 0.2;
            h = 0.99;
            text = "WarGames";
            font = FontTITLE;
            colorText[] = {1,0.5,0,1};
            colorBackground[] = {0,0,0,0};
            sizeEx = 0.030;
    };

    class RIGHT_FRAME_PICTURE : RscPicture
    {
            idc = 50;
            x = 0.80;
            y = 0.12;
            w = 0.2;
            h = 0.15;
            colorText[] = {};
            text = "pictures\rtspatch1.paa";
			
			
    };

    class RIGHT_FRAME_TEXT2 : RscText
    {
        idc = 52;
        colorBackground[] = {1,0.5,0,1};
        text = "UNIT CONTROL";
        x = 0.80;
        y = 0.35;
        w = 0.2;
        h = 0.1;
		font = FontTITLE;
        style = ST_CENTER;
        sizeEx = 0.03;
    };

    class TOP_left_TITLE : RscText
    {
            idc = -1;
            style = ST_FRAME;
            x = 0.02;
            y = 0.0;
            w = 0.2;
            h = 0.99;
            text = "INFOMATION";
            font = FontTITLE;
            colorText[] = {1,0.5,0,1};
            colorBackground[] = {0,0,0,0};
            sizeEx = 0.030;
    };

                //class List_Background : RscListBackGround {};

                class Group_Background : RscText
                    {
                   idc = 2026;
                    text = "";
                    x = 0.78;
                    y = 0.400;
                    w = 0.400;
                    h = 0.200;
					
            };

              //class Stats_Background : RscStatBackGround {};

    class controls
        {

        class List_Assets : RscListMain2 //RESEARCH_LIST
        {
            idc = 1000;
            onButtonClick = "[1000] exec ""rts-build-menu.sqs""";
        };

        class Button_Help : RscButton
        {
            idc = -1;
           x = 0.02;
           y = 0.91;
            text = "HELP MENU";
            action = "[] exec ""rts-z-helpmenu.sqs""";
        };

        class Button_Select : RscButton
        {
           idc = 1005;
           x = 0.80;
           y = 0.60;
           sizeEx = 0.030;
           text = "View Units";
           action = "[1000] exec ""rts-build-menu.sqs""";
        };

        class SOLDIERS_TITLE : RscSmallTitleBlack
    {
        idc = -1;
        x = 0.24;
        y = 0.610;
        w = 0.40;
        h = 0.05;
		font = FontTITLE;
        text = "SOLDIERS IN YOUR GROUP";
    };

        class SOLDIERS_LIST : RscListBox
        {
        idc = IDListGroup;
		type = CT_LISTBOX;
        x = 0.22;
        y = 0.660;
        w = 0.58;
        h = 0.200;
        sizeEx = 0.03;
        rowHeight = 0.03;

    };
    class Button_Viewdistance : RscButton
        {
        idc = 1010;
        x = 0.80;
        y = 0.510;
        sizeEx = 0.020;
        text = "ViewDistance";
        action = "[1015] call Zen_RTS_SetViewDistance""";
        };

        class List_Viewdistance : RscCombo
        {
        idc = 1015;
        type = CT_COMBO;
        x= "(SafeZoneW) - (0.71)";
        y = 0.510;
        w = 0.08;
        h = 0.04;
        wholeHeight = 0.3;
        sizeEx = 0.030;
        };

        class Button_FlyinHeight : RscButton
        {
            idc = -1;
            x = 0.80;
            y = 0.560;
            sizeEx = 0.020;
            text = "Set AI Flight Height";
            action = "[1020,1040,1] exec ""rts-units-orders.sqs""";
        };

        class List_Heights : RscCombo
        {
            idc = 1040;
            type = CT_COMBO;
            x= "(SafeZoneW) - (0.71)";
            y = 0.560;
            w = 0.08;
            h = 0.04;
            wholeHeight = 0.3;
            sizeEx = 0.030;
            onMouseButtonDblClick= "[1020,1040,1] exec ""rts-units-orders.sqs""";

    };

        class Button_refresh : RscButton
        {
            idc = 1003;
            x = 0.80;
            y = 0.610;
            sizeEx = 0.030;
            text = "Customize Squads";
            action = "[] exec ""rts-squads-Menu.sqs""";
        };

        class BUTTON_PUSH : RscButton
         {
            idc = -1;
            x = 0.80;
            y = 0.660;
            sizeEx = 0.030;
            colorText[] = {0, 1, 1, 1};
            text = "PUSH";
            action = "closeDialog 0; call RTS_FNC_PUSH";
        };
        class BUTTON_UPRIGHT : RscButton {
            idc = -1;
            x = 0.80;
            y = 0.710;
            sizeEx = 0.030;
            colorText[] = {0, 1, 1, 1};
            text = "free button";
           // action = "closeDialog 0; call RTS_FNC_flipACTIONS";
        };
         class Button_repair : RscButton {
            idc = 1007;
            x = 0.80;
            y = 0.760;
            sizeEx = 0.030;
            colorText[] = {0, 1, 0, 1};
            text = "repair";
            action = [];
        };
        class Button_Release : RscButton {
            idc = 1025;
            x = 0.80;
            y = 0.810;
            sizeEx = 0.030;
            colorText[] = {0, 1, 0, 1};
            text = "Disband Unit";
            action = "[1020] exec ""rts-unit-release.sqs""";
        };
        class BUTTON_CANCEL : RscButton
        {
        idc = -1;
        x = 0.8;
        y = 0.910;
        text = "EXIT MENU";
        action = "closeDialog 0";
        };
        class Label_Money : RscMoneyLabel {};
        class Label_Supply : RscSupplyLabel {};
        class Label_FPS : RscFPSLabel {};
        //class List_Stats : RscStatList {};
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
        movingEnable = 1;
    controlsBackground[] =
    {
        CENTER_FRAME_TITLE
        , TOP_RIGHT_TITLE
        , RIGHT_FRAME_PICTURE
		, TOP_left_TITLE

    };

    class CENTER_FRAME_TITLE : RscText
    {
            idc = 1050;
            style = ST_FRAME;
            x = 0.22;
            y = 0.0;
            w = 0.58;
            h = 0.1;
            font = FontTITLE;
            colorText[] = {1, 0, 0, 1};
            colorBackground[] = {0,0,0,0};
            sizeEx = 0.050;
            text = " COMMAND & CONTROL ";
    };

    class TOP_RIGHT_TITLE : RscText
    {
            idc = -1;
            style = ST_FRAME;
            x = 0.8;
            y = 0.0;
            w = 0.2;
            h = 0.99;
            font = FontTITLE;
            colorText[] = {1,0.5,0,1};
            colorBackground[] = {0,0,0,0};
            sizeEx = 0.030;
            text = "R T S - V";
    };

    class RIGHT_FRAME_PICTURE : RscPicture
    {
        idc = 50;
        colorText[] = {};
        text = "";
        x = 0.8;
        y = 0.135;
        w = 0.2;
        h = 0.13;
    };
	class TOP_left_TITLE : RscText
    {
            idc = -1;
            style = ST_FRAME;
            x = 0.02;
            y = 0.0;
            w = 0.2;
            h = 0.99;
            text = "INFOMATION";
            font = FontTITLE;
            colorText[] = {1,0.5,0,1};
            colorBackground[] = {0,0,0,0};
            sizeEx = 0.030;
	};		
	class TOP_left_TITLE2 : RscText
	{
	        idc = -1;
            style = ST_FRAME;
            colorText[] = {1, 0, 0, 1};
            x = 0.02;
            y = 0.0;
            w = 0.2;
            h = 0.1;
	
    };

            //class List_Background : RscListBackGround {};

            class Group_Background : RscText
                {
                    idc = 2026;
                    text = ;
                        x = 0.78;
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

            //class Stats_Background : RscStatBackGround {};

        class controls
            {
            class List_CrewCount : RscCombo {
                idc = 2045;
                type = CT_COMBO;
                x= "(SafeZoneW) - (0.71)";
                y = 0.410;
                w = 0.08;
                h = 0.04;
                wholeHeight = 0.3;
                sizeEx = 0.030;
            };

            class List_Vehicles : RscListMain
                {
                    idc = 2000;
                    onButtonClick = "uiNamespace setVariable ['2000', _this select 0] execVM ""rts-build-unit.sqf""";
                };
            class Button_Back : RscButton
                {
                    idc = 2001;
                    x = 0.8;
                    y = 0.15;
                    text = "<<Back to Main Menu";
                    action = "[Player,Player,0] exec ""rts-alpha-menu.sqs""";
                };

            class Button_Build : RscButton
                {
                    idc = 2005;
                    x = 0.8;
                    y = 0.2;
                    text = "";
                    action = "[2000,0,False,False] execVM ""rts-build-unit.sqf""";
                };


            class Button_Manned_You : RscButton
                {
                    idc = 2015;
                    x = 0.8;
                    y = 0.25;
                    text = "";
                        //[ListID,ListID2,Manned,Squad]
                    action = "[2000,0,True,False] execVM ""rts-build-unit.sqf""";
                };

            class Button_Custom_Squad : RscButton
                {
                    idc = 2016;
                    x = 0.8;
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
                    font = PuristaMedium;

        };

            class Button_Manned_Squad : RscButton
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
                    font = PuristaMedium;
        };

            class Button_Exit : RscButton
                {
                    idc = -1;
                    x = 0.80;
                    y = 0.92;
					colorText[] = {1, 0, 0, 1};
                    text = "EXIT MENU";
                    action = "closeDialog 0";
                };

            class Label_Money : RscMoneyLabel {};
            class Label_Supply : RscSupplyLabel {};
            class Label_FPS : RscFPSLabel {};
            //class List_Stats : RscStatList {};

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
                        font = PuristaMedium;
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
                        font = PuristaMedium;
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
                        font = PuristaMedium;
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
                        font = PuristaMedium;
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
                        font = PuristaMedium;
                        colorText[] = {1, 1, 1, 1};
                        sizeEx = 0.03;
                        text = "0";
                    };

                class LIST_LOCATION : RscListBox
                    {
                        idc = 1312;
                        x = 0.78;
                        y = 0.55;
                        w = 0.2;
                        h = 0.3;
                        font = PuristaMedium;
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
                        font = PuristaMedium;
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
      //  class Stats_Background : RscStatBackGround {};
            };

        class controls
            {
            //class List_Stats : RscStatList {};
            class Label_Money : RscMoneyLabel {};
            class Label_Supply : RscSupplyLabel {};
            class Labe_FPS : RscFPSLabel {};
            };

    };

class DlgConfirm {
    idd = -1;
    movingEnable = true;
    controlsBackground[] = {
        CONFIRM_BACKGROUND, 
        CONFIRM_FRAME
    };

    class CONFIRM_BACKGROUND : RscText {
        idc = -1;
        style = ST_CENTER;
        x = 0.325;
        y = 0.375;
        w = 0.40;
        h = 0.25;
        font = tahomaB;
        colorText[] = {0, 0, 0, 1};
        colorBackground[] = {.25, .25, .25, .75};
        sizeEx = "0.050 /  (getResolution select 4.5)";
        text = "";
    };

    class CONFIRM_FRAME : RscText {
        idc = -1;
        style = ST_FRAME;
        colorText[] = {1, 0, 0, 1};
        text = "";
        sizeEx = 0.040;
        x = 0.335;
        y = 0.385;
        w = 0.38;
        h = 0.23;
    };

    controls[] = {
        BUTTON_YES, 
        BUTTON_NO, 
        CONFIRM_TEXT
    };

    class BUTTON_YES : RscButton {
        idc = 1305;
        x = 0.39;
        y = 0.55;
        w = 0.1;
        h = 0.05;
        sizeEx = "0.030 /  (getResolution select 4.5)";
        colorText[] = {1, 1, 1, 1};
        text = "Confirm";
        action = "RTS3_Yes = TRUE";
    };

    class BUTTON_NO : RscButton {
        idc = 1315;
        x = 0.56;
        y = 0.55;
        w = 0.1;
        h = 0.05;
        sizeEx = "0.030 /  (getResolution select 4.5)";
        colorText[] = {1, 1, 1, 1};
        text = "Cancel";
        action = "RTS3_No = TRUE";
    };

    class CONFIRM_TEXT : RscText {
        idc = 1300;
        style = ST_CENTER;
        colorBackground[] = {0, 0, 0, 0};
        colorText[] = {1, 0.5, 0, 1};
        text = "Confirm";
        sizeEx = 0.022;
        x = 0.35;
        y = 0.44;
        w = 0.31;
        h = 0.05;
    };
};
