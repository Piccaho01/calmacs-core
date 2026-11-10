# agents-draft/ — PROPOSED agent definitions (NOT the originals)

⚠️ **These are drafts, reconstructed by Claude as proposals.** They are **not**
recovered from the earlier planning session and are **not** the real agent files
from the home PC's `~/.claude/agents/`.

## Why this folder exists
The canonical agent definitions live on the home PC and will be recovered when the
local session is back. Until then, these drafts let us move forward. Tomorrow:

1. Pull the real `~/.claude/agents/*.md` off the home PC.
2. **Diff** them against these drafts.
3. Keep what matches, discard guesses that don't, fill any gaps the originals missed.
4. Promote the reconciled set to the real `agents/` folder and delete this draft one.

## The crew (16) — proposed teams
- **Build team** (🟩): Batman, Martian Manhunter, Iron Man (+JARVIS), Deadpool, Doctor Strange, Spider-Man
- **Break team** (🟥): Doctor Doom, Ultron, Green Goblin, Loki, Venom
- **Ops / wildcard** (🟨): Alfred
- **Game-Dev division** (🎮): Nightcrawler (Art), Hal Jordan (World), Uatu (Lore), Rocket Raccoon (Systems)

## Proposed flow (consult-the-boss)
Task → **Batman** triages & assigns → assigned hero walks to the **boss (you)**,
confirms → does the work → **Doctor Doom** reviews before "done" → on failures,
**Venom** hardens/fixes. Break team (Ultron/Goblin) stress-tests on request.
Loki plays devil's advocate on big calls. Alfred keeps the board & artifacts tidy.

> Every `model:` field below is a placeholder (`inherit`) — set real models during reconciliation.
