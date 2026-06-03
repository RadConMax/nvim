# Neovim Config

## Keymaps

> Leader key is `<Space>`.

---

### General

| Key | Description | Mode |
|-----|-------------|------|
| `<leader>ss` | Save | n |
| `<leader>SS` | Save (Force) | n |
| `<leader>xx` | Save and close (if modified) | n |
| `<leader>qq` | Close buffer | n |
| `<leader>QQ` | Force close buffer | n |
| `<leader>cc` | Exit (close all) | n |
| `<leader>hh` | Horizontal split | n |
| `<leader>vv` | Vertical split | n |
| `<leader>VV` | Select all | n |
| `<leader>rr` | Source current file | n |
| `<leader>ww` | Diff open windows | n |
| `<leader>kk` | Open Which Key | n |
| `<Esc>` | Clear search highlights | n |
| `J` | Append next line to current | n |
| `N` | Search next, keep cursor centered | n |
| `n` | Search previous, keep cursor centered | n |
| `<C-d>` | Half page down, keep cursor centered | n |
| `<C-u>` | Half page up, keep cursor centered | n |
| `[q` | Previous quickfix item | n |
| `]q` | Next quickfix item | n |

---

### Buffers

| Key | Description | Mode |
|-----|-------------|------|
| `<Tab>` | Next buffer | n |
| `<S-Tab>` | Previous buffer | n |
| `<leader><Tab>` | Move buffer right | n |
| `<leader><S-Tab>` | Move buffer left | n |
| `<leader>ba` | Close all buffers | n |
| `<leader>bc` | Close current buffer | n |
| `<leader>bC` | Force close current buffer | n |
| `<leader>be` | Edit new buffer | n |
| `<leader>bl` | Close buffers to the left | n |
| `<leader>br` | Close buffers to the right | n |
| `<leader>bn` | Next buffer | n |
| `<leader>bp` | Previous buffer | n |
| `<leader>bo` | Close all other buffers | n |
| `<leader>bsd` | Sort buffers by directory | n |
| `<leader>bse` | Sort buffers by extension | n |

---

### Tabs

| Key | Description | Mode |
|-----|-------------|------|
| `<leader>Tn` | New tab | n |
| `<leader>Ts` | Current buffer in new tab | n |
| `<leader>Tc` | Close current tab | n |
| `<leader>T]` | Next tab | n |
| `<leader>T[` | Previous tab | n |
| `<leader>Tt` | Open terminal tab | n |

---

### Find (Telescope)

| Key | Description | Mode |
|-----|-------------|------|
| `<leader>ff` | Find files | n |
| `<leader>fs` | Live grep in working directory | n |
| `<leader>fc` | Grep current word in working directory | n |
| `<leader>fb` | Buffers | n |
| `<leader>fg` | Git files | n |
| `<leader>fr` | Recent files | n |
| `<leader>fx` | Fuzzy find in current buffer | n |
| `<leader>fd` | Diagnostics | n |
| `<leader>fh` | Search history | n |
| `<leader>fj` | Jump list | n |
| `<leader>fl` | Highlights | n |
| `<leader>fm` | Marks | n |
| `<leader>fq` | Quickfix | n |
| `<leader>fw` | Spell suggestions | n |

---

### LSP

| Key | Description | Mode |
|-----|-------------|------|
| `K` | Show documentation | n |
| `gd` | Go to definition | n |
| `gD` | Go to declaration | n |
| `gr` | Go to references | n |
| `gi` | Go to implementations | n |
| `gt` | Go to type definitions | n |
| `gI` | LSP info | n |
| `<leader><C-k>` | Signature help | n |
| `<leader>lc` | Code actions | n/v |
| `<leader>lf` | Format file | n |
| `<leader>ln` | ESLint fix all | n |
| `<leader>lr` | Smart rename | n |
| `<leader>lt` | Restart LSP | n |
| `<leader>lv` | LazyDev LSP | n |

