# Wedding Invitation Website — Мгер & Елизавета

## Project Overview

A single-page, bilingual (Russian/Armenian) wedding invitation website for **Мгер & Елизавета**, celebrating their wedding on **August 6, 2026** in Armenia.

The site is a self-contained HTML file with embedded CSS and JavaScript, featuring:
- Elegant olive/cream color scheme with romantic styling
- Bilingual support (RU/ՀՅ) with live language switching
- Wedding day timeline/schedule
- Venue information (Church & Restaurant)
- Live countdown timer to the wedding date
- RSVP form with Telegram integration
- Decorative particle effects (falling petals)

## File Structure

```
mger-elizaveta/
├── index.html           # Main website (HTML + CSS + JS)
├── assets/
│   └── images/
│       ├── favicon.svg    # Site icon
│       ├── pattern-01.svg # Decorative patterns
│       ├── pattern-02.svg
│       ├── pattern-03.svg
│       ├── pattern-04.svg
│       ├── pattern-05.svg
│       └── pattern-06.svg
├── tools/
│   └── setup/             # Setup scripts
├── docs/
│   ├── AGENTS.md          # Development guidelines
│   ├── QWEN.md            # This file
│   ├── _pgbackup/         # Page backups
│   └── _pginfo/           # Page info
└── vercel.json            # Vercel configuration
```

## Technologies

- **HTML5** — Semantic structure
- **CSS3** — Custom styling with CSS variables, animations, gradients
- **Vanilla JavaScript** — No frameworks; all interactivity is custom-coded
- **SVG** — Inline vector graphics for decorations
- **Google Fonts** — Playfair Display, Cormorant Garamond, Great Vibes, Jost, Montserrat, Noto Serif Armenian

## Key Features

### 1. Language Switcher
- Toggle between Russian (RU) and Armenian (ՀՅ)
- All text elements use `data-ru` and `data-hy` attributes
- Smooth fade transition when switching languages
- Font family switches to Noto Serif Armenian for Armenian text

### 2. Visual Effects
- **Petal Canvas** — Floating petal particles in the background (WebGL canvas)
- **Cursor Trail** — Custom cursor with golden dot + ring, leaving heart/sparkle/petal particles on movement
- **Scroll Reveal** — Sections fade in as user scrolls
- **Photo Hover** — SVG illustration zooms slightly on hover

### 3. Sections
| Section | Description |
|---------|-------------|
| Hero | Couple names, wedding date, ornamental SVG header |
| Story | Brief love story introduction |
| Photo | Full-width SVG illustration of bride & groom |
| Timeline | 4-event schedule (14:00–18:00) |
| Venue | Two location cards (Church & Restaurant) |
| Countdown | Live days/hours/minutes/seconds counter |
| RSVP | Guest confirmation form |
| Footer | Simple credit line |

### 4. RSVP Form → Telegram Integration
The form sends responses to a Telegram bot. To enable:

1. Create a bot via **@BotFather** on Telegram → get `BOT_TOKEN`
2. Send `/start` to your bot, then visit:
   ```
   https://api.telegram.org/bot<YOUR_TOKEN>/getUpdates
   ```
3. Extract `chat_id` from the response
4. Update these constants in the `<script>` section:
   ```javascript
   const BOT_TOKEN = 'YOUR_BOT_TOKEN';
   const CHAT_ID = 'YOUR_CHAT_ID';
   ```

## Building & Running

No build process required. This is a static HTML file.

### To Preview Locally
1. Open `index.html` directly in a browser, or
2. Serve via a local server:
   ```bash
   # Python 3
   python -m http.server 8000

   # Node.js (npx)
   npx serve .

   # PHP
   php -S localhost:8000
   ```
3. Navigate to `http://localhost:8000/`

### To Deploy
Upload the project to any static hosting:
- GitHub Pages
- Netlify / Vercel (configured via `vercel.json`)
- Traditional web hosting
- Yandex.Disk public folder

## Customization Guide

### Change Wedding Date
Update both the countdown target and display:
```javascript
// In updateCountdown():
const diff = Math.max(new Date('2026-08-06T15:00:00') - new Date(), 0);
```
```html
<!-- In hero-date element -->
<p class="hero-date" data-ru="6 Августа · 2026 · Армения" ...>
```

### Modify Colors
Edit CSS variables in `:root`:
```css
:root {
  --ivory: #f9f4ec;
  --cream: #f0e8d8;
  --gold: #b8965a;
  --gold-light: #d4af70;
  --gold-pale: #e8d5a3;
  --dark: #2a1f14;
  --text: #3d2f1e;
  --text-light: #7a6248;
}
```

### Add/Change Timeline Events
Edit `.timeline-grid` section:
```html
<div class="timeline-item">
  <div class="t-time">14:00</div>
  <div class="t-label" data-ru="..." data-hy="...">...</div>
  <div class="t-desc" data-ru="..." data-hy="...">...</div>
</div>
```

### Update Venue Information
Edit `.venue-cards` section with new addresses.

### Telegram Bot Link
Update the floating Telegram button href:
```html
<a class="tg-float" href="https://t.me/YOUR_BOT_USERNAME" ...>
```

## Development Conventions

- **Naming**: BEM-inspired class names (`.section-title`, `.timeline-item`, `.venue-card`)
- **Translations**: All translatable text uses `.t` class with `data-ru`/`data-hy` attributes
- **Animations**: CSS keyframes for UI animations; JS for particle effects
- **Responsive**: Mobile-first breakpoints at 600px width
- **Accessibility**: Semantic HTML, proper labels for form inputs

## Browser Support

Modern browsers with ES6+ support:
- Chrome 60+
- Firefox 55+
- Safari 12+
- Edge 79+

Touch devices automatically disable the custom cursor trail.

## Credits

- Fonts: Google Fonts (Cormorant Garamond, EB Garamond, Montserrat, Noto Serif Armenian)
- Design: Custom SVG illustration of bride & groom
- Created with love ❤️
