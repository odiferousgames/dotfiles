return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")
		vim.notify = notify
		notify.setup({
			timeout = 1000,
			render = "compact",
			stages = "fade",
		})
	end,
}
