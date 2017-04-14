using Toybox.Application as App;
using Toybox.WatchUi as Ui;

class BigRingVR_ANT_Remote_ControlDelegate extends Ui.BehaviorDelegate
{

	var My_App;

    function initialize()
    {
        BehaviorDelegate.initialize();

        My_App = App.getApp();
    }

    function onMenu()
    {
        Ui.pushView(new Rez.Menus.MainMenu(), new BigRingVR_ANT_Remote_ControlMenuDelegate(), Ui.SLIDE_UP);
        return true;
    }

    function onBack()
    {
		//
		// Block Back Button on Main Screen to use it as LAP Button for non TouchScreen devices
		//

		if(My_App.Garmin_Device_Type.equals("fr_230")
		  or My_App.Garmin_Device_Type.equals("fr_235")
		  or My_App.Garmin_Device_Type.equals("fr_735xt")
		  or My_App.Garmin_Device_Type.equals("fr_920xt")
		  or My_App.Garmin_Device_Type.equals("edge_520"))
		{
			My_App.SendAntCommandLap();
		}
		
        return true;
    }

	
	function onKey(event)
    {

		// Implements events:
		//
		//    04 = ENTER
		//    05 = ESC
		//    08 = DOWN
		//    19 = LAP
		//    13 = UP
		//    23 = MODE
		//

		//
		// Manage MENU call from button for non TouchScreen devices
		//
        System.println("Device_Type = " + My_App.Garmin_Device_Type);
        System.println("Event = " + event.getKey() );
        
		if(My_App.Garmin_Device_Type.equals("fr_230")
		   or My_App.Garmin_Device_Type.equals("fr_235")
		   or My_App.Garmin_Device_Type.equals("fr_735xt")
		   or My_App.Garmin_Device_Type.equals("edge_520"))
		{
		   	if(Ui.KEY_ENTER == event.getKey())
    			{
        			// - 04 - ENTER => Menu = 1
        			System.println("Key = ENTER");
        			onMenu();
				}
		}

		else if(My_App.Garmin_Device_Type.equals("fr_920xt"))
		{
		   	if(Ui.KEY_MODE == event.getKey())
    			{
        			// - 23 - MODE => Menu = 1
        			System.println("Key = MODE");
        			onMenu();
				}
		}

		if(My_App.Garmin_Device_Type.equals("fr_630"))
		{
		   	if(Ui.KEY_LAP == event.getKey())
    			{
        			// - 19 - MODE => Menu = 1
        			System.println("Key = LAP");
        			My_App.SendAntCommandLap();
				}
		}

        return true;
	}
}