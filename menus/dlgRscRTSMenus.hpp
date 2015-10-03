#define IDListGroup	1020

 class RTS_MoneyLabel : RTS_ActiveText
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

class RTS_SupplyLabel : RTS_ActiveText
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
    class RTS_FPSLabel : RTS_ActiveText
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


//class RTS_StatList : RTS_ListBox
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

//class RTS_StatBackground : RTS_Text
//    {
//        colorBackground[] = {0,0,0,0};
//        color[] = {0,0,0,0};
//        text = ;
//        x = "(SafeZoneW + SafeZoneX) - (0.27)";
//        y = "SafeZoneY + 0.55";
//         w = 0.25;
//        h = 0.25;
//    };


class RTS_QueueList : RTS_ListBox
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

class RTS_LabelBarracksQueue : RTS_ActiveText
    {
        idc = 1030;
        x = 0.02;
        y = 0.60;
		sizeEx = 0.025;
        colorText[] = {0, 1, 0, 1};
        text = "Empty";

    };

class RTS_ButtonBarracksQueue : RTS_Button
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

class RTS_LabelLightQueue : RTS_ActiveText
    {
        idc = 1032;
        x = 0.02;
        y = 0.65;
		sizeEx = 0.025;
        colorText[] = {0, 1, 1, 1};
        text = "Empty";
    };

class RTS_ButtonLightQueue : RTS_Button
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

class RTS_LabelHeavyQueue : RTS_ActiveText
    {
        idc = 1034;
        x = 0.02;
        y = 0.70;
		sizeEx = 0.025;
        colorText[] = {0, 1, 1, 1};
        text = "Empty";
    };

class RTS_ButtonHeavyQueue : RTS_Button
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

class RTS_LabelAirQueue : RTS_ActiveText
    {
        idc = 1036;
        x = 0.02;
        y = 0.55;
		sizeEx = 0.025;
        colorText[] = {0, 1, 1, 1};
        text = "Empty";

    };

class RTS_ButtonAirQueue : RTS_Button
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
//class RTS_LabelNavalQueue : RTS_Text
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

