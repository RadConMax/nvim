return {
	"akinsho/toggleterm.nvim",
	version = "*",
	lazy = false,
	config = function()
		local toggleterm = require("toggleterm")
		local Terminal = require("toggleterm.terminal").Terminal
		local which_key = require("which-key")

		-- GHA Terminal
		local gha_current = Terminal:new({
			cmd = 'zsh -i -c "gha-current"',
			direction = "float",
			hidden = true,
			close_on_exit = false,
			float_opts = {
				width = function()
					return vim.o.columns
				end,
				height = function()
					return vim.o.lines - 6
				end,
			},
			count = 2,
		})
		_G._gha_current_toggle = function()
			gha_current:toggle()
		end

		-- LazyGit Terminal
		local git = Terminal:new({ cmd = "lazygit", direction = "float", hidden = true, count = 3 })
		_G._git_toggle = function()
			git:toggle()
		end

		-- DB Terminal
		-- local db = Terminal:new({ cmd = 'lazysql', direction = 'float', hidden = true, count = 4 })
		local db = Terminal:new({ cmd = "rainfrog", direction = "float", hidden = true, count = 4 })
		_G._db_toggle = function()
			db:toggle()
		end

		-- Custom Claude Terminal
		local claude = Terminal:new({ cmd = "claude -c", direction = "float", hidden = true, count = 5 })
		_G._claude_toggle = function()
			claude:toggle()
		end

		toggleterm.setup({
			-- Exit terminal mode with Escape, then you can use keybinds
			shell = vim.o.shell,
			persist_size = true,
			persist_mode = true,
			direction = "float",
		})

		which_key.add({
			mode = { "n", "t" },
			{ "<C-Space>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal", icon = "" },
			{ "<M-8>", "<cmd>lua _gha_current_toggle()<cr>", desc = "Toggle Terminal PR", icon = " PR" },
			{ "<M-9>", "<cmd>lua _db_toggle()<cr>", desc = "Toggle Terminal DB", icon = " Rainfrog" },
			{ "<M-0>", "<cmd>lua _git_toggle()<cr>", desc = "Toggle Terminal LazyGit", icon = "󰊢 LazyGit" },
			{ "<M-Space>", "<cmd>lua _claude_toggle()<cr>", desc = "Toggle Terminal Claude", icon = "󰭆 Claude" },
		})

		-- Terminal mode keybinds to exit terminal mode
		vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
		vim.keymap.set("t", "<M-Esc>", "<C-\\><C-n>", { noremap = true })

		-- Close terminal directly from terminal mode without needing to type :q
		-- Alt+Q or Ctrl+Q to close the current terminal
		vim.keymap.set("t", "<M-q>", "<C-\\><C-n><cmd>q<cr>", { noremap = true, desc = "Close terminal" })
		vim.keymap.set("t", "<C-q>", "<C-\\><C-n><cmd>q<cr>", { noremap = true, desc = "Close terminal" })
	end,
}
