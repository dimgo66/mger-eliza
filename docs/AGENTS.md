# AGENTS.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Project Overview

Single-page bilingual (Russian/Armenian) wedding invitation website. Self-contained HTML file with embedded CSS and JavaScript. No build process required.

## Project Structure

```
mger-elizaveta/
├── index.html           # Main website (all code)
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
│   └── setup/
│       ├── push.bat
│       ├── setup-git.bat
│       └── setup-git.ps1
├── docs/
│   ├── AGENTS.md        # This file
│   ├── QWEN.md          # Extended documentation (in Russian)
│   ├── _pgbackup/       # Page backups
│   └── _pginfo/         # Page info
└── vercel.json          # Vercel configuration
```

## Commands

### Local Development
```bash
# Python 3
python -m http.server 8000

# Node.js
npx serve .

# PHP
php -S localhost:8000
```
Then open `http://localhost:8000/`.

### Deployment
Push to main branch - Vercel auto-deploys via `vercel.json` rewrites.

## Architecture

### Single-File Structure
All code is in `index.html`:
- `<style>` — All CSS with CSS variables for theming
- `<script>` — All JavaScript at the bottom
- Inline SVG graphics for decorations

### Key CSS Patterns
- Color scheme via CSS variables in `:root` (olive, cream, gold tones)
- BEM-inspired class naming: `.section-title`, `.timeline-item`, `.venue-card`
- Responsive breakpoint at 600px (mobile-first)
- `.t` class marks all translatable text elements

### JavaScript Functions
- **Language switching**: Toggle between RU/ՀՅ via `data-ru`/`data-hy` attributes
- **Countdown timer**: `updateCountdown()` targeting `2026-08-06T15:00:00`
- **RSVP form**: Submits to Telegram bot via `BOT_TOKEN` and `CHAT_ID` constants
- **Canvas effects**: Petal particles on `#petal-canvas`

### Bilingual Text Pattern
All translatable text uses this pattern:
```html
<span class="t" data-ru="Русский текст" data-hy="Հայերեն տեքստ">Русский текст</span>
```
Font switches to `Noto Serif Armenian` when Armenian language is active via `[data-lang="hy"]` selector.

## Configuration

### Telegram Bot Setup
Edit constants in `<script>` section:
```javascript
const BOT_TOKEN = 'YOUR_BOT_TOKEN';
const CHAT_ID = 'YOUR_CHAT_ID';
```

### Wedding Details
- Date: August 6, 2026 — update in `updateCountdown()` and hero section
- Venues: Edit `.vcard` elements in location section
- Timeline: Modify `.prog-item` elements

## Files

- `index.html` — Main website (all code)
- `vercel.json` — URL rewrites config
- `assets/images/favicon.svg` — Site icon
- `assets/images/pattern-*.svg` — Decorative pattern backgrounds
- `tools/setup/` — Setup scripts for Git and deployment
- `docs/` — Documentation and backups