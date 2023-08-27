return {
    -- TODO: add some good search and replace tools
    {
        'cshuaimin/ssr.nvim',
        event = 'UIEnter',
        config = function()
            require('ssr').setup {
                border = "rounded",
                min_width = 50,
                min_height = 5,
                max_width = 120,
                max_height = 25,
                --[[ keymaps = {
                    close = "q",
                    next_match = "n",
                    prev_match = "N",
                    replace_confirm = "<cr>",
                    replace_all = "<leader><cr>",
                }, ]]
            }
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter'
        },
    },
    {
        'folke/which-key.nvim',
        lazy = true,
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require('which-key').setup()
        end
    },
    {
        "dstein64/vim-startuptime",
        -- lazy-load on a command
        cmd = "StartupTime",
    },
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy"
    },
    {
        'onsails/lspkind.nvim',
        lazy = true,
    }
}
