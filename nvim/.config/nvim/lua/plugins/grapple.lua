return {
	"cbochs/grapple.nvim",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons", lazy = true },
	},
	opts = {
		scope = "git",
	},
	event = { "BufReadPost", "BufNewFile" },
	cmd = "Grapple",
	keys = {
		{ "tm", "<cmd>Grapple toggle<cr>", desc = "Grapple toggle tag" },
		{ "gm", "<cmd>Grapple toggle_tags<cr>", desc = "Grapple open tags window" },
		{ "mn", "<cmd>Grapple cycle_tags next<cr>", desc = "Grapple cycle next tag" },
		{ "mp", "<cmd>Grapple cycle_tags prev<cr>", desc = "Grapple cycle previous tag" },
	},
}