//class RTS_ButtonNavalQueue : RTS_Button
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
class RTS_ListBackground : RTS_Text
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

    class RESEARCH_LIST : RTS_ListBox
    {
        idc = -1;//400;
        rowHeight = 0.035;
        x = 0.22;
        y = 0.1;
        w = 0.58;
        h = 0.50;
		sizeEx = 0.047;
		
    };
    class RESEARCH_TITLE : RTS_SmallTitleBlack
    {
        idc = -1;
        x = 0.22;
        y = 0.1;
        w = 0.30;
        h = 0.03;
		font = FontTITLE;
        text = "RESEARCH STATS";
    };

        class RTS_ListMain : RTS_ListBox
    {
        idc = -1;
        rowHeight = 0.035;
        x = 0.22;
        y = 0.1;
        w = 0.58;
        h = 0.50;
		sizeEx = 0.040;

    };
	    class RTS_ListMain2 : RTS_ListBox
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

        class CENTER_FRAME_TITLE : RTS_Text
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


   class TOP_RIGHT_TITLE : RTS_Text
    {
            idc = -1;
            style = ST_FRAME;
            x = 0.8;
            y = 0.0;
            w = 0.2;
            h = 0.99;
            text = "WarGames";
            font = FontTITLE;
            colorText[] = {1,0.7,0,1};
            colorBackground[] = {0.5, 0.5, 0.5, 0.6};
            sizeEx = 0.030;
    };

    class RIGHT_FRAME_PICTURE : RTS_Picture
    {
            idc = 50;
            x = 0.80;
            y = 0.12;
            w = 0.2;
            h = 0.10;
            colorText[] = {};
            text = "pictures\rtspatch1.paa";
			
			
    };

    class RIGHT_FRAME_TEXT2 : RTS_Text
    {
        idc = 52;
        colorBackground[] = {1,0.7,0,1};
        text = "UNIT CONTROL";
        x = 0.80;
        y = 0.35;
        w = 0.2;
        h = 0.1;
		font = FontTITLE;
        style = ST_CENTER;
        sizeEx = 0.03;
    };

    class TOP_left_TITLE : RTS_Text
    {
            idc = -1;
            style = ST_FRAME;
            x = 0.02;
            y = 0.0;
            w = 0.2;
            h = 0.99;
            text = "INFOMATION";
            font = FontTITLE;
            colorText[] = {1,0.7,0,1};
            colorBackground[] = {0.5, 0.5, 0.5, 0.6};
            sizeEx = 0.030;
    };

                //class List_Background : RTS_ListBackGround {};

                class Group_Background : RTS_Text
                    {
                   idc = 2026;
                    text = "";
                    x = 0.78;
                    y = 0.400;
                    w = 0.400;
                    h = 0.200;
					
            };

              //class Stats_Background : RTS_StatBackGround {};

    class controls
        {

        class List_Assets : RTS_ListMain2 //RESEARCH_LIST
        {
            idc = 100000;
           
        };

        class Button_Help : RTS_Button2
        {
           idc = -1;
           x = 0.02;
           y = 0.99;
		   colorText[] = {1, 0, 0, 1};
            text = "help";
            action = "[] exec ""rts-z-helpmenu.sqs""";
        };

        class Button_Select : RTS_Button
        {
           idc = 100005;
           x = 0.80;
           y = 0.60;
           sizeEx = 0.030;
		   colorText[] = {1, 0, 0, 1};
           text = "View Units";
           action = "[1000] exec ""rts-build-menu.sqs""";
        };

        class SOLDIERS_TITLE : RTS_SmallTitleBlack
    {
        idc = -1;
        x = 0.24;
        y = 0.610;
        w = 0.40;
        h = 0.05;
		font = FontTITLE;
        text = "SOLDIERS IN YOUR GROUP";
    };

        class SOLDIERS_LIST : RTS_ListBox
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
    class Button_Viewdistance : RTS_Button
        {
        idc = 1010;
        x = 0.80;
        y = 0.510;
        sizeEx = 0.020;
        text = "ViewDistance";
        action = "[1015] call Zen_RTS_SetViewDistance""";
        };

        class List_Viewdistance : RTS_Combo
        {
        idc = 1015;
        type = CT_COMBO;
        x = "(SafeZoneW + SafeZoneX) - (0.71)";
        y = 0.510;
        w = 0.08;
        h = 0.04;
        wholeHeight = 0.3;
        sizeEx = 0.030;
        };

        class Button_FlyinHeight : RTS_Button
        {
            idc = -1;
            x = 0.80;
            y = 0.560;
            sizeEx = 0.020;
            text = "Set AI Flight Height";
            action = "[1020,1040,1] exec ""rts-units-orders.sqs""";
        };

        class List_Heights : RTS_Combo
        {
            idc = 1040;
            type = CT_COMBO;
            x = "(SafeZoneW + SafeZoneX) - (0.71)";
            y = 0.560;
            w = 0.08;
            h = 0.04;
            wholeHeight = 0.3;
            sizeEx = 0.030;
            onMouseButtonDblClick= "[1020,1040,1] exec ""rts-units-orders.sqs""";

    };

        class Button_refresh : RTS_Button2
        {
            idc = 100003;
            x = 0.80;
            y = 0.610;
            sizeEx = 0.030;
            text = "Refresh";
            action = "[] exec ""rts-squads-Menu.sqs""";
        };

        class BUTTON_PUSH : RTS_Button2
         {
            idc = -1;
            x = 0.80;
            y = 0.660;
            sizeEx = 0.030;
            colorText[] = {0, 1, 1, 1};
            text = "PUSH";
            action = "closeDialog 0; call RTS_FNC_PUSH";
        };
        class BUTTON_UPRIGHT : RTS_Button2
		{
            idc = -1;
            x = 0.80;
            y = 0.710;
            sizeEx = 0.030;
            colorText[] = {0, 1, 1, 1};
            text = "flip vehicle";
            action = "closeDialog 0; call RTS_FNC_flipACTIONS";
        };
         class Button_repair : RTS_Button2
		 {
            idc = 200007;
            x = 0.80;
            y = 0.760;
            sizeEx = 0.030;
            colorText[] = {0, 1, 0, 1};
            text = "repair";
            action = [];
        };
        class Button_Release : RTS_Button2
		{
            idc = 1025;
            x = 0.80;
            y = 0.810;
            sizeEx = 0.030;
            colorText[] = {0, 1, 0, 1};
            text = "Disband Unit";
            action = "[1020] exec ""rts-unit-release.sqs""";
        };
        class BUTTON_CANCEL : RTS_Button2
        {
        idc = -1;
		style = 2096;
        x = 0.8;
        y = 0.99;
		sizeEx = 30;
        text = "Cancel";
        action = "closeDialog 0";
        };
        class Label_Money : RTS_MoneyLabel {};
        class Label_Supply : RTS_SupplyLabel {};
        class Label_FPS : RTS_FPSLabel {};
        //class List_Stats : RTS_StatList {};
        class List_Queue : RTS_QueueList {};

        class LabelBarracksQueue : RTS_LabelBarracksQueue {};
        class ButtonBarracksQueue : RTS_ButtonBarracksQueue {};
        class LabelLightQueue : RTS_LabelLightQueue {};
        class ButtonLightQueue : RTS_ButtonLightQueue {};
        class LabelHeavyQueue : RTS_LabelHeavyQueue {};
        class ButtonHeavyQueue : RTS_ButtonHeavyQueue {};
        class LabelAirQueue : RTS_LabelAirQueue {};
        class ButtonAirQueue : RTS_ButtonAirQueue {};
        //class LabelNavalQueue : RTS_LabelNavalQueue {};
        //class ButtonNavalQueue : RTS_ButtonNavalQueue {};

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

    class CENTER_FRAME_TITLE : RTS_Text
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

    class TOP_RIGHT_TITLE : RTS_Text
    {
            idc = -1;
            style = ST_FRAME;
            x = 0.8;
            y = 0.0;
            w = 0.2;
            h = 0.99;
            font = FontTITLE;
            colorText[] = {1,0.7,0,1};
            colorBackground[] = {0,0,0,0};
            sizeEx = 0.030;
            text = "R T S - V";
    };

    class RIGHT_FRAME_PICTURE : RTS_Picture
    {
        idc = 50;
        colorText[] = {};
        text = "";
        x = 0.8;
        y = 0.135;
        w = 0.2;
        h = 0.13;
    };
	class TOP_left_TITLE : RTS_Text
    {
            idc = -1;
            style = ST_FRAME;
            x = 0.02;
            y = 0.0;
            w = 0.2;
            h = 0.99;
            text = "INFOMATION";
            font = FontTITLE;
            colorText[] = {1,0.7,0,1};
            colorBackground[] = {0,0,0,0};
            sizeEx = 0.030;
	};		
	class TOP_left_TITLE2 : RTS_Text
	{
	        idc = -1;
            style = ST_FRAME;
            colorText[] = {1, 0, 0, 1};
            x = 0.02;
            y = 0.0;
            w = 0.2;
            h = 0.1;
	
    };

            //class List_Background : RTS_ListBackGround {};

            class Group_Background : RTS_Text
                {
                    idc = 2026;
                    text = ;
                        x = 0.78;
                        y = 0.400;
                        w = 0.400;
                        h = 0.400;
                };

            class Background_CustomSquads : RTS_Text
                {
                    text = ;
                    idc = 2031;
                    x = 0.81;
                    y = 0.35;
                    w = 0.18;
                    h = 0.15;
                };

            //class Stats_Background : RTS_StatBackGround {};

        class controls
            {
            class List_CrewCount : RTS_Combo {
                idc = 2045;
                type = CT_COMBO;
                x = "(SafeZoneW + SafeZoneX) - (0.71)";
                y = 0.410;
                w = 0.08;
                h = 0.04;
                wholeHeight = 0.3;
                sizeEx = 0.030;
            };

            class List_Vehicles : RTS_ListMain
                {
                    idc = 2000;
                    onButtonClick = "uiNamespace setVariable ['2000', _this select 0] execVM ""rts-build-unit.sqf""";
                };
            class Button_Back : RTS_Button2
                {
                    idc = 2001;
                    x = 0.8;
                    y = 0.15;
					colorText[] = {1, 0, 0, 1};
                    text = "<<Back to Main Menu";
                    action = "[Player,Player,0] exec ""rts-alpha-menu.sqs""";
                };

            class Button_Build : RTS_Button
                {
                    idc = 2005;
                    x = 0.8;
                    y = 0.2;
                    text = "";
					colorText[] = {1, 0, 0, 1};
                    action = "[2000,0,False,False] execVM ""rts-build-unit.sqf""";
                };


            class Button_Manned_You : RTS_Button
                {
                    idc = 2015;
                    x = 0.8;
                    y = 0.25;
                    text = "";
					colorText[] = {1, 0, 0, 1};
                        //[ListID,ListID2,Manned,Squad]
                    action = "[2000,0,True,False] execVM ""rts-build-unit.sqf""";
                };

            class Button_Custom_Squad : RTS_Button
                {
                    idc = 2016;
                    x = 0.8;
                    y = 0.30;
                    text = "";
                    action = "[2000,2030,False,False] execVM ""rts-build-unit.sqf""";
                };

            class List_CustomSquads : RTS_ListBox
                {
                    idc = 2030;
                    x = 0.81;
                    y = 0.35;
                    w = 0.18;
                    h = 0.15;
                    font = PuristaMedium;

        };

            class Button_Manned_Squad : RTS_Button
                {
                    idc = 2020;
                    x = 0.8;
                    y = 0.51;
                    text = "";
					colorText[] = {1, 0, 0, 1};
                    action = "[2000,2025,True,True] execVM ""rts-build-unit.sqf""";
                };

            class List_Squads : RTS_ListBox
                {
                    idc = 2025;
                    x = 0.8;
                    y = 0.56;
                    w = 0.20;
                    h = 0.35;
                    sizeEx = 0.02;
                    font = PuristaMedium;
        };

            class Button_Exit : RTS_Button2
                {
                    idc = -1;
					style = ST_PICTURE;
                    x = 0.8;
                    y = 0.99;
					colorText[] = {1, 0, 0, 1};
                    text = "Exit";
                    action = "closeDialog 0";
                };

            class Label_Money : RTS_MoneyLabel {};
            class Label_Supply : RTS_SupplyLabel {};
            class Label_FPS : RTS_FPSLabel {};
            //class List_Stats : RTS_StatList {};

            class LabelBarracksQueue : RTS_LabelBarracksQueue {};
            class ButtonBarracksQueue : RTS_ButtonBarracksQueue {};
            class LabelLightQueue : RTS_LabelLightQueue {};
            class ButtonLightQueue : RTS_ButtonLightQueue {};
            class LabelHeavyQueue : RTS_LabelHeavyQueue {};
            class ButtonHeavyQueue : RTS_ButtonHeavyQueue {};
            class LabelAirQueue : RTS_LabelAirQueue {};
            class ButtonAirQueue : RTS_ButtonAirQueue {};
            //class LabelNavalQueue : RTS_LabelAirQueue {};
            //class ButtonNavalQueue : RTS_ButtonAirQueue {};

        };//End Controls

};//end dlgBuild

