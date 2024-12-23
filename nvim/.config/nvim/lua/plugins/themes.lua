return {
	{
		"zenbones-theme/zenbones.nvim",
		-- Optionally install Lush. Allows for more configuration or extending the colorscheme
		-- If you don't want to install lush, make sure to set g:zenbones_compat = 1
		-- In Vim, compat mode is turned on as Lush only works in Neovim.
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
		-- you can set set configuration options here
		config = function()
			vim.g.zenbones_darken_comments = 45
			vim.cmd.colorscheme("zenbones")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("lualine").setup({
				options = {
					theme = "gruvbox",
				},
				sections = {
					lualine_c = { "filename" },
					lualine_x = { "filetype" },
					lualine_z = { "selectioncount", "location" },
				},
			})
		end,
	},
	{
		"sphamba/smear-cursor.nvim",
		opts = {                            -- Default  Range
			stiffness = 0.8,                -- 0.6      [0, 1]
			trailing_stiffness = 0.5,       -- 0.3      [0, 1]
			distance_stop_animating = 0.5,  -- 0.1      > 0
			hide_target_hack = false,       -- true     boolean
		},
	},
}
