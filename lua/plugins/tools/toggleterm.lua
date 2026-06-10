return {
	"akinsho/toggleterm.nvim",
	version = "*",
	lazy = false,
	config = function()
		local toggleterm = require("toggleterm")
		local Terminal = require("toggleterm.terminal").Terminal
		local which_key = require("which-key")

		-- LazyGit Terminal
		local git = Terminal:new({ cmd = "lazygit", direction = "float", hidden = true, count = 3 })
		_G._git_toggle = function()
			git:toggle()
		end

		-- DB Terminal
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
			shell = vim.o.shell,
			persist_size = true,
			persist_mode = true,
			direction = "float",
		})

		which_key.add({
			mode = { "n", "t" },
			{ "<C-_>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal", icon = "" },
			{ "<leader>dd", "<cmd>lua _db_toggle()<cr>", desc = "Toggle Terminal DB", hidden = true, icon = " Rainfrog" },
			{ "<leader>gg", "<cmd>lua _git_toggle()<cr>", desc = "Toggle Terminal LazyGit", hidden = true, icon = "󰊢 LazyGit" },
			-- C-Space also used in cmp.lua for complete() but only in insert mode, no conflict
			{ "<C-Space>", "<cmd>lua _claude_toggle()<cr>", desc = "Toggle Terminal Claude", icon = "󰭆 Claude" },
		})

		-- Terminal mode keybinds to exit terminal mode
		vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

		-- Close terminal directly from terminal mode
		vim.keymap.set("t", "<C-q>", "<C-\\><C-n><cmd>q<cr>", { noremap = true, desc = "Close terminal" })
	end,
}