//Dialog for Respawn IDs 1310-1312
class DlgRespawn
    {
        idd = -1;
        movingEnable = true;

        class controlsBackground
            {
                class List_Background : RTS_Text
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
                class LABEL_RESPAWN : RTS_Text
                    {
                        idc = -1;
                        style = ST_CENTER;
                        x = 0.25;
                        y = 0.05;
                        w = 0.9;
                        h = 0.07;
                        font = PuristaMedium;
                        colorText[] = {1, 1, 1, 1};
                        sizeEx = 0.08;
                        text = "Choose Deployment Location";
                    };

                class LABEL_LOCATION : RTS_Text
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

                class LABEL_TIMERTEXT : RTS_Text
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

                class LABEL_TIMERNUMBER : RTS_Text
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

                class LIST_LOCATION : RTS_ListBox
                    {
                        idc = 1312;
                        x = 0.78;
                        y = 0.55;
                        //w = 0.2;
                        //h = 0.3;
                        font = PuristaMedium;
                        sizeEx = 0.03;
                        colorText[] = {1, 0, 0, 1};
                  };

                class BUTTON_RESPAWN : RTS_Button2
                    {
                        idc = 1313;
                        x = 0.78;
                        y = 0.9;
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
      //  class Stats_Background : RTS_StatBackGround {};
            };

        class controls
            {
            //class List_Stats : RTS_StatList {};
            class Label_Money : RTS_MoneyLabel {};
            class Label_Supply : RTS_SupplyLabel {};
            class Labe_FPS : RTS_FPSLabel {};
            };

    };

class DlgConfirm {
    idd = -1;
    movingEnable = true;
    controlsBackground[] = {
        CONFIRM_BACKGROUND, 
        CONFIRM_FRAME
    };

    class CONFIRM_BACKGROUND : RTS_Text {
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

    class CONFIRM_FRAME : RTS_Text {
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

    class BUTTON_YES : RTS_Button 
	{
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

    class BUTTON_NO : RTS_Button 
	{
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

    class CONFIRM_TEXT : RTS_Text {
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
