
class RscPicture
{
	type = CT_STATIC;
	idc = -1;
	style = 0x30 + 0x100;
	sizeEx = 0.025;

	colorText[] = { 1, 1, 1, 1 };
	colorBackground[] = { 0, 0, 0, 0 };

	x = 0;
	y = 0;
	w = 1.0;
	h = 1.0;

	font = FontM;
	text = "";

};
class WestIcon
	{
		idd=-1;
		movingEnable = true;
		duration=2;
		name = "WestIcon";
		controls[]=
		{
			Picture
		};

		class Picture : RscPicture
		{
			x = 0.88; y=0.01; w = 0.1; h = 0.07;
			text = "rsc\West.paa";
		};
	};
	class WestTaking
	{
		idd=-1;
		movingEnable = true;
		duration=2;
		name = "WestTaking";
		controls[]={Picture};

		class Picture : RscPicture
		{
			x = 0.88; y=0.01; w = 0.1; h = 0.07;
			text = "rsc\West_taking.paa";
		};
	};
	class EastIcon
	{
		idd=-1;
		movingEnable = true;
		duration=2;
		name = "EastIcon";
		controls[]={Picture};

		class Picture : RscPicture
		{
			x = 0.88; y=0.01; w = 0.1; h = 0.07;
			text = "rsc\East.paa";
		};
	};
	class EastTaking
	{
		idd=-1;
		movingEnable = true;
		duration=2;
		name = "EastTaking";
		controls[]={Picture};

		class Picture : RscPicture
		{
			x = 0.88; y=0.01; w = 0.1; h = 0.07;
			text = "rsc\East_taking.paa";
		};
    };
