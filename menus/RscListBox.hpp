   class RscListBox
  {
	access = 0;
	type = CT_LISTBOX;
	style =  ST_LEFT;
	font = FontMAIN;
	w = 0.4;
	h = 0.4;
	offsetX = 0.002;
    offsetY = 0.002;
    offsetPressedX = 0.003;
    offsetPressedY = 0.003;
    colorFocused[] = {0.0, 0.1, 0.7, 0.5};
    colorShadow[] = {0.02, 0.2, 0.7, 0.6};
    shadow = 0.000001;
    colorBorder[] = {0.0, 0.1, 0.7, 0.5};
    borderSize = 0.00006;
	rowHeight = 0;
	colorText[] ={1,1,1,1};
	colorDisabled[] ={1,1,1,1};
	colorBackgroundActive[] = {0,0.18,0.388,0.4};
    sizeEx = 0.030;
	colorBackground[] = {0,0,0,0.72};
	colorSelect[] = {1,0,0,1};
	colorSelect2[] = {0.941,0.973,1,1};
	colorScrollbar[] = {0.0, 0.1, 0.7, 0.5};
	colorSelectBackground[] = {0,0,0,0};
	colorSelectBackground2[] = {0,0,0,0};
	period = 1.2;
	maxHistoryDelay = 1;
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


    class ScrollBar
			{
        color[] = {1, 1, 1, 1};
	    colorBackground[] = {0.0, 0.1, 0.7, 0.5};
	    colorSelect[] = {1,0,0,1};
	    colorSelect2[] = {1,1,1,1};
	    colorScrollbar[] = {0,0.72,0,1};
	    colorSelectBackground[] =  {0.0, 0.1, 0.7, 0.5};
	    colorSelectBackground2[] = {0.0, 0.1, 0.7, 0.5};
		thumb = "\A3\ui_f\data\ui_scrollbar_thumb_ca.paa";
		arrowEmpty = "\A3\ui_f\data\ui_arrow_top_ca.paa";
		arrowFull = "\A3\ui_f\data\ui_arrow_top_active_ca.paa";
		border = "\A3\ui_f\data\ui_border_scroll_ca.paa";
			};

			class ListScrollBar: ScrollBar
			{
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		autoScrollDelay = 5;
		autoScrollEnabled = 0;
		autoScrollRewind = 0;
		autoScrollSpeed = -1;
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
		color[] =  {0.0, 0.1, 0.7, 0.5};
		colorActive[] = {0.18,0.345,0.58,1};
		colorDisabled[] = {1,1,1,0.25};
		height = 0;
		scrollSpeed = 0.06;
		shadow = 0;
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		width = 0;
			};
	};