---

### Diagnostics

| Key | Description | Mode |
|-----|-------------|------|
| `dc` | Send diagnostics to quickfix | n |
| `df` | Open float diagnostic | n |
| `dl` | Find buffer diagnostics (Telescope) | n |
| `dL` | Open diagnostics list | n |
| `dp` | Previous diagnostic | n |
| `dn` | Next diagnostic | n |

---

### Workspace

| Key | Description | Mode |
|-----|-------------|------|
| `<leader>wa` | Add workspace folder | n |
| `<leader>wr` | Remove workspace folder | n |
| `<leader>wl` | List workspace folders | n |

---

### Git (Gitsigns)

| Key | Description | Mode |
|-----|-------------|------|
| `]h` | Next hunk | n |
| `[h` | Previous hunk | n |
| `<leader>gs` | Stage hunk | n/v |
| `<leader>gr` | Reset hunk | n/v |
| `<leader>gS` | Stage buffer | n |
| `<leader>gR` | Reset buffer | n |
| `<leader>gu` | Undo stage hunk | n |
| `<leader>gp` | Preview hunk | n |
| `<leader>gb` | Blame line | n |
| `<leader>gd` | Diff this | n |
| `<leader>gt` | Toggle line blame | n |
| `<leader>gT` | Toggle deleted | n |
| `<leader>gg` | Open LazyGit | n |
| `<leader>GG` | LazyGit current file | n |
| `ih` | Select git hunk (text object) | o/x |

---

### Terminal (ToggleTerm)

| Key | Description | Mode |
|-----|-------------|------|
| `<C-Space>` | Toggle terminal | n/t |
| `<M-Space>` | Toggle Claude terminal | n/t |
| `<M-8>` | Toggle GHA terminal | n |
| `<M-9>` | Toggle LazyGit terminal | n |
| `<M-0>` | Toggle Rainfrog (DB) terminal | n |
| `<Esc>` | Exit terminal mode | t |
| `<M-Esc>` | Exit terminal mode | t |
| `<M-q>` | Close terminal | t |
| `<C-q>` | Close terminal | t |

---

### Tmux Navigation

| Key | Description | Mode |
|-----|-------------|------|
| `<C-h>` | Navigate left | n |
| `<C-j>` | Navigate down | n |
| `<C-k>` | Navigate up | n |
| `<C-l>` | Navigate right | n |
| `<C-\>` | Navigate to previous | n |

---

### Copilot

| Key | Description | Mode |
|-----|-------------|------|
| `<leader>cD` | Disable Copilot | n |
| `<leader>cE` | Enable Copilot | n |
| `<leader>cO` | Sign out of Copilot | n |
| `<leader>cP` | Open Copilot panel | n |
| `<leader>cS` | Setup Copilot | n |
| `<leader>cV` | Show Copilot version | n |
| `<C-e>` | Accept suggestion | i |
| `<C-y>` | Accept next line | i |
| `<C-w>` | Accept next word | i |
| `<C-j>` | Next suggestion | i |
| `<C-k>` | Previous suggestion | i |
| `<C-x>` | Dismiss suggestion | i |

---

### Folds (UFO)

| Key | Description | Mode |
|-----|-------------|------|
| `zR` | Open all folds | n |
| `zM` | Close all folds | n |

---

### Flash

| Key | Description | Mode |
|-----|-------------|------|
| `<leader>j` | Flash jump | n/x/o |
| `<leader>j` | Toggle flash | c |
| `<leader>[` | Flash treesitter | n/x/o |
| `<leader>]` | Treesitter search | x/o |
| `<leader>r` | Remote flash | o |

---

### Yazi

| Key | Description | Mode |
|-----|-------------|------|
| `<leader>yy` | Yazi (toggle) | n |
| `<leader>yc` | Yazi (current file) | n |
| `<leader>yd` | Yazi (working directory) | n |

---

### Sessions (Startify)

