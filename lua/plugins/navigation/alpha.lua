return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"folke/which-key.nvim",
		{
			"folke/persistence.nvim",
			event = "BufReadPre",
			opts = {},
		},
	},
	lazy = false,
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		local which_key = require("which-key")
		local persistence = require("persistence")

		dashboard.section.header.val = {
			" _______             ____   ____.__         ",
			" ╲      ╲   ____  ___╲   ╲ ╱   ╱│__│ _____  ",
			" ╱   │   ╲_╱ __ ╲╱  _ ╲   Y   ╱ │  │╱     ╲ ",
			"╱    │    ╲  ___(  <_> )     ╱  │  │  Y Y  ╲",
			"╲____│__  ╱╲___  >____╱ ╲___╱   │__│__│_│  ╱",
			" ╲╱     ╲╱                               ╲╱ ",
		}

		dashboard.section.buttons.val = {
			dashboard.button("f", "  Find file", ":Telescope find_files hidden=true<cr>"),
			dashboard.button("r", "  Recent files", ":Telescope oldfiles<cr>"),
			dashboard.button("y", "  Browse files", ":Yazi cwd<cr>"),
			dashboard.button("s", "  Restore session", ':lua require("persistence").load()<cr>'),
			dashboard.button("g", "  Live grep", ":Telescope live_grep<cr>"),
			dashboard.button("q", "  Quit", ":qa<cr>"),
		}

		dashboard.section.footer.val = ""

		alpha.setup(dashboard.opts)

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "alpha",
			callback = function()
				vim.opt_local.foldenable = false
			end,
		})

		which_key.add({
			{ "<leader>S", desc = "Session", icon = "" },
			{
				"<leader>Sc",
				function()
					persistence.stop()
				end,
				desc = "Stop session",
				icon = "󰅖",
			},
			{
				"<leader>Sd",
				function()
					persistence.stop()
					local session_dir = vim.fn.stdpath("state") .. "/sessions/"
					local session_file = session_dir .. vim.fn.getcwd():gsub("/", "%%") .. ".vim"
					os.remove(session_file)
					vim.notify("Session deleted")
				end,
				desc = "Delete session",
				icon = "󰆴",
			},
			{
				"<leader>Sw",
				function()
					persistence.load()
				end,
				desc = "Load session (cwd)",
				icon = "",
			},
			{
				"<leader>Sl",
				function()
					persistence.load({ last = true })
				end,
				desc = "Load last session",
				icon = "",
			},
			{
				"<leader>Ss",
				function()
					persistence.save()
				end,
				desc = "Save session",
				icon = "",
			},
		})
	end,
}
