return {
    "akinsho/toggleterm.nvim",
    version = "v2.13.0",
    config = function()
        local tt = require("toggleterm")
        tt.setup()

        -- Lazygit
        local Terminal = require('toggleterm.terminal').Terminal
        local lazygit  = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
        vim.api.nvim_create_user_command("Lazygit", function() lazygit:toggle() end, {})
    end,
}
