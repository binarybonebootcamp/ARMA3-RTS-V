#define true						1
#define false						0
#define Size_Main_Normal 			0.03
#define Size_Text_Default 			Size_Main_Normal
#define Size_Text_Small 			0.025
#define Color_White					{1, 1, 1, 1}
#define Color_Black					{0, 0, 0, 1}
#define Color_Gray					{0.3, 0.3, 0.3, 1}
#define Color_GrayLight 			{0.6, 0.6, 0.6, 1}
#define Color_GrayDark 				{0.2, 0.2, 0.2, 1}
#define Color_Orange				{1, 0.5, 0, 1}
#define Color_LightGreen			{.1, 0.5, 0, .7}
#define Color_Main_Foreground1 	    Color_White
#define Color_Text_Default 			Color_Main_Foreground1
#define ProcTextWhite 				"#(argb,8,8,3)color(1,1,1,1)"
#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_SHORTCUTBUTTON   16
#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK        98
#define CT_USER             99
#define CT_MAP              100
#define CT_MAP_MAIN         101
#define CT_LISTNBOX         102
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0C

#define ST_TYPE           0xF0
#define ST_SINGLE         0x00
#define ST_MULTI          0x10
#define ST_TITLE_BAR      0x20
#define ST_PICTURE        0x30
#define ST_FRAME          0x40
#define ST_BACKGROUND     0x50
#define ST_GROUP_BOX      0x60
#define ST_GROUP_BOX2     0x70
#define ST_HUD_BACKGROUND 0x80
#define ST_TILE_PICTURE   0x90
#define ST_WITH_RECT      0xA0
#define ST_LINE           0xB0
#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200
#define ST_KEEP_ASPECT_RATIO  0x800                   16
#define ReadAndWrite			    0

#define FontM "EtelkaMonospaceProBold"
#define FontHTML "EtelkaMonospacePro"
#define FontHTMLBold "EtelkaMonospacePro"
#define FontMAINCZ "PuristaMedium"
#define FontMAIN "PuristaMedium"
#define FontTITLE "EtelkaMonospaceProBold"
#define FontTITLEHalf "PuristaMedium"
#define FontBOOK "tahomaB"
#define FontNOTES "tahomaB"
#define FontS "LucidaConsoleB"
#define ST_TITLE ST_TITLE_BAR + ST_CENTER
// Predefined controls
#define IDC_OK			1
#define IDC_CANCEL		2

// Colors
#define TextColor	0.08, 0.08, 0.12
#define InvTextColor	0.35, 0.38, 0.36

class RscText {

    idc = -1;
    type = CT_STATIC;
    style = ST_MULTI;
    linespacing = 1;
    colorBackground[] = {0,0,0,0};
    colorText[] = {1,1,1,1};
    soundPush[] = {"a3\sounds_f\weapons\closure\sfx1.wss", 0.1, 1};
    soundClick[] = {"a3\sounds_f\weapons\closure\sfx3.wss", 0.2, 1};
    soundEscape[] = {"a3\sounds_f\weapons\closure\sfx11.wss", 0.2, 1};
    soundEnter[] = {"a3\sounds_f\weapons\closure\sfx4.wss",0.20,1};
    text = "";
    shadow = 0;
    font = FontM;
    SizeEx = "";
    fixedWidth = 0;
    x = 0;
    y = 0;
    h = 5;
    w = 20;
};
class RscTitleText
{
	type=0;
	idc=-1;
	style=2;
	colorBackground[] = { 0, 0, 0, 0 };
	colorText[] = { 1, 1, 1, 1 };
	font="PuristaMedium";
	size=1;
};
class RscActiveText
	{
		access = ReadAndWrite;
		type = CT_ACTIVETEXT;
		style = ST_CENTER;
		h = 0.05;
		w = 0.10;
		colorBackground[] = { 0, 0, 0, 0 };
	    colorText[] = {1,0.5,0,1};
		color[] = {1,1,1,0.8};
	    colorActive[] = { 1, 0.2, 0.2, 1 };
		colorDisabled[] = {0,0,0,0.3};
        soundPush[] = {"a3\sounds_f\weapons\closure\sfx1.wss", 0.1, 1};
        soundClick[] = {"a3\sounds_f\weapons\closure\sfx3.wss", 0.2, 1};
        soundEscape[] = {"a3\sounds_f\weapons\closure\sfx11.wss", 0.2, 1};
        soundEnter[] = {"a3\sounds_f\weapons\closure\sfx4.wss",0.20,1};
	    action = str formatText ["%1", wtf];
		font = "PuristaMedium";
		sizeEx = 0.03;
        arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		text = "";
		default = true;
	};
