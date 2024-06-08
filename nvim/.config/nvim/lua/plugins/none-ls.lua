return {
	"nvimtools/none-ls.nvim",
	dependencies = { "williamboman/mason-lspconfig.nvim" },
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
			},
		})
	end,
}
