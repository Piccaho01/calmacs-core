# calmacs-core

**Calmac's Core**: a crew of 20 characters who work for the boss, and the HQ they
live in.

## Use it

- **HQ dashboard** (iPhone, tablet, computer): https://claude.ai/artifact/8ZMUzbXZgyBPPWcNSFTPRP
  Say "time to call up the core" or a name and the crew answers. Source in `hq/`.
- **Claude chat**: paste `core-bootstrap.md` into claude.ai personal preferences once.
- **Claude Code**: `bash install/install-core.sh` once per computer (and
  `bash install/enable-auto-update.sh` to keep it current). Details in
  `install/README.md`.
- **Mobile reference site** (plan, sprites, copy page): https://Piccaho01.github.io/calmacs-core/

## What's in here

| Path | What |
|---|---|
| `agents/` | The 20 crew definitions |
| `core-protocol.md` | How the crew is summoned, routed and voiced |
| `hq/` | The HQ dashboard (published as a Claude artifact) |
| `install/` | Global install and self-update for Claude Code |
| `core-bootstrap.md` | Crew instructions for Claude chat |
| `sprites/`, `sprite-prompts.md` | Character art and prompts for the rest |
| `dashboard/` | Claude-Office overlay kit (on hold, needs a computer) |
| `index.html`, `plan.html`, `sprites.html`, `core.html` | GitHub Pages site |
