# dashboard/ — Calmac's Core live office overlay

Everything needed to turn a fresh **Claude-Office** clone into **Calmac's Core**,
prepared from the cloud so the home-PC build is mostly copy-paste.

- **`SETUP-DASHBOARD.md`** — the step-by-step PC runbook. Start here.
- **`calmac-core-roster.json`** — single source of truth: all 16 crew + boss, with
  role, title, emoji, color, sprite base name, team and room/wing.
- **`office.config.json`** — boss config (Calmac); copy to the clone's project root.
- **`patches/AGENT_CONFIGS.additions.ts`** — paste block for `src/types.ts`.
- **`patches/ROLE_TO_CHAR.additions.ts`** — paste block for `src/config.ts`.
- **`patches/room-assignment.reference.ts`** — intended desk→room (wing) layout.

The patch blocks are generated from the roster — edit the roster, regenerate, don't
hand-edit the patches.

Related elsewhere in the repo:
- `agents-draft/` — the 16 agent definitions (→ `~/.claude/agents/`).
- `sprite-prompts.md` + `sprites/` — the character art pipeline.
- `core-protocol.md` + `CLAUDE.md` — the "call up the core" behavior.

> The live office runs **only on the home PC** (loopback by design). This folder is
> the build kit; running it is steps 7–8 of the runbook.
