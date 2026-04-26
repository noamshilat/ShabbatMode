# Connect IQ Store Listing Copy

Use these texts when uploading the app at apps.garmin.com developer dashboard. The app type is **Device App** (Watch App), not Watch Face.

---

## App name
Shabbat Mode

## Category
Utilities (or "Tools / Activities" — the dashboard's closest fit for a Device App that's not a sport)

## Tags / keywords
shabbat, sabbath, jewish, judaism, halacha, minimalist, hebrew, shabbos, lock, kosher

## Short description (≤ 75 chars)
A locked-down minimal display for Shabbat. Time only. Buttons blocked.

## Long description — English

Shabbat Mode is a full-screen app (not a watch face) that turns your Garmin into the simplest possible time-only display for Shabbat. Start it from the activity menu before Shabbat begins; it shows the current time and a "Shabbat Shalom" greeting on a black background, and blocks every button and touch gesture except the system long-press exit. To leave the app at the end of Shabbat, long-press the menu button.

What it does:
- Displays only the current time and a "Shabbat Shalom" greeting with a small candle.
- Blocks taps, swipes, and short button presses programmatically.
- Keeps the display in a fixed dim state. No auto-brightness changes, no wrist-gesture wake (because the screen never goes dark while the app runs).
- Records nothing. No .fit file is created, no sensor data is logged, no network access.
- Sentinel screen: if the wrist heart-rate sensor is still active, or if Bluetooth is still connected, the app shows a red warning instead of the time and tells you exactly which setting to change.
- Zero permissions requested.

What it does NOT do:
The Connect IQ platform does not allow third-party apps to disable hardware sensors, Bluetooth, or background activity tracking. You disable those in the device Settings before Shabbat. The setup is one minute the first time, then 30 seconds every following Friday because Garmin remembers the configuration.

Before Shabbat:
1. Charge the watch fully.
2. Settings - System - Power Manager - Battery Saver - Edit Current. Enable: Disconnect Phone, Disable Activity Tracking, Disable Wrist HR, Disable Pulse Ox, Disable Bluetooth, Disable Wi-Fi. Leave "Disable Watch Face" unchecked.
3. Turn Battery Saver ON.
4. Settings - Connectivity - Airplane Mode: ON.
5. Settings - Sound and Vibration - Do Not Disturb: ON.
6. Press the activity-start button, find "Shabbat Mode" in the activity list, press Start.

After Havdalah:
1. Long-press the menu button (about 2 seconds) to exit Shabbat Mode. If asked to save, choose Discard.
2. Airplane Mode: OFF.
3. Do Not Disturb: OFF.
4. Battery Saver: OFF.
5. Open Garmin Connect on your phone to sync.

Result: heart rate, steps, sleep, notifications, Bluetooth, and your normal watch face all resume exactly as before. The Battery Saver checkbox configuration is saved, so next Friday only steps 3, 4, 5, 6 are needed.

Halachic note: This app is a software tool, not a Halachic ruling. Consult your Rav about whether and how to wear a smartwatch on Shabbat. Some hardware sensors (accelerometer, gyroscope, magnetometer, barometer, thermometer) cannot be disabled by any setting or app on any smartwatch — they remain electrically active as long as the watch has power.

Privacy: The app does not collect, store, or transmit any user data.

Battery: Approximately 20% per Shabbat (the screen stays on continuously).

---

## Long description — עברית

Shabbat Mode היא אפליקציית מסך מלא (לא פני שעון) שהופכת את שעון הגרמין שלכם לתצוגה הכי פשוטה אפשרית בשבת. מפעילים אותה מתפריט הפעילויות לפני כניסת שבת; היא מציגה את השעה הנוכחית וברכת "שבת שלום" על רקע שחור, וחוסמת כל כפתור ומגע פרט ללחיצה ארוכה ליציאה. כדי לצאת מהאפליקציה בסוף השבת, לחיצה ארוכה על כפתור התפריט.

