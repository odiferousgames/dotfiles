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
					d = { vim.lsp.buf.definition, "Definition" },
					i = { vim.lsp.buf.implementation, "Implementation" },
					r = { vim.lsp.buf.references, "References" },
					a = { vim.lsp.buf.code_action, "Code Action" },
					f = { vim.lsp.buf.format, "Format" },
				},
				f = {
					name = "Telescope",
					f = { require("telescope.builtin").find_files, "Files" },
					g = { require("telescope.builtin").live_grep, "Live Grep" },
					b = { require("telescope.builtin").buffers, "Buffers" },
					h = { require("telescope.builtin").help_tags, "Help Tags" },
					s = { require("telescope.builtin").treesitter, "Treesitter" },
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
				u = {
					name = "Undo-Tree",
					u = { vim.cmd.UndotreeToggle, "Show" },
				},
				m = {
					name = "Grapple",
					t = { "<cmd>Grapple toggle<cr>", "Toggle Tag" },
					m = { "<cmd>Grapple toggle_tags<cr>", "Show" },
					n = { "<cmd>Grapple cycle_tags next<cr>", "Next" },
					p = { "<cmd>Grapple cycle_tags prev<cr>", "Previous" },
				},
				a = {
					name = "Neogen",
					a = { ":Neogen<cr>", "Annotate" },
				},
				t = {
					name = "Tagbar",
					t = { ":TagbarToggle<cr>", "Toggle" },
				},
				x = {
					name = "Trouble",
					x = { ":Trouble diagnostics toggle<cr>", "Diagnostics" },
				},
				g = {
					name = "Git",
					n = { ":Gitsigns next_hunk<cr>", "Next Hunk" },
					p = { ":Gitsigns prev_hunk<cr>", "Previous Hunk" },
					b = { ":BlameToggle<cr>", "Blame Window" },
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
