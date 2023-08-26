vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

        -- Enable completion triggered by <c-x><c-o>
        -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local bufmap = function(keys, func, desc)
            vim.keymap.set( 'n', keys, func, { noremap = true, silent = true, desc = desc, buffer = event.bufnr } )
        end

        bufmap('<leader>cr', vim.lsp.buf.rename, 'Rename identifier')
        bufmap('<leader>ca', vim.lsp.buf.code_action, 'Action')
        bufmap('<leader>cD', vim.lsp.buf.type_definition, 'Type definition')
        bufmap('gD', vim.lsp.buf.declaration, 'Goto declaration')
        bufmap('gd', vim.lsp.buf.definition, 'Show definition')
        bufmap('gI', vim.lsp.buf.implementation, 'Show implementations')
        bufmap('K', vim.lsp.buf.hover, 'Hover information')
        bufmap( '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', '' )
        bufmap( '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', '' )
        bufmap( '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', '' )
        bufmap( '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', '' )
        -- bufmap( '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', '' )
        -- bufmap( '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', '' )
        -- bufmap( 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', '' )
        -- bufmap( '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', '' )
        bufmap( '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', '' )
        bufmap( ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', '' )
        -- bufmap( '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', '' )
        -- bufmap( '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', '' )

        --[[ vim.api.nvim_buf_create_user_command(event.bufnr, 'Format', function(_)
            vim.lsp.buf.format()
        end,
        {}) ]]
    end
})

local on_attach = function(_, bufnr)
    vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        callback = function()
            local opts = {
                focusable = false,
                close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                border = 'rounded',
                source = 'always',
                prefix = ' ',
                scope = 'cursor',
            }
            vim.diagnostic.open_float(nil, opts)
        end
    })
end

local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config
lsp_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lsp_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)
--
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local setup = function (t)
    local conf = {
        -- capabilities = capabilities,
        on_attach = on_attach,
    }
    if t~=nil then
        for _, v in ipairs(t) do
            conf[v] = t[v]
        end
    end
    return conf
end

lspconfig.lua_ls.setup(setup(
    {
        Lua = {
            telemetry = { enable = false }
        }
    }
))

lspconfig.pylsp.setup(setup())
lspconfig.nixd.setup(setup())

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    float = {
        source = "always",
        border = "single"
    }
})

--[[
-- Setup lspconfig.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
require('mason-lspconfig').setup_handlers({
    function(server_name)
        require('lspconfig')[server_name].setup {
            on_attach = on_attach,
            capabilities = capabilities
        }
    end,
    ['lua_ls'] = function()
        require('lspconfig').lua_ls.setup {
            on_attach = on_attach,
            capabilities = capabilities,
            Lua = {
                workspace = { checkThirdParty = false },
                telemetry = { enable = false },
            },

            
            on_init = function(client)
                local path = client.workspace_folders[1].name
                if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
                client.config.settings = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                    runtime = {
                        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                        version = 'LuaJIT'
                    },
                    -- Make the server aware of Neovim runtime files
                    workspace = {
                        library = { vim.env.VIMRUNTIME }
                        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                        -- library = vim.api.nvim_get_runtime_file("", true)
                    }
                })

                client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
                end
                return true
            end
        }
    end
})
]]
--[[ local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {
        capabilities = capabilities,
        on_attach = on_attach,
    }

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end) ]]
