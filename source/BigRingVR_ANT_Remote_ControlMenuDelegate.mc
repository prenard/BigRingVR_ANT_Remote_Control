using Toybox.Application as App;
using Toybox.WatchUi as Ui;
using Toybox.System as Sys;

class BigRingVR_ANT_Remote_ControlMenuDelegate extends Ui.MenuInputDelegate
{

	var My_App;

    function initialize()
    {
        MenuInputDelegate.initialize();

        My_App = App.getApp();
    }

    function onMenuItem(item)
    {
        if (item == :item_00)
        {
           	//Sys.println("item 00");
            //My_App.my_ANT_Generic_CTRL.Send_Command(36);
            My_App.SendAntCommandLap();
        }
        else if (item == :item_01)
        {
            My_App.SendAntCommandFullScreen();
        }
        else if (item == :item_02)
        {
            My_App.SendAntCommandScreenShoot();
        }
        else if (item == :item_03)
        {
            My_App.SendAntCommandDashBoardDisplay();
        }
        else if (item == :item_04)
        {
            My_App.SendAntCommandProfileZoom();
        }
        else if (item == :item_99)
        {
            My_App.Quit();
        }

    }

}