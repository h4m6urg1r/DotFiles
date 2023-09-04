local wk = require('which-key')
local helpers = require('helpers')

-- vim.api.nvim_set_keymap('n', '<SPACE>', '<NOP>', { noremap = true })

--[[
wk.register({
    ['<leader>'] = {
        
    }
}, {
        mode = '',
        silent = true,
        noremap = true
})
--]]

-- INSERT MODE KEYBINDS
wk.register({
    ['<C-S>'] = { '<C-O>:w<CR>a', 'Save File' },
    ['<C-Z>'] = { '<C-O>u', 'Undo' },
    ['<C-Y>'] = { '<C-O><C-R>', 'Redo' },
    ['<Up>'] = { '<C-O>gk', 'Up' },
    ['<Down>'] = { '<C-O>gj', 'Down' },
}, {
    mode = 'i',
    silent = true,
    noremap = true
})

-- NORMAL MODE KEYBINDS
wk.register({
    j = { 'gj', 'Down' },
    k = { 'gk', 'Up' },
    ['<Up>'] = { 'gk', 'Up' },
    ['<Down>'] = { 'gj', 'Down' },
    -- ['<C-U>'] = { '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(-1, \'<C-U>\')<CR>', '' },
    -- ['<C-D>'] = { '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(1, \'<C-U>\')<CR>', '' },
    --[[ ['['] = {
        d = { '<cmd>Lspsaga diagnostic_jump_prev<CR>', 'Jump to previous diagnostic' },
    },
    [']'] = {
        d = { '<cmd>Lspsaga diagnostic_jump_next<CR>', 'Jump to next diagnostic' },
    }, ]]
    ['<leader>'] = {
        [';'] = {
            name = '+Neovim',
            ['/'] = { require("telescope.builtin").search_history, 'Search history' },
            c = { require("telescope.builtin").colorscheme, 'Select Colorscheme' },
            e = { require("telescope.builtin").commands, 'Command history' },
            h = { require('telescope.builtin').help_tags, 'Find help tags' },
            s = { '<CMD>luafile %<CR>', 'Source current file' },
        },
        ['/'] = {
            name = '+Lost something?',
            ['/'] = { require("telescope.builtin").builtin, 'Shows builtins in telescope' },
            m = { require("telescope.builtin").man_pages, 'Search man pages' },
        },
        ['<tab>'] = {
            name = '+Tab',
            ['['] = { '<cmd>tabprevious<CR>', 'Goto previous tab' },
            [']'] = { '<cmd>tabNext<CR>', 'Goto next tab' },
            d = { '<cmd>tabclose<CR>', 'Close current tab' },
            n = { '<cmd>tabnew<CR>', 'Open new tab window' },
        },
        b = {
            name = '+Buffer',
            d = { '<cmd>bdel<CR>', 'Delete buffer' },
            n = { '<cmd>bn<CR>', 'Go to next buffer' },
            p = { '<cmd>bp<CR>', 'Go to revious buffer' },
            s = { '<cmd>Telescope buffers<CR>', 'Switch to buffer from list' },
            y = { '<cmd>%+y<CR>', 'Copy buffer' }
        },
        c = {
            name = '+Code',
            --[[ a = { '<cmd>Lspsaga code_action<cr>', 'Code Action' },
            d = { '<cmd>Lspsaga show_line_diagnostics<CR>', 'Show diagnostics' },
            f = { '<cmd>lua vim.lsp.buf.formatting()<CR>', 'Format code' },
            l = {
                name = '+LSP',
                d = { '<cmd>Lspsaga hover_doc<CR>', 'Show docs' },
                D = { '<cmd>Lspsaga preview_definition<CR>', 'Show definition' },
                f = { '<cmd>Lspsaga lsp_finder<CR>', 'Find something with the help of lsp' },
                r = {
                    name = '+refactor',
                },
            },
            o = { '', 'Organize imports'},
            r = { '<cmd>Lspsaga rename<cr>', 'Rename variable' },
            s = { '<cmd>Lspsaga signature_help<CR>', 'Show signature' }, ]]
            F = { require('telescope').extensions.flutter.commands, 'Show flutter commands' },
            R = { function() require('ssr').open() end, 'Structural replace' },
        },
        f = {
            name = '+File',
            f = { '<cmd>Telescope find_files<CR>', 'Find files' },
            g = { require('telescope.builtin').live_grep, 'Grep text in current directory' },
            s = { helpers.save, 'Save file' },
        },
        q = {
            name = '+quit',
        },
        t = {
            name = '+Toggle',
            e = { '<CMD>Neotree toggle<CR>', 'Explorer' },
            h = { '<CMD>noh<CR>', 'Search highlight' },
            -- o = { '<CMD>TransparentToggle<CR>', 'Transparency' },
            r = { '<CMD>set relativenumber!<CR>', 'Relative numbers' },
            s = { 'Shade' },
            -- t = { '<CMD>lua require("FTerm").toggle()<CR>', 'Terminal' },
        },
        w = {
            name = '+Window',
            d = { '<cmd>q<CR>', 'Kill window' },
            h = {'<c-w>h', 'Focus left window'},
            j = {'<c-w>j', 'Focus down window'},
            k = {'<c-w>k', 'Focus up window'},
            l = {'<c-w>l', 'Focus right window'},
            n = { '<cmd>new<CR>', 'Open new window' },
        },
    },
}, {
    mode = 'n',
    silent = true,
    noremap = true
})

-- VISUAL MODE KEYBINDS
wk.register({
    ['<Up>'] = { 'gk', 'Up' },
    ['<Down>'] = { 'gj', 'Down' },
    ['<leader>'] = {
        c = {
            -- a = { '<cmd><C-U>Lspsaga range_code_action<CR>', 'Code action' }
        }
    }
}, {
    mode = 'v',
    silent = true,
    noremap = true,
})

-- TERMINAL MODE KEYBINDS
wk.register({
    ['<A-i>'] = { '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', 'Toggle terminal' },
}, {
        mode = 't',
        silent = true,
        noremap = true,
})
