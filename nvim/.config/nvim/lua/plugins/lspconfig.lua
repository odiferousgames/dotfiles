return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		-- Languages
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		lspconfig.lua_ls.setup({ capabilities = capabilities })
		lspconfig.gdscript.setup({ capabilities = capabilities })
		lspconfig.tsserver.setup({ capabilities = capabilities })
	end,
}
