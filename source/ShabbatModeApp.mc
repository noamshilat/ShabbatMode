using Toybox.Application;
using Toybox.WatchUi;

class ShabbatModeApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    function onStart(state) {
    }

    function onStop(state) {
    }

    function getInitialView() {
        return [ new ShabbatModeView(), new ShabbatModeDelegate() ];
    }
}