class RscStructuredtext
{
		access = ReadAndWrite;
		type = CT_STATIC;
		idc = -1;
		style = ST_LEFT;
		lineSpacing = 0;
		w = 0.1;
		h = 0.05;
		font = "TahomaB";
		sizeEx = Size_Text_Small;
		text = "";
};	
class RscSmallTitle
{
        type = CT_STATIC;
        idc = -1;
        style = ST_CENTER;
        colorBackground[] = {0, 0, 0, 1};
        colorText[] = {0, 0, 1, 1};
        font = FontMAIN;
        sizeEx = 0.04;
};

class RscSmallTitleBlack
{
        type = CT_STATIC;
        idc = -1;
        style = ST_CENTER;
        colorBackground[] = {0, 0, 0, 0};
        colorText[] = {1,0.5,0,1};
        font = FontTITLEHalf;
        sizeEx = 0.03;
};
class RscPicture {
    access = 0;
    idc = -1;
    type = CT_STATIC;
    style = ST_PICTURE;
    colorBackground[] = {0,0,0,0};
    colorText[] = {0,0,0,0};
    font = "tahomaB";
    sizeEx = 0;
    lineSpacing = 0;
    text = "";
    fixedWidth = 0;
    shadow = 0;
    x = 0;
    y = 0;
    w = 0.3;
    h = 0.2;
};

class RscPictureKeepAspect: RscPicture {
	style = ST_PICTURE + ST_KEEP_ASPECT_RATIO;
};
class RscActivePicture
	{
		access = ReadAndWrite;
		type = CT_ACTIVETEXT;
	        idc = -1;
	        style = ST_PICTURE;
	        font = PuristaMedium;
	        sizeEx = 0.04;
            soundEnter[] = {"a3\sounds_f\weapons\closure\sfx4.wss",0.45,1};
	        soundPush[] = {"a3\sounds_f\weapons\closure\sfx1.wss", 0.1, 1};
	        soundClick[] = {"a3\sounds_f\weapons\closure\sfx3.wss", 0.2, 1};
	        soundEscape[] = {"a3\sounds_f\weapons\closure\sfx11.wss", 0.2, 1};
	};
