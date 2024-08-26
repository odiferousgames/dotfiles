return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	dependencies = {
		"nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-live-grep-args.nvim",
	},
	config = function()
		-- Config
        local telescope = require("telescope")
		local config = require("telescope.config")
		local grep_args = { unpack(config.values.vimgrep_arguments) }
		table.insert(grep_args, "--hidden")
		table.insert(grep_args, "--glob")
		table.insert(grep_args, "!**/.git/*")
		table.insert(grep_args, "--glob")
		table.insert(grep_args, "!**/node_modules/*")

		-- Setup
		telescope.setup({
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
						"--glob",
						"!**/node_modules/*",
					},
				},
			},
		})

        -- Extensions
        telescope.load_extension("live_grep_args")
	end,
}
