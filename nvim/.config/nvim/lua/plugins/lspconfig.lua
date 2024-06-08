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

		-- Keybinds
		vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
		vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		vim.keymap.set({ "n", "v" }, "<leader>cf", vim.lsp.buf.format, {})
	end,
}
