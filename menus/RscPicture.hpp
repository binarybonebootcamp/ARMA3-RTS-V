
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
class westIcon
	{
		idd=-1;
		movingEnable = true;
		duration=2;
		name = "westIcon";
		controls[]=
		{
			Picture
		};

		class Picture : RscPicture
		{
			x = 0.88; y=0.01; w = 0.1; h = 0.07;
			text = "rsc\west.paa";
		};
	};
	class westTaking
	{
		idd=-1;
		movingEnable = true;
		duration=2;
		name = "westTaking";
		controls[]={Picture};

		class Picture : RscPicture
		{
			x = 0.88; y=0.01; w = 0.1; h = 0.07;
			text = "rsc\west_taking.paa";
		};
	};
	class eastIcon
	{
		idd=-1;
		movingEnable = true;
		duration=2;
		name = "eastIcon";
		controls[]={Picture};

		class Picture : RscPicture
		{
			x = 0.88; y=0.01; w = 0.1; h = 0.07;
			text = "rsc\east.paa";
		};
	};
	class eastTaking
	{
		idd=-1;
		movingEnable = true;
		duration=2;
		name = "eastTaking";
		controls[]={Picture};

		class Picture : RscPicture
		{
			x = 0.88; y=0.01; w = 0.1; h = 0.07;
			text = "rsc\east_taking.paa";
		};
    };
