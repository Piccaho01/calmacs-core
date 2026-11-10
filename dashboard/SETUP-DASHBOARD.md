# Standing up the Calmac's Core dashboard (home PC runbook)

The live office is a reskin of **Claude-Office / Agent Office** (W17ANT, MIT) — a
Vite + React + Express/WebSocket app that binds to `127.0.0.1` and visualizes your
Claude Code agents. It **must run on the home PC** (localhost-only by design); it
can't run from the cloud. Everything below is prepared in this repo (`dashboard/`,
`agents-draft/`, `sprite-prompts.md`) so this is mostly copy-paste.

> **Verified vs. flagged:** the config, sprite naming, boss wiring and the
> AGENT_CONFIGS / ROLE_TO_CHAR registries were read from the actual Claude-Office
> source, so those steps are exact. Steps marked **⚑** need a quick look at the
> live code on the PC (room-to-agent assignment, and new room art) — noted inline.

---

## 0. Prereqs (on the PC)
- Node 18+ and Python 3 with Pillow (`pip3 install Pillow`).
- Claude Code installed, with your account logged in.

## 1. Clone the base
```bash
git clone https://github.com/W17ant/Claude-Office.git calmacs-office
cd calmacs-office
npm install
```

## 2. Drop in the boss config
Copy `dashboard/office.config.json` from this repo to the **project root** (next to
`package.json`). This makes **Calmac** the boss (sprite `Calmac-1`, gold crown).
The server reads it at runtime — no rebuild needed to rename.

## 3. Register the crew (colors, emojis, titles, sprites)
Two files, both paste-in blocks generated from `dashboard/calmac-core-roster.json`:

- **`src/types.ts`** → paste `dashboard/patches/AGENT_CONFIGS.additions.ts` into the
  `AGENT_CONFIGS` object (keep the existing `boss` and `default` entries).
- **`src/config.ts`** → paste `dashboard/patches/ROLE_TO_CHAR.additions.ts` into the
  `ROLE_TO_CHAR` object.

Each `role` matches a Claude Code agent name (step 5), so when that agent spawns it
shows up as the right character with the right color/emoji.

## 4. Generate the sprites
For each finished 4-pose sheet in this repo's `sprites/` (and the rest once you've
generated them from `sprite-prompts.md`):

```bash
# sheet layout is [Front-Left][Rear-Right][Front-Right][Rear-Left] — matches our prompts
python3 scripts/split-character.py path/to/batman.png "batman-1"
# (the existing sheets are .webp — convert to .png first, e.g. with `cwebp`/Preview/any tool,
#  since split-character.py expects an image Pillow opens; webp usually works too)
```
Use the **exact sprite base names** from the roster (`batman-1`, `iron-man-1`,
`martian-manhunter-1`, … and `Calmac-1` for the boss). Output lands in
`public/sprites/characters/`. The boss needs `Calmac-1-front-left.png` etc.

> You have 7 sheets now (Batman, Iron Man, Martian Manhunter, Deadpool, Dr Strange,
> Dr Doom, Ultron). The other 9 + boss come from `sprite-prompts.md`. Agents without
> a sprite fall back to a default character, so you can start partial and fill in.

## 5. Install the agents
Copy the 16 definition files from this repo's `agents-draft/*.md` to the PC's
`~/.claude/agents/` (strip the `-DRAFT` framing when you're happy with them, and
**reconcile against any originals** if the PC still has them). The filename (e.g.
`batman.md` → agent `batman`) is the `role` the office matches.

## 6. Theme the wings  ⚑
Palette accents (per-agent colors, boss gold) are already set via steps 2–3. The
**room backgrounds** (`public/rooms/office-day.png`, etc.) are raster art, so the
full **Watchtower / The Lair / Central Core** reskin means new room art — a
Nightcrawler job, not a CSS toggle. Intended layout is in
`dashboard/patches/room-assignment.reference.ts`:
- **Watchtower** (hero wing) = `main-office` → Build team
- **The Lair** (villain wing) = `server-room` → Break team
- **Central Core** = `ceo-office` (boss) + `manager-office` (Alfred)
- **Game-Dev** = `meeting-room`

Assigning each agent's desk to its room is wired in the app's agent manager /
server — locate where `assignedRoom` is set and map by `role` using the reference
file. (This is the one integration point to confirm live.)

## 7. Hooks + run
```bash
./hooks/install-hooks.sh        # wires Claude Code hooks → the office (live agent spawns)
./scripts/start-office.sh       # starts server + UI on 127.0.0.1
```
Open the office URL it prints. Trigger a Claude Code task and watch the crew work.

## 8. Always-on + phone  ⚑
- **Autostart:** use the desktop app's launch-on-startup, or a Windows startup task
  running `start-office.sh`, so the office is up when the PC boots.
- **Phone/tablet:** watch via **Remote Control** into the PC. The office itself stays
  loopback-only — don't bind it to the LAN (the server refuses non-loopback on
  purpose; every route is open on localhost by design).

---

## The "call up the core" tie-in
`core-protocol.md` + the root `CLAUDE.md` make the crew talk in-character when you
say **"time to call up the core."** In the live office, those same agents spawn as
the on-screen characters — so the dashboard *shows* the room you're conversing with.

## Reconcile reminder
`agents-draft/` are proposals. If the home PC still holds real `~/.claude/agents/`
files, diff first and keep the originals where they differ.
