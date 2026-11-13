#!/usr/bin/env bash
#
# install-core.sh — make Calmac's Core a GLOBAL agent crew, available in every
# Claude Code session on this machine (any repo), not just the calmacs-core repo.
#
# What it does (idempotent — safe to re-run):
#   1. Copies the agent definitions to ~/.claude/agents/  (global subagents)
#   2. Inserts/updates a managed block in ~/.claude/CLAUDE.md with the Core
#      Protocol (the "time to call up the core" trigger + voices). Your existing
#      global memory outside the managed block is left untouched.
#
# Usage:  bash install/install-core.sh
#
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CLAUDE_DIR="${HOME}/.claude"
AGENTS_DST="${CLAUDE_DIR}/agents"
MEM="${CLAUDE_DIR}/CLAUDE.md"
SRC_BLOCK="${REPO_DIR}/install/global-core.md"
BEGIN="<!-- BEGIN Calmac's Core (managed by install-core.sh) -->"
END="<!-- END Calmac's Core (managed by install-core.sh) -->"

echo "Installing Calmac's Core globally into ${CLAUDE_DIR} ..."
mkdir -p "${AGENTS_DST}"

# 1. Global agents
count=0
for f in "${REPO_DIR}"/agents/*.md; do
  [ "$(basename "$f")" = "README.md" ] && continue
  cp "$f" "${AGENTS_DST}/"
  count=$((count + 1))
done
echo "  • Installed ${count} agents to ${AGENTS_DST}/"

# 2. Managed block in global CLAUDE.md
touch "${MEM}"
if grep -qF "${BEGIN}" "${MEM}"; then
  # Remove the old managed block (inclusive) so we can refresh it
  awk -v b="${BEGIN}" -v e="${END}" '
    $0==b {skip=1}
    skip==0 {print}
    $0==e {skip=0}
  ' "${MEM}" > "${MEM}.tmp" && mv "${MEM}.tmp" "${MEM}"
  echo "  • Refreshed existing Calmac's Core block in ${MEM}"
else
  echo "  • Added Calmac's Core block to ${MEM}"
fi
{
  printf '\n%s\n' "${BEGIN}"
  cat "${SRC_BLOCK}"
  printf '%s\n' "${END}"
} >> "${MEM}"

echo ""
echo "Done. Open ANY Claude Code session (any repo) and say:"
echo "    time to call up the core"
echo ""
echo "To update later, re-run this script after pulling the repo."
echo "To uninstall: delete the managed block from ${MEM} and remove the crew files from ${AGENTS_DST}/."
