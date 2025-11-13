# AGENTS.md - Neovim Configuration Guidelines

## Build/Test Commands
- This is a Neovim configuration (no traditional build/test system)
- Test configuration: Launch `nvim` and verify plugins load correctly
- Check syntax: Run `:checkhealth` in Neovim to diagnose issues
- Update plugins: Use `:Lazy update` within Neovim

## Code Style Guidelines

### File Organization
- Main entry: `init.lua` -> `lua/config/init.lua`
- Plugin specs in `lua/plugins/` organized by category (languages/, navigation/, tools/, ui/)
- Configuration files in `lua/config/` (settings.lua, mappings.lua, lazy.lua)

### Lua Style
- Use 4 spaces for indentation (configured in settings.lua:20-23)
- Plugin specs return table with plugin name and configuration
- Use single quotes for strings
- Function definitions: `local function name()` or `function()`
- Local variables: `local var_name = require('module')`

### Naming Conventions
- Files: lowercase with underscores (e.g., `lsp.lua`, `which_key.lua`)
- Variables: snake_case (e.g., `cmp_nvim_lsp`, `base_on_attach`)
- Functions: snake_case or camelCase for callbacks

### Plugin Configuration Pattern
- Return table from plugin files: `return { 'plugin/name', config = function() ... end }`
- Use `event`, `dependencies`, `config` keys consistently
- Lazy loading with appropriate events (`BufReadPre`, `BufNewFile`)