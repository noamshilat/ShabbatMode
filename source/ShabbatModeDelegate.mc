using Toybox.Lang;
using Toybox.WatchUi;

// Swallows every input event the SDK can deliver to a foreground app:
// physical buttons (back, menu, select, page up/down, mode), touch taps,
// touch swipes, and raw key events. Returning true stops the system from
// invoking the default behavior (open menu, exit app, scroll, etc.).
//
// The only input that cannot be blocked is the system-reserved long-press
// of the menu/back button — Garmin keeps that available so the user always
// has a guaranteed way to exit any app. That long-press is our intentional
// "unlock" gesture for the end of Shabbat.
class ShabbatModeDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onBack() as Lang.Boolean         { return true; }
    function onMenu() as Lang.Boolean         { return true; }
    function onSelect() as Lang.Boolean       { return true; }
    function onNextPage() as Lang.Boolean     { return true; }
    function onPreviousPage() as Lang.Boolean { return true; }
    function onNextMode() as Lang.Boolean     { return true; }
    function onPreviousMode() as Lang.Boolean { return true; }

    function onTap(clickEvent as WatchUi.ClickEvent) as Lang.Boolean       { return true; }
    function onHold(clickEvent as WatchUi.ClickEvent) as Lang.Boolean      { return true; }
    function onRelease(clickEvent as WatchUi.ClickEvent) as Lang.Boolean   { return true; }
    function onSwipe(swipeEvent as WatchUi.SwipeEvent) as Lang.Boolean     { return true; }

    function onKey(keyEvent as WatchUi.KeyEvent) as Lang.Boolean           { return true; }
    function onKeyPressed(keyEvent as WatchUi.KeyEvent) as Lang.Boolean    { return true; }
    function onKeyReleased(keyEvent as WatchUi.KeyEvent) as Lang.Boolean   { return true; }
}
