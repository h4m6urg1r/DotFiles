return {
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
