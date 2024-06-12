return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		-- Config
		local config = require("telescope.config")
		local grep_args = { unpack(config.values.vimgrep_arguments) }
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
	end,
}