| Key | Description | Mode |
|-----|-------------|------|
| `<leader>SN` | New session | n |
| `<leader>SL` | Load session | n |
| `<leader>SC` | Close session | n |
| `<leader>SD` | Delete session | n |

---

### Noice

| Key | Description | Mode |
|-----|-------------|------|
| `<leader>nc` | Dismiss messages | n |
| `<leader>nd` | Disable Noice | n |
| `<leader>ne` | Error messages | n |
| `<leader>nh` | Message history | n |
| `<leader>nl` | Last message | n |
| `<leader>nn` | Enable Noice | n |
| `<leader>ns` | Debugging stats | n |

---

### Markdown

| Key | Description | Mode |
|-----|-------------|------|
| `<leader>mp` | Toggle markdown preview | n |
| `<leader>mt` | Toggle render markdown | n |
| `<leader>mc` | Render markdown config | n |
| `<leader>md` | Decrease anti-conceal | n |
| `<leader>mi` | Increase anti-conceal | n |
| `<leader>ml` | Render markdown logs | n |
| `<leader>mD` | Render markdown debug | n |

---

### Obsidian

| Key | Description | Mode |
|-----|-------------|------|
| `<leader>oo` | Quick switch | n |
| `<leader>on` | New note | n |
| `<leader>os` | Search | n |
| `<leader>ot` | Tags | n |
| `<leader>ob` | Back links | n |
| `<leader>of` | Follow link | n |
| `<leader>oc` | Table of contents | n |
| `<leader>ol` | Links | n |
| `<leader>oi` | Paste image | n |
| `<leader>or` | Rename | n |
| `<leader>ox` | Toggle checkbox | n |
| `<leader>oO` | Open in Obsidian app | n |
| `<leader>op` | Personal vault | n |
| `<leader>ow` | Work vault | n |
| `<leader>oh` | Help | n |
| `<leader>og` | Help grep | n |
| `<leader>odd` | All daily notes | n |
| `<leader>odt` | Today's note | n |
| `<leader>odm` | Last month notes | n |
| `<leader>odn` | Tomorrow's note | n |
| `<leader>odw` | Last week's notes | n |
| `<leader>ody` | Yesterday's note | n |
| `<leader>oTn` | New note from template | n |
| `<leader>oTT` | Insert template | n |
| `<leader>oe` | Extract to new note | v |
| `<leader>ol` | Link selected text | v |
| `<leader>on` | Link to new note | v |

---

### Zen Mode & Twilight

| Key | Description | Mode |
|-----|-------------|------|
| `<leader>zz` | Toggle Zen Mode | n |
| `<leader>tt` | Toggle Twilight | n |

---

### Set Filetype

| Key | Description | Mode |
|-----|-------------|------|
| `<leader>Fc` | Set filetype: config | n |
| `<leader>Fj` | Set filetype: JSON | n |
| `<leader>Fl` | Set filetype: Lua | n |
| `<leader>Fm` | Set filetype: Markdown | n |
| `<leader>Fp` | Set filetype: Python | n |
| `<leader>Fq` | Set filetype: SQL | n |
| `<leader>Fs` | Set filetype: Shell | n |
| `<leader>Ft` | Set filetype: TypeScript | n |
| `<leader>Fv` | Set filetype: JavaScript | n |
| `<leader>Fy` | Set filetype: YAML | n |

---

### Clipboard (Visual)

| Key | Description | Mode |
|-----|-------------|------|
| `<leader>y` | Copy to system clipboard | v |
| `<leader>Y` | Copy to end of line to clipboard | v |
| `<leader>p` | Paste from system clipboard | v |
| `J` | Move selected lines down | v |
| `K` | Move selected lines up | v |

---

### Tools

| Key | Description | Mode |
|-----|-------------|------|
| `<leader>ll` | Open Lazy | n |
| `<leader>MM` | Open Mason | n |
| `<leader>dd` | Open LazySql | n |
