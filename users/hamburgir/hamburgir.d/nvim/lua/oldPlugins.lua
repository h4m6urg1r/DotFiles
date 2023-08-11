local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

return require('packer').startup(function()

    use {
        'xiyaowong/nvim-transparent',  -- enables transparency
        disable=true,
        config=function()
            require('config/nvim-transparent')
        end
    }

    -- use {
    --     'kosayoda/nvim-lightbulb',  -- Shows a lightbulb when code action available
    --     after='nvim-lspconfig',
    --     config=function()
    --         vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
    --     end
    -- }

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

    -- Utils
    use {
        "numtostr/FTerm.nvim",  -- Adds a floating terminal
        config = function()
            require("config/fterm")
        end
    }

    --[[ Handy booklet of keybinds
    use {
        'lazytanuki/nvim-mapper',
        config = function() require("nvim-mapper").setup{} end,
        before = "telescope.nvim"
    }
    --]]

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
        'jedrzejboczar/possession.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function() require('possession').setup() end,
    }

    use {
        'xeluxee/competitest.nvim',
        requires = 'MunifTanjim/nui.nvim',
        config = function()
            require'competitest'.setup()
        end
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
