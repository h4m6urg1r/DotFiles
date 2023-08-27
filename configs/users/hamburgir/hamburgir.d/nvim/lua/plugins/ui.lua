local helpers = require('helpers')
return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            require('lualine').setup({
                icons_enabled = true,
                theme = 'catppuccin',
            })
        end,
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        event = 'VeryLazy',
        config = function ()
            helpers.config('telescope-nvim')
        end,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-fzf-native.nvim'
        },
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        lazy = true,
        build = 'make',
        -- build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    },
    {
        'stevearc/dressing.nvim',
        event = 'UIEnter',
        opts = {
            title_pos = 'center',
            border = 'rounded',
            wrap = true,
            mappings = {
                n = {
                    ["<Esc>"] = "Close",
                    ["<CR>"] = "Confirm",
                },
                i = {
                    ["<C-c>"] = "Close",
                    ["<CR>"] = "Confirm",
                    ["<Up>"] = "HistoryPrev",
                    ["<Down>"] = "HistoryNext",
                    ['<c-u>'] = 'HistoryPrev',
                    ['<c-d>'] = 'HistoryPrev',
                },
            },
        },
    },
    {
        'rcarriga/nvim-notify',
        event = 'UIEnter',
        config = true,
    }
}
