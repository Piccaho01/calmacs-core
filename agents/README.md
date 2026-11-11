# agents/ — the Calmac's Core crew (canonical)

The 16 crew members, finalized. This is the working set we use **from now on** — in
any Claude session on this repo, and (when the live office is stood up) as the
on-screen cast. Each file is a Claude Code agent definition: role, when it acts,
hand-offs, and a first-person **Voice** block.

The **convening layer** (the "time to call up the core" trigger, the routing flow,
and the voice signatures) lives in `../core-protocol.md`, wired in by `../CLAUDE.md`.

## The crew — teams
- **Build** (🟩): Batman, Martian Manhunter, Iron Man (+JARVIS), Deadpool, Doctor
  Strange, Spider-Man
- **Break** (🟥): Doctor Doom, Ultron, Green Goblin, Loki, Venom
- **Ops** (🟨): Alfred
- **Game-Dev** (🎮): Nightcrawler (Art), Hal Jordan (World), Uatu (Lore), Rocket
  Raccoon (Systems)

Boss: **Calmac** (you).

## Using them
- **In chat (any device, no PC needed):** say **"time to call up the core"** and the
  crew convene in-character; or summon one by name (*"Doom, review this"*).
- **On the home PC (live office):** copy these files to `~/.claude/agents/` so Claude
  Code spawns them as real subagents — see `../dashboard/SETUP-DASHBOARD.md`.

## Note on the old home-PC files
These were authored here and are now the source of truth. If the home PC resurfaces
with earlier `~/.claude/agents/` versions, they can be folded in — but that's an
optional merge, not a blocker. The core is finalized and usable as-is.
