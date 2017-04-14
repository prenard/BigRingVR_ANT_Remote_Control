using Toybox.Application as App;
using Toybox.WatchUi as Ui;

class BigRingVR_ANT_Remote_ControlApp extends App.AppBase
{
	var my_ANT_Generic_CTRL;
	var Garmin_Device_Type;
    //var my_App_Controller;

    function initialize()
    {
        AppBase.initialize();

	    Garmin_Device_Type = Ui.loadResource(Rez.Strings.Device);
        System.println("Device Type = " + Garmin_Device_Type);
        //my_App_Controller = new $.BigRingVR_ANT_Remote_ControController();
        my_ANT_Generic_CTRL = new ANT_Generic_CTRL();
    }

    // onStart() is called on application start up
    function onStart(state)
    {
        my_ANT_Generic_CTRL.open();
    }

    // onStop() is called when your application is exiting
    function onStop(state)
    {
    }

    // Return the initial view of your application here
    function getInitialView()
    {
        return [ new BigRingVR_ANT_Remote_ControlView(), new BigRingVR_ANT_Remote_ControlDelegate() ];
    }


	//
	// General Functions
	//

    function SendAntCommandLap()
    {
        my_ANT_Generic_CTRL.Send_Command(36);
    }

    function SendAntCommandFullScreen()
    {
        my_ANT_Generic_CTRL.Send_Command(32768);
    }

    function SendAntCommandScreenShoot()
    {
        my_ANT_Generic_CTRL.Send_Command(32769);
    }

    function SendAntCommandDashBoardDisplay()
    {
        my_ANT_Generic_CTRL.Send_Command(32770);
    }

    function SendAntCommandProfileZoom()
    {
        my_ANT_Generic_CTRL.Send_Command(32771);
    }


    function Quit()
    {
        System.exit();
    }

}
