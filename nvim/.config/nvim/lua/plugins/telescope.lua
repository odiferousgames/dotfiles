return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		-- Config
		local config = require("telescope.config")
		local grep_args = { table.unpack(config.values.vimgrep_arguments) }
		table.insert(grep_args, "--hidden")
		table.insert(grep_args, "--glob")
		table.insert(grep_args, "!**/.git/*")

		-- Setup
		require("telescope").setup({
			defaults = {
				vimgrep_arguments = grep_args,
			},
			pickers = {
				find_files = {
					find_command = {
						"rg",
						"--files",
						"--hidden",
						"--glob",
						"!**/.git/*",
					},
				},
			},
		})

		-- Keymaps
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
		vim.keymap.set("n", "<leader>ft", builtin.treesitter, {})
	end,
}
