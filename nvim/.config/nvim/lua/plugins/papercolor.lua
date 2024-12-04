return {
	"NLKNguyen/papercolor-theme",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("PaperColor")
        vim.cmd("set background=dark")
	end,
}
