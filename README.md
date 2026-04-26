# Shabbat Mode

A locked-down Garmin Connect IQ **device app** for Shabbat-observant Jewish users. When started from the activity menu, it shows only the time and a "🕯️ שבת שלום" greeting on a black background, blocks all touch and short button presses, keeps the screen at a fixed dim brightness, and refuses to display normally if the wrist heart-rate sensor or Bluetooth are still active. To exit, long-press the menu button.

**Targets:** Forerunner 265 (416×416 AMOLED, API 5.2), Fenix 8 47mm AMOLED (454×454, API 6.0).

> **Important:** Connect IQ does not let any third-party app disable hardware sensors, Bluetooth, or background activity tracking on its own. The user must enable Battery Saver and Airplane Mode manually before Shabbat. The app's sentinel screen catches it if they forget. See [docs/SETUP_GUIDE.md](docs/SETUP_GUIDE.md) (Hebrew) for the full pre/post-Shabbat checklist.

## Architecture

This is a **Device App** (`type="watch-app"`), not a Watch Face. The choice was made to gain capabilities that Watch Faces fundamentally cannot have:

- Block button presses and touch events via `BehaviorDelegate` returning `true`.
- Keep the screen on continuously without relying on the user's AOD setting or being affected by wrist-gesture wake.
- Lifecycle clearly bounded: user starts the activity Friday afternoon, exits Saturday night.

The app **does not** call `ActivityRecording.startRecording()` — no `.fit` file is created and no sensor data is logged.

## Build

### One-time setup

1. Install the **Connect IQ SDK Manager** from <https://developer.garmin.com/connect-iq/sdk/>. Install the latest SDK and the device profiles for **Forerunner 265** and **Fenix 8 47mm AMOLED**.
2. Install **VS Code** and the **Monkey C** extension (publisher: Garmin).
3. Install a JDK (any LTS, e.g. `brew install openjdk@21`).
4. Generate a 4096-bit RSA developer signing key (one-time):
   ```sh
   openssl genrsa -out developer_key.pem 4096
   openssl pkcs8 -topk8 -inform PEM -outform DER -in developer_key.pem -out developer_key.der -nocrypt
   rm developer_key.pem
   ```
   Keep `developer_key.der` out of git (already in `.gitignore`). Back it up — Garmin requires the same key for every future update.

### Build and simulate

```sh
# Per-device debug builds
monkeyc -f monkey.jungle -d fr265 -o bin/ShabbatMode-fr265.prg -y developer_key.der -w
monkeyc -f monkey.jungle -d fenix847mm -o bin/ShabbatMode-fenix847mm.prg -y developer_key.der -w

# Launch simulator and load (in two terminals or sequentially)
connectiq &
sleep 6
monkeydo bin/ShabbatMode-fr265.prg fr265
```

In the simulator, **Settings → Connection** lets you toggle the simulated phone connection. Toggle phone connection OFF to see the normal time + greeting view. Toggle it ON to see the sensor-sentinel red warning screen.

### Sideload to a real watch

```sh
# On the watch, USB-connect to the Mac. The watch shows up as a removable volume.
cp bin/ShabbatMode-fr265.prg /Volumes/GARMIN/GARMIN/Apps/
diskutil eject /Volumes/GARMIN
```

On the watch: open the activity list → if Shabbat Mode isn't there, **Add App** → Shabbat Mode. Press Start to launch.

### Build a signed release `.iq` for the Connect IQ Store

```sh
monkeyc -e -f monkey.jungle -o bin/ShabbatMode.iq -y developer_key.der -r -w
```

The `.iq` bundles all device builds. Upload at <https://apps.garmin.com> → Dashboard → Upload an app.

## Project layout

```
ShabbatMode/
├── manifest.xml                     type="watch-app", target devices, permissions=[]
├── monkey.jungle                    build config; per-device launcher icon paths
├── source/
│   ├── ShabbatModeApp.mc            AppBase entry point
│   ├── ShabbatModeView.mc           View: time + greeting + sensor sentinel
│   └── ShabbatModeDelegate.mc       BehaviorDelegate: swallows all input
├── resources/
│   ├── strings/strings.xml          English app name + About body
│   ├── settings/                    Read-only About page (visible in Connect IQ Mobile)
│   └── drawables/shabbat_shalom.png Bilingual greeting bitmap
├── resources-heb/strings/strings.xml Hebrew translations
├── resources-fr265/drawables/        60×60 candle launcher icon
├── resources-fenix847mm/drawables/   65×65 candle launcher icon
├── store_assets/                     Cover (500×500) and hero (1440×720) images
└── docs/
    ├── SETUP_GUIDE.md                Hebrew user manual (full pre/post Shabbat steps)
    ├── STORE_LISTING.md              Bilingual Connect IQ Store description copy
    └── privacy.html                  Bilingual privacy policy (hosted on GitHub Pages)
```

## TODO before resubmission

- [x] App type changed from watchface to watch-app.
- [x] Input blocking via BehaviorDelegate.
- [x] Sensor sentinel for wrist HR and phone connection.
- [x] User guide rewritten for Device App flow.
- [x] Store listing copy rewritten.
- [ ] Take new simulator screenshots showing the Device App version (the previous shots were of the watch face).
- [ ] Build new signed `.iq` and upload as a v2 update to the existing Connect IQ Store listing.

## Notes for future updates

- Bump `version` in the `iq:application` element of `manifest.xml` for every store submission.
- Reuse the same `developer_key.der` for every update.
- Test the sentinel screen by toggling simulator settings: Settings → Connection (phone connected on/off), Settings → User → Heart Rate (different values).
