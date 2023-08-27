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
        lazy = true,
        -- event = 'UIEnter',
        config = true,
    },
        -- lazy.nvim
    {
    "folke/noice.nvim",
    event = "VeryLazy",
    config = function ()
        helpers.config('noice')
    end,
    dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        "rcarriga/nvim-notify",
        }
    },
    {
        'sunjon/shade.nvim',
        enabled = false,
        event = 'WinEnter',
        config = function ()
            helpers.config('shade')
        end,
    },
}
