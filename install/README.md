# install/ — make the crew work EVERYWHERE

The crew shouldn't live in one repo. Here's how to make **"time to call up the core"**
(and summoning agents by name) work across any session. There are two session types,
so two one-time setups:

---

## A) Every Claude Code session, any repo (one command)

Run this once on each machine where you use Claude Code:

```bash
# from a clone of this repo
bash install/install-core.sh
```

It installs, into your global `~/.claude/`:
- the **16 agents** → `~/.claude/agents/` (summonable as subagents in every project)
- the **Core Protocol** → a managed block in `~/.claude/CLAUDE.md` (loads in every
  session, any repo)

Idempotent and non-destructive: re-run it to update; your other global memory is
untouched. After it runs, open **any** Claude Code session anywhere and say
*"time to call up the core."*

> Don't have the repo cloned on that machine? `git clone https://github.com/Piccaho01/calmacs-core && bash calmacs-core/install/install-core.sh`

To update after changes land: `git pull && bash install/install-core.sh`.

---

## B) Every claude.ai chat (not Claude Code)

Plain chats don't read `~/.claude/`. To make the crew available in all of them, add
the core to your account's custom instructions **once**:

1. In **claude.ai → Settings → Profile / "What personal preferences should Claude
   consider"** (the custom-instructions box).
2. Paste the bootstrap block from **`../core-bootstrap.md`** (or copy it from the
   mobile page **`core.html`** → it has a one-tap Copy button).
3. Save. Now every new chat already knows the crew — just say *"time to call up the
   core."*

> Custom instructions have a length cap; the bootstrap is small and fits. If you'd
> rather not make it global to all chats, paste it per-chat instead, or use a
> claude.ai **Project** with the bootstrap as the project instructions.

---

## What "works everywhere" does and doesn't carry
- ✅ The **crew, the trigger, the voices, the flow** — everywhere you install it.
- ⚠️ **Project history** (what we've built: the dashboard kit, sprite status, etc.)
  travels only with the **repo**. A fresh global/chat session knows *how to be the
  crew* but not the project's backstory — point it at the repo for that.

## Honest note
No setting makes an AI "remember" across unrelated sessions by itself — every session
only knows its system prompt, loaded instruction files, or what's pasted in. These two
installs are exactly those levers, set once, so the crew shows up automatically from
then on.
