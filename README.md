# Shabbat Mode

A minimalist Garmin Connect IQ watch face for Shabbat-observant Jewish users. Displays only the current time on a black background. No complications, no notifications, no telemetry.

**Targets:** Forerunner 265 (416×416 AMOLED, API 5.2), Fenix 8 47mm AMOLED (454×454, API 6.0).

> **Important:** A Connect IQ watch face cannot disable the watch's hardware sensors (HR, steps, sleep) or radios (Bluetooth, Wi-Fi) on its own — Garmin does not expose APIs for this. The user must enable Battery Saver and Airplane Mode manually before Shabbat. See [docs/SETUP_GUIDE.md](docs/SETUP_GUIDE.md).

## Build

### One-time setup

1. Install the **Connect IQ SDK Manager** from <https://developer.garmin.com/connect-iq/sdk/>.
2. Open the SDK Manager, install the latest SDK and the device profiles for **Forerunner 265** and **Fenix 8 47mm AMOLED**.
3. Install **VS Code** and the **Monkey C** extension (publisher: Garmin).
4. Install a JDK (any LTS, e.g. `brew install openjdk@21`).
5. Generate a developer signing key (one-time, never lose it):
   ```sh
   monkeyc --generate-key -o developer_key.der
   ```
   Keep `developer_key.der` out of git (already in `.gitignore`). Back it up somewhere safe — Garmin requires the same key for every future update.

### Verify device IDs

The IDs in `manifest.xml` (`forerunner265`, `fenix847mm`) must match the IDs your installed SDK uses. After installing the device profiles, check:

```
~/Library/Application Support/Garmin/ConnectIQ/Devices/
```

Each subfolder name is a device ID. Update `manifest.xml` if they differ.

### Build & simulate

In VS Code:

- `Cmd+Shift+P` → **Monkey C: Build for Device** → pick the target.
- `Cmd+Shift+P` → **Monkey C: Run** → launches the simulator. Use the simulator menu to toggle Always-On Display and 12/24h.

### Sideload to a real watch

1. Plug the watch in via USB.
2. Run **Monkey C: Build for Device** to produce `bin/ShabbatMode.prg`.
3. Copy `ShabbatMode.prg` to `GARMIN/Apps/` on the mounted watch volume.
4. Eject. On the watch, long-press the face → Edit Watch Face → pick Shabbat Mode.

## Submit to Connect IQ Store

1. `Cmd+Shift+P` → **Monkey C: Export Project** → produces a signed `.iq` file.
2. Sign in to <https://apps.garmin.com> with your Garmin developer account (free, you must be 18+).
3. Dashboard → **Upload App** → select the `.iq` file.
4. Fill in metadata: name, category=Watch Face, description (paste the setup guide), screenshots, privacy URL, support email.
5. Submit. Garmin manual review typically takes a few business days to ~2 weeks.

For each subsequent update: bump the `version` attribute in `manifest.xml`, rebuild, re-export, and upload.

## Project layout

```
ShabbatMode/
├── manifest.xml            App metadata, target devices, permissions (empty)
├── monkey.jungle           Build config
├── source/
│   ├── ShabbatModeApp.mc   AppBase entry point
│   └── ShabbatModeView.mc  WatchFace: onUpdate + onPartialUpdate (AOD)
├── resources/
│   ├── strings/strings.xml English strings
│   ├── settings/           Read-only "About" page (setup checklist)
│   └── drawables/          Launcher icon reference
├── resources-heb/          Hebrew translations
├── resources-launcher/     Store listing icon (TODO: add launcher_icon.png)
└── docs/
    └── SETUP_GUIDE.md      Pre-Shabbat checklist for users
```

## TODO before submission

- [x] Per-device launcher icons (60×60 fr265, 65×65 fenix847mm).
- [x] Verify device IDs in `manifest.xml` against installed SDK.
- [x] Connect IQ Store description (English + Hebrew) — see `docs/STORE_LISTING.md`.
- [ ] Take simulator screenshots: simulator menu → File → Capture Screenshot, one per device.
- [ ] Set up support email + privacy policy URL (see `docs/STORE_LISTING.md`).
- [ ] Real-device testing on at least one of the two target watches.
- [ ] Submit to Connect IQ Store.
