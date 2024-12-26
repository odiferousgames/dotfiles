return {
    "sitiom/nvim-numbertoggle",
    "paul-louyot/toggle-quotes.nvim",
    {
        "sontungexpt/stcursorword",
        event = "VeryLazy",
        config = true,
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },
    {
        "FabijanZulj/blame.nvim",
        opts = {},
    },
    {
        "catgoose/nvim-colorizer.lua",
        event = "BufReadPre",
        opts = {},
    },
    {
        "numToStr/Comment.nvim",
        lazy = false,
        config = function()
            require("Comment").setup({
                mappings = {
                    basic = true,
                    extra = true,
                },
            })
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({
                current_line_blame = true,
            })
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
    },
    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
        },
        keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
        },
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },
    {
        "nacro90/numb.nvim",
        opts = {},
    },
    {
        "Wansmer/treesj",
        opts = {},
    },
}
