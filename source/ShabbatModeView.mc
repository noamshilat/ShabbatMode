using Toybox.Graphics;
using Toybox.Lang;
using Toybox.System;
using Toybox.Time.Gregorian;
using Toybox.WatchUi;

class ShabbatModeView extends WatchUi.WatchFace {

    private var _inLowPower as Lang.Boolean = false;
    // Pixel-shift offset for AOD burn-in mitigation. Cycles through a small
    // set of offsets so the lit pixels never sit on the same panel cells.
    private var _shiftIndex as Lang.Number = 0;
    private const _SHIFTS = [ [0, 0], [1, 0], [0, 1], [-1, 0], [0, -1], [1, 1], [-1, -1] ];

    function initialize() {
        WatchFace.initialize();
    }

    function onLayout(dc as Graphics.Dc) as Void {
    }

    function onShow() as Void {
    }

    function onUpdate(dc as Graphics.Dc) as Void {
        var width = dc.getWidth();
        var height = dc.getHeight();

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();

        var timeString = formatTime();
        var font = _inLowPower
            ? Graphics.FONT_NUMBER_MEDIUM
            : Graphics.FONT_NUMBER_THAI_HOT;

        var color = _inLowPower
            ? Graphics.COLOR_LT_GRAY
            : Graphics.COLOR_WHITE;

        var offset = _SHIFTS[_shiftIndex];
        var x = (width / 2) + offset[0];
        var y = (height / 2) + offset[1];

        dc.setColor(color, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            x,
            y,
            font,
            timeString,
            Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
        );
    }

    function onPartialUpdate(dc as Graphics.Dc) as Void {
        // Called once per minute in AOD low-power mode. Advance the
        // pixel-shift counter and let the system re-render via onUpdate.
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
