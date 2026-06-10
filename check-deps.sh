#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

pass() { echo -e "  ${GREEN}✓${NC} $1"; }
fail() { echo -e "  ${RED}✗${NC} $1 ${YELLOW}— $2${NC}"; }
warn() { echo -e "  ${YELLOW}~${NC} $1 ${YELLOW}— $2${NC}"; }

echo ""
echo "=== Neovim Config Dependency Check ==="
echo ""

# --- Core ---
echo "Core:"
if command -v nvim &>/dev/null; then
    version=$(nvim --version | head -1)
    pass "nvim ($version)"
else
    fail "nvim" "brew install neovim"
fi

if command -v git &>/dev/null; then
    pass "git"
else
    fail "git" "brew install git"
fi

if command -v node &>/dev/null; then
    pass "node ($(node --version))"
else
    fail "node" "install nvm + nvm install --lts"
fi

if command -v npm &>/dev/null; then
    pass "npm"
else
    fail "npm" "comes with node"
fi

# --- nvm ---
echo ""
echo "Node Version Manager:"
if [ -d "$HOME/.nvm" ]; then
    if [ -e "$HOME/.nvm/alias/default" ]; then
        pass "nvm (default alias set)"
    else
        fail "nvm default alias" "nvm alias default <version>"
    fi
else
    fail "nvm" "https://github.com/nvm-sh/nvm"
fi

# --- CLI Tools (toggleterm) ---
echo ""
echo "CLI Tools (toggleterm):"
if command -v lazygit &>/dev/null; then
    pass "lazygit"
else
    fail "lazygit" "brew install lazygit"
fi

if command -v rainfrog &>/dev/null; then
    pass "rainfrog"
else
    fail "rainfrog" "cargo install rainfrog"
fi

if command -v claude &>/dev/null; then
    pass "claude"
else
    fail "claude" "npm install -g @anthropic-ai/claude-code"
fi

if command -v yazi &>/dev/null; then
    pass "yazi"
else
    fail "yazi" "brew install yazi"
fi

# --- Treesitter ---
echo ""
echo "Treesitter:"
if command -v tree-sitter &>/dev/null; then
    pass "tree-sitter-cli"
else
    fail "tree-sitter-cli" "brew install tree-sitter-cli"
fi

# --- Formatters (conform.nvim, installed via mason but checking anyway) ---
echo ""
echo "Formatters (auto-installed by mason, but verifying):"
if command -v prettier &>/dev/null || [ -x "$HOME/.local/share/nvim/mason/bin/prettier" ]; then
    pass "prettier"
else
    warn "prettier" "will be installed by mason on first open"
fi

if command -v stylua &>/dev/null || [ -x "$HOME/.local/share/nvim/mason/bin/stylua" ]; then
    pass "stylua"
else
    warn "stylua" "will be installed by mason on first open"
fi

if command -v shfmt &>/dev/null || [ -x "$HOME/.local/share/nvim/mason/bin/shfmt" ]; then
    pass "shfmt"
else
    warn "shfmt" "will be installed by mason on first open"
fi

# --- Copilot ---
echo ""
echo "Copilot:"
if [ -d "$HOME/.config/github-copilot" ]; then
    pass "copilot (authenticated)"
else
    warn "copilot" "run :Copilot setup inside nvim"
fi

# --- Obsidian Vaults ---
echo ""
echo "Obsidian Vaults:"
if [ -d "$HOME/.notes/personal" ]; then
    pass "~/.notes/personal"
else
    fail "~/.notes/personal" "mkdir -p ~/.notes/personal"
fi

if [ -d "$HOME/.notes/work" ]; then
    pass "~/.notes/work"
else
    fail "~/.notes/work" "mkdir -p ~/.notes/work"
fi


# --- Nerd Font ---
echo ""
echo "Fonts:"
if fc-list 2>/dev/null | grep -qi "nerd"; then
    pass "Nerd Font detected"
elif ls ~/Library/Fonts/*Nerd* &>/dev/null 2>&1 || ls /Library/Fonts/*Nerd* &>/dev/null 2>&1; then
    pass "Nerd Font detected"
else
    warn "Nerd Font" "install from https://www.nerdfonts.com/"
fi

echo ""
echo "=== Done ==="
echo ""