class RscTitles
  {
	titles[] = {"crewinfomessage"};
	
	class Zen_pic
	{
	idd=-1;
	movingEnable=0;
	duration=9999;
	fadein=0;
	name="intro";
	controls[]={"Image_1"};

};

	  	class Image_1 : RscPicture
	  	  {
			x = safezoneX + safezoneW - 0.40;
			y = safezoneY + safezoneH - 0.21;
			w = 0.40;
			h = 0.21;
			text = "pictures\rtspatch1.paa";
	  	  };
	};
  		  
	class Black
	{
	idd=-1;
	movingEnable=0;
	duration=9999;
	fadein=0;
	name="intro";
	controls[]={"title1"};
	 
	  	class title1 : RscText 
	  	  {
	  	  	text="";
	  	  	colorText[]={0.8,0,0,1};
			sizeEx = 0.05;	  	  	
	  	  	x=0.000;
	  	  	y=0.000;
	  	  	w=1.000;
	  	  	h=1.000;
	  	  };
	};

	class Title
	{
	idd=-1;
	movingEnable=0;
	duration=9999;
	fadein=0;
	name="intro";
	controls[]={"Image_1","Image_2","title1","title2","title3","title4","title5","title6"};

	  	class Image_1 : RscPicture
	  	  {
			x = safezoneX + safezoneW - 0.40;
			y = safezoneY + safezoneH - 0.21;
			w = 0.40;
			h = 0.21;
			text = "pictures\rtspatch1.paa";
	  	  };

	  	class Image_2 : RscPicture
	  	  {
			x = 0.300;
			y = 0.060;
			w = 0.380;
			h = 0.500;
			text = "pictures\rtspatch1.paa";
	  	  };

	  	class title1 : RscText 
	  	  {
	  	  	text="Zenophon And";
	  	  	colorText[]={0.5,0.5,0.5,1};
			sizeEx = 0.08;
	  	  	x=0.002;
	  	  	y=0.082;
	  	  	w=1.00;
	  	  	h=1.00;
	  	  };
	  	class title2 : RscText 
	  	  {
	  	  	text="Zenophon And";
	  	  	colorText[]={1,1,1,1};
			sizeEx = 0.08;	  	  	
	  	  	x=0.000;
	  	  	y=0.080;
	  	  	w=1.00;
	  	  	h=1.00;
	  	  };

	  	class title3 : RscText 
	  	  {
	  	  	text="Dr.Death jm PRESENTS";
	  	  	colorText[]={0.5,0.5,0.5,1};
			sizeEx = 0.08;	  	  	
	  	  	x=0.002;
	  	  	y=0.137;
	  	  	w=1.00;
	  	  	h=1.00;
	  	  };
	  	class title4 : RscText 
	  	  {
	  	  	text="Dr.Death jm PRESENTS";
	  	  	colorText[]={1,1,1,1};
			sizeEx = 0.08;	  	  	
	  	  	x=0.000;
	  	  	y=0.134;
	  	  	w=1.00;
	  	  	h=1.00;
	  	  };

	  	class title5 : RscText 
	  	  {
	  	  	text="RTS V";
	  	  	colorText[]={0.5,0.5,0.5,1};
			sizeEx = 0.06;	  	  	
	  	  	x=0.002;
	  	  	y=0.252;
	  	  	w=1.00;
	  	  	h=1.00;
	  	  };
	  	class title6 : RscText 
	  	  {
	  	  	text="RTS V";
	  	  	colorText[]={1,1,1,1};
			sizeEx = 0.06;	  	  	
	  	  	x=0.000;
	  	  	y=0.250;
	  	  	w=1.00;
	  	  	h=1.00;
	  	  };
	};

	class Title2
	{
	idd=-1;
	movingEnable=0;
	duration=9999;
	fadein=0;
	name="intro";
	controls[]={"Image_1","title1","title2","title3","title4","title5","title6"};

	  	class Image_1 : RscPicture
	  	  {
			x = safezoneX + safezoneW - 0.40;
			y = safezoneY + safezoneH - 0.21;
			w = 0.40;
			h = 0.21;
			text = "pictures\rtspatch1.paa";
	  	  };

	  	class title1 : RscText 
	  	  {
	  	  	text="Zenophon And";
	  	  	colorText[]={0.5,0.5,0.5,1};
			sizeEx = 0.08;
	  	  	x=0.002;
	  	  	y=0.082;
	  	  	w=1.00;
	  	  	h=1.00;
	  	  };
	  	class title2 : RscText 
	  	  {
	  	  	text="Zenophon And";
	  	  	colorText[]={1,1,1,1};
			sizeEx = 0.08;	  	  	
	  	  	x=0.000;
	  	  	y=0.080;
	  	  	w=1.00;
	  	  	h=1.00;
	  	  };

	  	class title3 : RscText 
	  	  {
	  	  	text="Dr.Death jm PRESENTS";
	  	  	colorText[]={0.5,0.5,0.5,1};
			sizeEx = 0.08;	  	  	
	  	  	x=0.002;
	  	  	y=0.137;
	  	  	w=1.00;
	  	  	h=1.00;
	  	  };
	  	class title4 : RscText 
	  	  {
	  	  	text="Dr.Death jm PRESENTS";
	  	  	colorText[]={1,1,1,1};
			sizeEx = 0.08;	  	  	
	  	  	x=0.000;
	  	  	y=0.134;
	  	  	w=1.00;
	  	  	h=1.00;
	  	  };

	  	class title5 : RscText 
	  	  {
	  	  	text="RTS V";
	  	  	colorText[]={0.5,0.5,0.5,1};
			sizeEx = 0.06;	  	  	
	  	  	x=0.002;
	  	  	y=0.252;
	  	  	w=1.00;
	  	  	h=1.00;
	  	  };
	  	class title6 : RscText 
	  	  {
	  	  	text="RTS V";
	  	  	colorText[]={1,1,1,1};
			sizeEx = 0.06;	  	  	
	  	  	x=0.000;
	  	  	y=0.250;
	  	  	w=1.00;
	  	  	h=1.00;
	  	  };
	};
	class crewinfomessage
		{
		idd = 10100;
		movingEnable=0;
		duration = 1000000000; 
		fadein=0;    
		name="crewinfomessage";
		controlsBackground[] = {"crewinfotext", "crewinfoteamtext"};
		onLoad = "uiNamespace setVariable ['crewinfodisplay', _this select 0];";
		onunLoad = "uiNamespace setVariable ['crewinfodisplay', objnull];";    

		class crewinfotext { 
			idc = 10101; 
			type = CT_STRUCTURED_TEXT; 
			style = ST_LEFT; 
			x = (SafeZoneX + 0.02);
			y = (SafeZoneY + 1.25);
			w = 0.3;
			h = 0.6;
			size = 0.018; 
			colorBackground[] = { 0, 0, 0, 0 };
			colortext[] = {0,0,0,0.7};
			text ="";
		};

		class crewinfoteamtext { 
			idc = 10103; 
			type = CT_STRUCTURED_TEXT; 
			style = ST_LEFT; 
			x = (SafeZoneW + SafezoneX) - 0.25;
			y = (1 + ((0 + SafeZoneY) * -1) - 0.14);
			w = 0.25;
			h = 0.14;
			size = 0.02; 
			colorBackground[] = { 0, 0, 0, 0 };
			colortext[] = {0,0,0,0.7};
			text ="";
		};
	};

