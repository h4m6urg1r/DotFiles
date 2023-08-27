local helpers = require('helpers')
return {
    {
        'tanvirtin/vgit.nvim',
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
        config = function ()
            helpers.config('gitsigns')
        end
    },
    {
        'sindrets/diffview.nvim',
        config = true,
    }
}
