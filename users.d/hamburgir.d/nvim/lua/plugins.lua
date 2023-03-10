return require('packer').startup(function()

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'tanvirtin/monokai.nvim',
        'folke/tokyonight.nvim',
        'olimorris/onedarkpro.nvim',
        'Mangeshrex/uwu.vim',
        'wadackel/vim-dogrun',
        'Avimitin/neovim-deus',
        'joshdick/onedark.vim'
    }
    use {
        'xiyaowong/nvim-transparent',  -- enables transparency
        disable=true,
        config=function()
            require('config/nvim-transparent')
        end
    }

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',  -- Sec c colors
        config = function()
            require('config/treesitter')
        end
    }

    -- Lsp
    use {
        'neovim/nvim-lspconfig',  -- Manages installed lsp
        config = function()
            require('config/nvim-lspconfig')
        end
    }

    -- use {
    --     'kosayoda/nvim-lightbulb',  -- Shows a lightbulb when code action available
    --     after='nvim-lspconfig',
    --     config=function()
    --         vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
    --     end
    -- }

    --[[ this is useless now
    --]]
    -- use{
    --     'ray-x/lsp_signature.nvim',  -- Shows variables to be supplied in a function
    --     after = 'nvim-lspconfig',
    -- }

    use {
        'kkharji/lspsaga.nvim',
        config = function()
            require('config/lspsaga-nvim')
        end
    }

    use 'williamboman/nvim-lsp-installer'

    -- Shows completion available
    use {
        {
            'hrsh7th/nvim-cmp',
            after='nvim-lspconfig',
            config = function()
                require('config/nvim-cmp')
            end
        },
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-calc',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-cmdline',
        -- 'hrsh7th/cmp-nvim-lsp-signature-help',
    }

    -- Snippets completion
    -- use{
    --     'hrsh7th/cmp-vsnip',
    --     'hrsh7th/vim-vsnip'
    -- }
    use {
            '/L3MON4D3/LuaSnip',
            tag = 'v<CurrentMajor>.*',
            config = function()
                require('luasnip.loaders.from_vscode').lazy_load()
            end
    }
    use 'rafamadriz/friendly-snippets'


    -- Code outline helpers (variables and functions)
    use {
        'liuchengxu/vista.vim',
        disable=true,
        opt=true
    }
    use {
        'simrat39/symbols-outline.nvim',
        disable=true,
        opt=true
    }
    use {
        'stevearc/aerial.nvim',
        disable=true,
        opt=true
    }

    -- UI
    use {
        'hoob3rt/lualine.nvim',  -- Status line
        config = function()
            require('config/lualine')
        end
    }

    use {
        'akinsho/bufferline.nvim',
        tag = "v2.*",
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('config/bufferline-nvim')
        end
    }
    use {
        "tiagovla/scope.nvim",
        config = function ()
            require('scope').setup()
        end
    }

    use 'onsails/lspkind-nvim'  -- Adds nerd font icons ( in lualine )

    -- Utils
    use {
        "numtostr/FTerm.nvim",  -- Adds a floating terminal
        config = function()
            require("config/fterm")
        end
    }

    use {
        'windwp/nvim-autopairs',  -- Adds autocompletion for brackets and quotes etc.
        config = function()
            require('config/nvim-autopairs')
        end
    }

    --[[ Latex helper plugins
    use {
        'lervag/vimtex',
        ft='tex',
        config = function()
            require('config/vimtex')
        end
    }
    --]]

    --[[ Handy booklet of keybinds
    use {
        'lazytanuki/nvim-mapper',
        config = function() require("nvim-mapper").setup{} end,
        before = "telescope.nvim"
    }
    --]]

    -- Collaborative editing
    use 'jbyuki/instant.nvim'

    -- md previewer
    use {{
        'npxbr/glow.nvim',  -- Preview inside neovim floating window
        ft='mdarkdown',
        disable=true
    }, {
        'davidgranstrom/nvim-markdown-preview',
        ft='markdown',
        config=function()
            vim.cmd("let g:nvim_markdown_preview_theme = 'solarized-light'")
        end,
        disable=true
    }, {
        'iamcco/markdown-preview.nvim',  -- Reloads page on buffer update or file change
        ft='markdown',
        disable=false,
        run='cd app && yarn install'
    }}

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- use {
    --     'christoomey/vim-tmux-navigator',
    --     config=function()
    --         require('config/vim-tmux-navigator')
    --     end
    -- }

    -- use "fladson/vim-kitty"

    -- Keybinds manager
    use {
        "folke/which-key.nvim",
        config = function()
            require('config/which-key-nvim')
        end
    }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
        'xeluxee/competitest.nvim',
        requires = 'MunifTanjim/nui.nvim',
        config = function() require'competitest'.setup() end
    }

    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })

    -- Discord Rich presence
    use {
        'andweeb/presence.nvim',
        config = function ()
            require('config/presence')
        end
    }

end)