class RscSlider
{
        access = 0;
        type = 3;
        style = 1024;
        w = 0.3;
        color[] = {1,1,1,0.8};
        colorActive[] = {1,1,1,1};
        shadow = 0;
        h = 0.025;
};

class RscButton {
	access = 0;
    type = CT_BUTTON;
    text = "";
    colorText[] = {1,1,1,1};
    colorDisabled[] = {0.4,0.4,0.4,0};
    colorBackground[] = {0.2,0.2,0.2,0.3};
    colorBackgroundDisabled[] = {0,0,0,0};
    colorBackgroundActive[] = {0.2,0.2,0.2,0.3};
    colorFocused[] = {0.75,0.75,0.75,.5};
    colorShadow[] = {0.023529,0,0.0313725,0};
    colorBorder[] = {0.023529,0,0.0313725,0};
    soundPush[] = {"a3\sounds_f\weapons\closure\sfx1.wss", 0.1, 1};
    soundClick[] = {"a3\sounds_f\weapons\closure\sfx3.wss", 0.2, 1};
    soundEscape[] = {"a3\sounds_f\weapons\closure\sfx11.wss", 0.2, 1};
	soundEnter[] = {"a3\sounds_f\weapons\closure\sfx4.wss",0.45,1};
    style = 2;
    x = 0;
    y = 0;
    w = 0.2;
    h = 0.04;
    shadow = 0;
    font = FontS;
    sizeEx = 0.03;
    offsetX = 0.003;
    offsetY = 0.003;
    offsetPressedX = 0.002;
    offsetPressedY = 0.002;
    borderSize = 0;
};
class RscButton2
{
        type = CT_BUTTON;
        idc = 101;
        Style = ST_CENTER;
        colorText[] = {1, 1, 1, 1};
        font = FontTITLEHalf;
        sizeEx = 0.03;
	soundEnter[] = {"a3\sounds_f\weapons\closure\sfx4.wss",0.45,1};
        soundPush[] = {"a3\sounds_f\weapons\closure\sfx1.wss", 0.1, 1};
        soundClick[] = {"a3\sounds_f\weapons\closure\sfx3.wss", 0.2, 1};
        soundEscape[] = {"a3\sounds_f\weapons\closure\sfx11.wss", 0.2, 1};
        default = false;
        w = 0.2;
        h = 0.10;
        offsetX = 0.002;
        offsetY = 0.002;
        offsetPressedX = 0.003;
        offsetPressedY = 0.003;
        shadow = 0.000001;
        borderSize = 0.00006;
        colorDisabled[] = {0,0,0,0};
        colorFocused[] = {0.0, 0.1, 0.7, 0.5};
        colorShadow[] = {0.02, 0.2, 0.7, 0.6};              
        colorBackgroundDisabled[] = {1,1,1,1};
        colorBackgroundActive[] = {0,0.18,0.388,0.4};
        colorBackground[] = {0,0,0,0.72};   
        colorBorder[] = {0.0, 0.1, 0.7, 0.5};

};

