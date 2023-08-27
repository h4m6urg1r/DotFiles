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
        },
    },
}
