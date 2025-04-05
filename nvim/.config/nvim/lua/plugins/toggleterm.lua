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

        -- Olympe
        -- TODO: move éoc here, as a bottom terminal (new cmd, then modify the mapping)
        -- { "<leader>oc", ":wa<CR> :sil!(cd ~/Documents/olympe/composer;npm run data)<CR>", desc = "Save Composer" },
    end,
}