class rscedit {
	type = 2;
	style = 0x00 + 0x40;
	font = "PuristaMedium";
	shadow = 2;
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorBackground[] = {0, 0, 0, 1};
	soundSelect[] = {"",0.1,1};
	soundExpand[] = {"",0.1,1};
	colorText[] = {0.95, 0.95, 0.95, 1};
	colorDisabled[] = {1, 1, 1, 0.25};
	autocomplete = false;
	colorSelection[] = {0.5, 0, 0, 1};
	canModify = 1;
};

	class RscFrame
	{
		type = CT_STATIC;
		idc = -1;
		style = ST_FRAME;
		shadow = 2;
		colorDisabled[] = {0,0.13,0.25,0.7};
		colorBackground[] = {0,0.13,0.25,0.7};
		colorBackgroundDisabled[] = {0,0.13,0.25,0.7};
		colorBackgroundActive[] = {0,0.13,0.25,0.7};
		colorFocused[] = {0,0.13,0.25,0.7};
		colorShadow[] = {0.023529,0,0.0313725,1};
		colorBorder[] = {1, 0, 0, 1};
		colorText[] = {1, 0, 0, 1};
		font = "PuristaMedium";
		sizeEx = 0.01;
		text = "";
	};

class Scrollbar {
    idc = -1; 
    type = CT_SLIDER; 
    style = SL_HORZ; 
    x = 0.4; 
    y = 0.2; 
    w = 0.3; 
    h = 0.01; 
    color[] = { 1, 1, 1, 1 }; 
    coloractive[] = { 1, 0, 0, 0.5 };
    // This is an ctrlEventHandler to show you some response if you move the sliderpointer.
    onSliderPosChanged = "hint format[""%1"",_this];";
};
class RscListBox
 {
	access = 0;
	type = 5;
	style = 0;
	w = 0.4;
	h = 0.4;
	font = "tahomaB";
	sizeEx = 0.03;
	rowHeight = 0.05;
	colorText[] = {1,1,1,1};
	colorScrollbar[] = {1,1,1,1};
	colorSelect[] = {0,0,0,1};
	colorSelect2[] = {1,0.5,0,1};
	colorSelectBackground[] = {0.2,0.2,0.2,0.3};
	colorSelectBackground2[] = {0.2,0.2,0.2,0.3};
	colorBackground[] = {0.2,0.2,0.2,0.3};
	colorDisabled[] = {1,1,1,0.3};
	maxHistoryDelay = 1.0;
	period = 1;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	soundExpand[] = {"a3\sounds_f\weapons\closure\revolver_cylinder_turn_2.wss",0.1,1};
    soundCollapse[] = {"a3\sounds_f\weapons\closure\revolver_cylinder_turn_1.wss",0.09,1};
	soundSelect[] = {"a3\sounds_f\weapons\closure\sfx4.wss",0.1,1};
	soundEnter[] = {"a3\sounds_f\weapons\closure\sfx4.wss",0.45,1};
	soundPush[] = {"a3\sounds_f\weapons\closure\sfx4.wss",0.45,1};
    soundClick[] = {"a3\sounds_f\weapons\closure\sfx3.wss",0.45,1};
	soundEscape[] = {"a3\sounds_f\weapons\closure\sfx2.wss",0.09,1};
	arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
	arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
	shadow = 0;
	borderSize = 0;
	class ListScrollBar : ScrollBar //ListScrollBar is class name required for Arma 3
	{
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		thumb = "#(argb,8,8,3)color(1,1,1,1)";
		arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
		arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
		border = "";
		shadow = 0;
	};
	onLBSelChanged = "systemChat str ['onLBSelChanged',_this]; true";
	onLBDblClick = "systemChat str ['onLBDblClick',_this]; false";
};