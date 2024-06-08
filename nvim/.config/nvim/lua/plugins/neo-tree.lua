return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			window = {
				mappings = {
					["e"] = "toggle_node",
				},
			},
		})
		vim.keymap.set("n", "<leader>m", ":Neotree focus reveal<CR>", {})
		vim.keymap.set("n", "<leader>tm", ":Neotree toggle<CR>", {})
	end,
}
