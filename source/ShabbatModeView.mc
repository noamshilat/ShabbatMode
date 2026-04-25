using Toybox.Graphics;
using Toybox.Lang;
using Toybox.System;
using Toybox.Time.Gregorian;
using Toybox.WatchUi;

class ShabbatModeView extends WatchUi.WatchFace {

    private var _inLowPower as Lang.Boolean = false;
    private var _shiftIndex as Lang.Number = 0;
    private const _SHIFTS = [ [0, 0], [1, 0], [0, 1], [-1, 0], [0, -1], [1, 1], [-1, -1] ];

    private var _greeting as WatchUi.BitmapResource?;
    private var _greetingDim as WatchUi.BitmapResource?;

    function initialize() {
        WatchFace.initialize();
    }

    function onLayout(dc as Graphics.Dc) as Void {
        _greeting = WatchUi.loadResource(Rez.Drawables.ShabbatShalom) as WatchUi.BitmapResource;
        _greetingDim = WatchUi.loadResource(Rez.Drawables.ShabbatShalomDim) as WatchUi.BitmapResource;
    }

    function onShow() as Void {
    }

    function onUpdate(dc as Graphics.Dc) as Void {
        var width = dc.getWidth();
        var height = dc.getHeight();
        var cx = width / 2;
        var cy = height / 2;

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();

        var offset = _SHIFTS[_shiftIndex];

        var timeString = formatTime();
        var timeFont = _inLowPower
            ? Graphics.FONT_NUMBER_MEDIUM
            : Graphics.FONT_NUMBER_THAI_HOT;
        var timeColor = _inLowPower
            ? Graphics.COLOR_LT_GRAY
            : Graphics.COLOR_WHITE;

        // Pull the time slightly above center so the greeting fits below
        var timeY = cy + offset[1] - (height * 0.06).toNumber();

        dc.setColor(timeColor, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            cx + offset[0],
            timeY,
            timeFont,
            timeString,
            Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
        );

        var bmp = _inLowPower ? _greetingDim : _greeting;
        if (bmp != null) {
            var bw = bmp.getWidth();
            var bh = bmp.getHeight();
            var bx = cx - bw / 2 + offset[0];
            var by = cy + (height * 0.18).toNumber() + offset[1] - bh / 2;
            dc.drawBitmap(bx, by, bmp);
        }
    }

    function onPartialUpdate(dc as Graphics.Dc) as Void {
        _shiftIndex = (_shiftIndex + 1) % _SHIFTS.size();
        onUpdate(dc);
    }

    function onEnterSleep() as Void {
        _inLowPower = true;
        WatchUi.requestUpdate();
    }

    function onExitSleep() as Void {
        _inLowPower = false;
        _shiftIndex = 0;
        WatchUi.requestUpdate();
    }

    function onHide() as Void {
    }

    private function formatTime() as Lang.String {
        var clock = System.getClockTime();
        var settings = System.getDeviceSettings();
        var hour = clock.hour;

        if (!settings.is24Hour) {
            hour = hour % 12;
            if (hour == 0) { hour = 12; }
        }

        return Lang.format("$1$:$2$", [
            hour.format("%02d"),
            clock.min.format("%02d")
        ]);
    }
}
