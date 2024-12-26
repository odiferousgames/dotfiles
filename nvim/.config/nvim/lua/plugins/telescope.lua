return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-live-grep-args.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        "debugloop/telescope-undo.nvim",
    },
    config = function()
        -- Config
        local telescope = require("telescope")
        local config = require("telescope.config")
        ---@diagnostic disable-next-line: deprecated
        local grep_args = { unpack(config.values.vimgrep_arguments) }
        table.insert(grep_args, "--hidden")
        table.insert(grep_args, "--glob")
        table.insert(grep_args, "!**/.git/*")
        table.insert(grep_args, "--glob")
        table.insert(grep_args, "!**/node_modules/*")
        table.insert(grep_args, "--glob")
        table.insert(grep_args, "!**/versioned_docs/*")

        -- Setup
        telescope.setup({
            defaults = {
                vimgrep_arguments = grep_args,
            },
            pickers = {
                find_files = {
                    find_command = {
                        "rg",
                        "--files",
                        "--hidden",
                        "--glob",
                        "!**/.git/*",
                        "--glob",
                        "!**/node_modules/*",
                        "--glob",
                        "!**/versioned_docs/*",
                    },
                },
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown(),
                },
            },
        })

        -- Extensions
        telescope.load_extension("live_grep_args")
        telescope.load_extension("ui-select")
        telescope.load_extension("undo")
    end,
}
