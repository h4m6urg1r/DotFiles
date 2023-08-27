local function colorScheme(repo, enable, name, setName)
    --[[
    if name == nil then
        _, name = str:match("([^/]+)/([^/]+)")
    ]]
    if enable then
        if setName then
            return {
                repo,
                name = name,
                lazy = false,
                priority = 1000,
                config = function() vim.cmd("colorscheme " .. name ) end,
            }
        end
        return {
            repo,
            lazy = false,
            priority = 1000,
            config = function() vim.cmd("colorscheme " .. name ) end,
        }
    else
        return {
            repo,
            -- keys = {
            --     '<leader>;c',
            --     '<CMD>lua require("telescope.builtin").colorscheme<CR>',
            --     desc = 'Select Colorscheme',
            -- }
        }
        --[[
        return {
            repo,
            event = 'VimEnter',
        }
        ]]
    end
end

return {
    colorScheme( 'catppuccin/nvim', true, 'catppuccin', true ),
    colorScheme( 'tanvirtin/monokai.nvim' ),
	colorScheme( 'folke/tokyonight.nvim' ),
	colorScheme( 'olimorris/onedarkpro.nvim' ),
	colorScheme( 'Mangeshrex/uwu.vim' ),
	colorScheme( 'wadackel/vim-dogrun' ),
	colorScheme( 'Avimitin/neovim-deus' ),
	colorScheme( 'joshdick/onedark.vim' ),
    {
        'xiyaowong/nvim-transparent',
        config = function ()
            require("config.nvim-transparent")
        end,
    },
}
