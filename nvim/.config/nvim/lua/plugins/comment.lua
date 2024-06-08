return {
	{
		"numToStr/Comment.nvim",
		lazy = false,
		config = function()
			require("Comment").setup({
				toggler = {
					line = "tcc",
					block = "tbc",
				},
				opleader = {
					line = "tc",
					block = "tb",
				},
				extra = {
					above = "tcO",
					below = "tco",
					eol = "tcA",
				},
				mappings = {
					basic = true,
					extra = true,
				},
			})
		end,
	},
}
