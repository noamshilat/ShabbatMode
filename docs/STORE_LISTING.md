# Connect IQ Store Listing Copy

Use these texts when uploading the app at apps.garmin.com developer dashboard.

---

## App name
Shabbat Mode

## Category
Watch Face

## Tags / keywords
shabbat, sabbath, jewish, judaism, halacha, minimalist, time, clock, hebrew, shabbos

## Short description (≤ 75 chars)
A minimalist watch face for Shabbat. Shows only the time. Black background.

## Long description — English
**Shabbat Mode** is a minimalist watch face for Shabbat-observant Jewish users.

When this watch face is active you see only the current time, on a pure black background, with a small "Shabbat Shalom 🕯️" greeting below it. No date, no steps, no heart rate, no notifications, no complications.

### What it does
- Replaces your weekday watch face with the most minimal possible display.
- Always-On Display compliant: dimmed text and per-minute pixel-shift to protect AMOLED panels from burn-in.
- Zero permissions requested. The app does not access your heart rate, location, activity, or any sensor.

### What it does NOT do
Garmin's Connect IQ platform does not allow third-party apps to disable hardware sensors, Bluetooth, or background activity tracking. **You** must do that manually using your watch's built-in Battery Saver and Airplane Mode before Shabbat begins.

The app ships with a complete step-by-step guide (in English and Hebrew) showing exactly which checkboxes to enable, in what order, and how to undo it all after Havdalah. Read the guide once and the routine takes about a minute every Friday.

### How to use
**Before Shabbat:**
1. Charge the watch.
2. Switch the active watch face to Shabbat Mode.
3. Settings → System → Power Manager → Battery Saver → Edit Current. Enable: Disconnect Phone, Disable Activity Tracking, Disable Wrist HR, Disable Pulse Ox, Disable Bluetooth, Disable Wi-Fi. Leave "Disable Watch Face" unchecked. Turn Battery Saver ON.
4. Settings → Connectivity → Airplane Mode: ON.
5. Settings → Sound &amp; Vibration → Do Not Disturb: ON.

**After Havdalah:** reverse the steps in order — Airplane Mode OFF, DND OFF, Battery Saver OFF, switch back to your normal watch face, open Garmin Connect on your phone to sync.

### Halachic note
This app is a software tool, not a Halachic ruling. Consult your Rav about whether and how to wear a smartwatch on Shabbat.

### Supported devices
- Forerunner 265
- Fenix 8 AMOLED 47mm

More devices may be added based on community feedback.

### Privacy
The app does not collect, store, or transmit any user data. It requests zero permissions. Source code is available on request.

---

## Long description — עברית
**Shabbat Mode** הן פני שעון מינימליסטיות לשומרי שבת.

כאשר פני השעון פעילות, רואים רק את השעה הנוכחית על רקע שחור, עם ברכת "שבת שלום 🕯️" קטנה מתחת. ללא תאריך, ללא צעדים, ללא דופק, ללא התראות, ללא וויג'טים.

### מה האפליקציה עושה
- מחליפה את פני השעון של ימי החול בתצוגה הכי מינימלית אפשרית.
- תואמת מצב Always-On Display: טקסט מעומעם והזזת פיקסלים פעם בדקה כדי להגן על מסכי AMOLED מהיצרבות.
- ללא הרשאות. האפליקציה לא ניגשת לדופק, מיקום, פעילות או חיישן כלשהו.

### מה האפליקציה **לא** עושה
פלטפורמת Connect IQ של גרמין לא מאפשרת לאפליקציות צד שלישי לכבות חיישנים, Bluetooth או מעקב פעילות ברקע. **אתם** צריכים לעשות את זה ידנית באמצעות מצב חיסכון בסוללה ומצב טיסה של השעון, לפני כניסת השבת.

האפליקציה כוללת מדריך מלא (באנגלית ובעברית) שמראה בדיוק אילו תיבות לסמן, באיזה סדר, ואיך לבטל הכל במוצאי שבת. קוראים את המדריך פעם אחת, ומאז השגרה לוקחת כדקה כל יום שישי.

### איך להשתמש
**לפני שבת:**
1. טעינה מלאה של השעון.
2. החליפו לפני השעון "Shabbat Mode".
3. Settings ← System ← Power Manager ← Battery Saver ← Edit Current. סמנו: Disconnect Phone, Disable Activity Tracking, Disable Wrist HR, Disable Pulse Ox, Disable Bluetooth, Disable Wi-Fi. השאירו את "Disable Watch Face" לא מסומן. הפעילו Battery Saver.
4. Settings ← Connectivity ← Airplane Mode: ON.
5. Settings ← Sound &amp; Vibration ← Do Not Disturb: ON.

**במוצאי שבת:** בצעו את הצעדים בסדר הפוך — Airplane Mode OFF, DND OFF, Battery Saver OFF, חזרו לפני השעון הרגילות, פתחו את Garmin Connect בטלפון לסנכרון.

### הסתייגות הלכתית
האפליקציה כלי תוכנה, לא פסק הלכה. היוועצו ברב לגבי השאלה האם וכיצד מותר לחבוש שעון חכם בשבת.

### מכשירים נתמכים
- Forerunner 265
- Fenix 8 AMOLED 47 מ"מ

ייתכן שמכשירים נוספים יתווספו על פי משוב מהקהילה.

### פרטיות
האפליקציה לא אוספת, שומרת או משדרת נתוני משתמש. ללא הרשאות.

---

## Pricing
**Free.** Recommended for v1 — maximizes adoption, removes a friction point in Garmin's review process, and aligns with the spirit of the app (a service to the community, not a product).

## Support email / URL
TODO — set this up before submission. Options:
- A simple Gmail alias (e.g., `shabbatmode.garmin@gmail.com`).
- A GitHub repo with an issues tab linked from the listing.

## Privacy policy URL
Required by Garmin even though we collect nothing. A single-page static page with the text:

> Shabbat Mode does not collect, store, or transmit any user data. It requests zero permissions and operates entirely on-device.

Host it on GitHub Pages, Netlify, or any free static host before submission.

## Screenshots
Garmin requires at least one screenshot per supported device. Capture from the Connect IQ Simulator:
- **Simulator menu → File → Capture Screenshot** while the watch face is showing a representative time (e.g., 18:42 — looks clean visually).
- One screenshot per device: `screenshot-fr265.png`, `screenshot-fenix847mm.png`.
- Recommended: also a "with the candle visible" screenshot, both in active mode and AOD mode.
