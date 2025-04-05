-- Tmux navigation (doesn't work in which-key)
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", {})
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", {})
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", {})
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", {})

-- Godot
if vim.fn.filereadable(vim.fn.getcwd() .. "/project.godot") == 1 then
	local addr = "./godot.pipe"
	vim.fn.serverstop(addr)
	vim.fn.serverstart(addr)
	vim.cmd("set noexpandtab")
end

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
