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
		wk.add({
			-- Custom
			{
				mode = "n",
				{
					{ "<A-j>", ":cnext<CR>" },
					{ "<A-k>", ":cprev<CR>" },
				},
			},
			{
				mode = "v",
				{
					{ "J", ":m '>+1<CR>gv=gv" },
					{ "K", ":m '<-2<CR>gv=gv" },
				},
			},

			-- Look&Feel
			{ "<leader>z", group = "Look&Feel" },
			{ "<leader>zz", ":NoNeckPain<CR>", desc = "No Neck Pain" },
			{ "<leader>zl", ":set background=light<CR>", desc = "Light Theme" },
			{ "<leader>zd", ":set background=dark<CR>", desc = "Dark Theme" },
			{ "<leader>zh", ":nohl<CR>", desc = "No Highlights" },
			{
				"<leader>zq",
				":cclo<CR>",
				desc = "Close QuickFix List",
			},

			-- Actions
			{ "<leader>a", group = "Actions" },
			{ "<leader>as", ":TSJToggle<CR>", desc = "Split/Join" },
			{ "<leader>aq", ":ToggleQuotes<CR>", desc = "Toggle Quotes" },

			-- Olympe
			{ "<leader>o", group = "Olympe" },
			{ "<leader>oc", ":wa<CR> :sil!(cd ~/Documents/olympe/composer;npm run data)<CR>", desc = "Save Composer" },

			-- LSP
			{ "<leader>l", group = "LSP" },
			{ "<leader>lh", vim.lsp.buf.hover, desc = "Hover" },
			{ "<leader>ld", require("telescope.builtin").lsp_definitions, desc = "Definitions" },
			{
				"<leader>li",
				require("telescope.builtin").lsp_implementations,
				desc = "Implementations",
			},
			{ "<leader>lr", require("telescope.builtin").lsp_references, desc = "References" },
			{ "<leader>ls", require("telescope.builtin").lsp_document_symbols, desc = "Symbols" },
			{ "<leader>lI", require("telescope.builtin").lsp_incoming_calls, desc = "Incoming calls" },
			{ "<leader>lO", require("telescope.builtin").lsp_outgoing_calls, desc = "Outgoing calls" },
			{ "<leader>lD", require("telescope.builtin").diagnostics, desc = "Diagnostics" },
			{ "<leader>la", vim.lsp.buf.code_action, desc = "Code Action" },
			{
				"<leader>lf",
				function()
					require("conform").format({ lsp_format = "fallback" })
				end,
				desc = "Format",
			},
			{ "<leader>lR", vim.lsp.buf.rename, desc = "Rename" },

			-- Telescope
			{ "<leader>f", group = "Telescope" },
			{ "<leader>ff", require("telescope.builtin").find_files, desc = "Files" },
			{ "<leader>fg", require("telescope.builtin").live_grep, desc = "Live Grep" },
			{
				"<leader>fG",
				":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
				desc = "Live Grep (Args)",
			},
			{ "<leader>fb", require("telescope.builtin").buffers, desc = "Buffers" },
			{ "<leader>fh", require("telescope.builtin").help_tags, desc = "Help Tags" },
			{ "<leader>ft", ":TodoTelescope<CR>", desc = "TODOs" },
			{ "<leader>fn", ":Telescope notify<CR>", desc = "Notifications" },
			{
				"<leader>fv",
				require("telescope-live-grep-args.shortcuts").grep_visual_selection,
				desc = "Grep Visual Selection",
				mode = "v",
			},
			{ "<leader>fu", ":Telescope undo<CR>", desc = "Undo Tree" },
			{
				"<leader>f*",
				require("telescope-live-grep-args.shortcuts").grep_word_under_cursor,
				desc = "Grep Word Under Cursor",
			},

			-- Git
			{ "<leader>g", group = "Git" },
			{ "<leader>gg", ":Lazygit<CR>", desc = "Lazygit" },
			{ "<leader>gn", ":Gitsigns next_hunk<CR>", desc = "Next Hunk" },
			{ "<leader>gp", ":Gitsigns prev_hunk<CR>", desc = "Previous Hunk" },
			{ "<leader>gb", ":BlameToggle<CR>", desc = "Blame Window" },
			{
				"<leader>gc",
				":lua require('telescope.builtin').git_bcommits({ use_git_root = false })<CR>",
				desc = "File Commits",
			},

			-- Oil
			{ "<leader>d", group = "Oil" },
			{ "<leader>dd", ":Oil --float %:p:h<CR>", desc = "Open Current" },

			-- Neo-Tree
			{ "<leader>n", group = "Neo-Tree" },
			{ "<leader>nn", ":Neotree focus reveal<CR>", desc = "Open/Focus" },
			{ "<leader>nt", ":Neotree toggle<CR>", desc = "Close" },
		})
	end,
}