מה האפליקציה עושה:
- מציגה רק את השעה הנוכחית וברכת "שבת שלום" עם נר קטן.
- חוסמת לחיצות, החלקות ולחיצות קצרות באופן תוכנתי.
- שומרת על המסך בבהירות נמוכה קבועה. אין שינוי בהירות אוטומטי, אין הארת מסך בעקבות תנועת היד (המסך נשאר דולק כל הזמן).
- לא מקליטה כלום. לא נוצר קובץ .fit, לא נשמרים נתוני חיישנים, אין גישה לרשת.
- מסך מוודא: אם חיישן הדופק עדיין פעיל או שהבלוטות' עדיין מחובר, האפליקציה תציג מסך אדום אזהרה במקום השעה ותגיד לכם בדיוק איזו הגדרה לשנות.
- ללא הרשאות.

מה האפליקציה לא עושה:
פלטפורמת Connect IQ לא מאפשרת לאפליקציות צד שלישי לכבות חיישנים, Bluetooth או מעקב פעילות. את אלה אתם מכבים בהגדרות לפני שבת. ההגדרה הראשונה לוקחת דקה; כל יום שישי הבא, רק 30 שניות, כי Garmin זוכר את הקונפיגורציה.

לפני שבת:
1. טעינה מלאה של השעון.
2. Settings - System - Power Manager - Battery Saver - Edit Current. סמנו: Disconnect Phone, Disable Activity Tracking, Disable Wrist HR, Disable Pulse Ox, Disable Bluetooth, Disable Wi-Fi. השאירו "Disable Watch Face" לא מסומן.
3. הפעילו Battery Saver: ON.
4. Settings - Connectivity - Airplane Mode: ON.
5. Settings - Sound and Vibration - Do Not Disturb: ON.
6. לחצו על כפתור הפעלת פעילות, מצאו "Shabbat Mode" ברשימה, לחצו Start.

במוצאי שבת:
1. לחיצה ארוכה (כ-2 שניות) על כפתור התפריט כדי לצאת. אם נשאלים על שמירה, בחרו Discard.
2. Airplane Mode: OFF.
3. Do Not Disturb: OFF.
4. Battery Saver: OFF.
5. פתחו Garmin Connect לסנכרון.

תוצאה: דופק, צעדים, שינה, התראות, Bluetooth ופני השעון הרגילות שלכם כולם חוזרים בדיוק כמו שהיו. הקונפיגורציה של Battery Saver נשמרת, אז ביום שישי הבא רק שלבים 3, 4, 5, 6 דרושים.

הסתייגות הלכתית: האפליקציה היא כלי תוכנה ולא פסק הלכה. היוועצו ברב לגבי השאלה האם וכיצד מותר לחבוש שעון חכם בשבת. חיישנים פיזיים מסוימים (חיישן האצה, גיירוסקופ, מצפן, ברומטר, חיישן חום) אינם ניתנים לכיבוי באמצעות הגדרות או אפליקציה בשום שעון חכם — הם פעילים חשמלית כל עוד יש לשעון מתח.

פרטיות: האפליקציה לא אוספת, שומרת או משדרת נתוני משתמש.

צריכת סוללה: בערך 20% בשבת אחת (המסך דולק ברציפות).

---

## Pricing
**Free.**

## Support email
noamshilat11@gmail.com

## Privacy policy URL
https://noamshilat.github.io/ShabbatMode/privacy.html

## Source code URL
https://github.com/noamshilat/ShabbatMode

## Screenshots
Capture from the simulator while the app is running:
1. Main screen — time + 🕯️ שבת שלום on black background. Recommended time on the clock: 18:42.
2. Sentinel screen — toggle the simulator's "phone connected" or sensor data on, capture the red warning screen. Optional but useful to show users what the safety check looks like.

One of each, per device (fr265 + fenix847mm) = 2 to 4 screenshots total.

## Companion App / Hardware / ANT+ / Regional limits
All No / blank.
