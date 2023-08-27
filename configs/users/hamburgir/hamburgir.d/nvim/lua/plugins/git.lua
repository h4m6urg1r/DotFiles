local helpers = require('helpers')
return {
    {
        'tanvirtin/vgit.nvim',
        event = 'VeryLazy',
        enabled = false,
        config = function ()
            helpers.config('vgit')
        end,
        requires = {
            'nvim-lua/plenary.nvim'
        }
    },
    {
        'lewis6991/gitsigns.nvim',
        event = 'VeryLazy',
        config = function ()
            helpers.config('gitsigns')
        end
    },
    {
        'sindrets/diffview.nvim',
        event = 'VeryLazy',
        enabled = false,
        config = true,
    }
}
