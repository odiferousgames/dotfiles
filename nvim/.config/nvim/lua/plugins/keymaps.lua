return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		local wk = require("which-key")
		wk.setup()
		wk.register({
			["<A-j>"] = { ":cnext<cr>", "Quick List Next" },
			["<A-k>"] = { ":cprev<cr>", "Quick List Previous" },
			["<leader>"] = {
				n = {
					name = "Neo-Tree",
					n = { ":Neotree focus reveal<CR>", "Reveal & Focus" },
					t = { ":Neotree toggle<cr>", "Toggle" },
				},
				l = {
					name = "LSP",
					h = { vim.lsp.buf.hover, "Hover" },
					d = { require("telescope.builtin").lsp_definitions, "Definitions" },
					i = { require("telescope.builtin").lsp_implementations, "Implementations" },
					r = { require("telescope.builtin").lsp_references, "References" },
					s = { require("telescope.builtin").lsp_document_symbols, "Symbols" },
					I = { require("telescope.builtin").lsp_incoming_calls, "Incoming calls" },
					O = { require("telescope.builtin").lsp_outgoing_calls, "Outgoing calls" },
					D = { require("telescope.builtin").diagnostics, "Diagnostics" },
					a = { vim.lsp.buf.code_action, "Code Action" },
					f = { vim.lsp.buf.format, "Format" },
				},
				f = {
					name = "Telescope",
					f = { require("telescope.builtin").find_files, "Files" },
					g = { require("telescope.builtin").live_grep, "Live Grep" },
					G = {
						":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
						"Live Grep (Args)",
					},
					b = { require("telescope.builtin").buffers, "Buffers" },
					h = { require("telescope.builtin").help_tags, "Help Tags" },
					t = { ":TodoTelescope<CR>", "TODOs" },
					v = {
						require("telescope-live-grep-args.shortcuts").grep_visual_selection,
						"Grep Visual Selection",
					},
					["*"] = {
						require("telescope-live-grep-args.shortcuts").grep_word_under_cursor,
						"Grep Word Under Cursor",
					},
				},
				g = {
					name = "Git",
					n = { ":Gitsigns next_hunk<cr>", "Next Hunk" },
					p = { ":Gitsigns prev_hunk<cr>", "Previous Hunk" },
					b = { ":BlameToggle<cr>", "Blame Window" },
					c = { ":lua require('telescope.builtin').git_bcommits({ use_git_root = false })<CR>", "Commits" },
				},
				d = {
					name = "Oil",
					d = { ":Oil --float %:p:h<cr>", "Open Current" },
				},
				o = {
					name = "Olympe",
					o = { ":wa<CR> :!(cd ~/Documents/olympe/composer;npm run data)<CR>", "Local DRAW" },
				},
			},
		})
	end,
}
