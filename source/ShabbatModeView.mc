using Toybox.Activity;
using Toybox.Graphics;
using Toybox.Lang;
using Toybox.System;
using Toybox.Timer;
using Toybox.WatchUi;

class ShabbatModeView extends WatchUi.View {

    private var _greeting as WatchUi.BitmapResource?;
    private var _timer as Timer.Timer?;

    function initialize() {
        View.initialize();
    }

    function onLayout(dc as Graphics.Dc) as Void {
        _greeting = WatchUi.loadResource(Rez.Drawables.ShabbatShalom) as WatchUi.BitmapResource;
    }

    function onShow() as Void {
        _timer = new Timer.Timer();
        _timer.start(method(:onTick), 60 * 1000, true);
    }

    function onHide() as Void {
        if (_timer != null) {
            _timer.stop();
            _timer = null;
        }
    }

    function onTick() as Void {
        WatchUi.requestUpdate();
    }

    function onUpdate(dc as Graphics.Dc) as Void {
        var width = dc.getWidth();
        var height = dc.getHeight();
        var cx = width / 2;
        var cy = height / 2;

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();

        var hrActive = isHeartRateActive();
        var phoneActive = isPhoneConnected();

        if (hrActive || phoneActive) {
            drawSensorWarning(dc, cx, cy, width, height, hrActive, phoneActive);
            return;
        }

        drawTime(dc, cx, cy, height);
        drawGreeting(dc, cx, cy, height);
    }

    private function isHeartRateActive() as Lang.Boolean {
        var info = Activity.getActivityInfo();
        return info != null && info.currentHeartRate != null;
    }

    private function isPhoneConnected() as Lang.Boolean {
        return System.getDeviceSettings().phoneConnected;
    }

    private function drawTime(dc as Graphics.Dc, cx as Lang.Number, cy as Lang.Number, height as Lang.Number) as Void {
        var timeString = formatTime();
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            cx,
            cy - (height * 0.06).toNumber(),
            Graphics.FONT_NUMBER_THAI_HOT,
            timeString,
            Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
        );
    }

    private function drawGreeting(dc as Graphics.Dc, cx as Lang.Number, cy as Lang.Number, height as Lang.Number) as Void {
        if (_greeting == null) { return; }
        var bw = _greeting.getWidth();
        var bh = _greeting.getHeight();
        var bx = cx - bw / 2;
        var by = cy + (height * 0.18).toNumber() - bh / 2;
        dc.drawBitmap(bx, by, _greeting);
    }

    // Sentinel screen: shown when wrist HR is active or phone is still
    // connected. Refuses to show the time view until the user turns
    // those off in System Settings.
    private function drawSensorWarning(
        dc as Graphics.Dc,
        cx as Lang.Number,
        cy as Lang.Number,
        width as Lang.Number,
        height as Lang.Number,
        hrActive as Lang.Boolean,
        phoneActive as Lang.Boolean
    ) as Void {
        // Title bar
        dc.setColor(0xFF4444, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            cx,
            cy - (height * 0.28).toNumber(),
            Graphics.FONT_MEDIUM,
            "Disable in Settings:",
            Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
        );

        var y = cy - (height * 0.10).toNumber();
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        if (hrActive) {
            dc.drawText(cx, y, Graphics.FONT_SMALL, "- Wrist Heart Rate",
                        Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
            y += (height * 0.07).toNumber();
        }
        if (phoneActive) {
            dc.drawText(cx, y, Graphics.FONT_SMALL, "- Bluetooth (Airplane Mode)",
                        Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
            y += (height * 0.07).toNumber();
        }

        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            cx,
            cy + (height * 0.22).toNumber(),
            Graphics.FONT_TINY,
            "Settings then System",
            Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
        );
        dc.drawText(
            cx,
            cy + (height * 0.30).toNumber(),
            Graphics.FONT_TINY,
            "or Connectivity",
            Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
        );
    }

    private function formatTime() as Lang.String {
        var clock = System.getClockTime();
        var hour = clock.hour;

        if (!System.getDeviceSettings().is24Hour) {
            hour = hour % 12;
            if (hour == 0) { hour = 12; }
        }

        return Lang.format("$1$:$2$", [
            hour.format("%02d"),
            clock.min.format("%02d")
        ]);
    }
}
