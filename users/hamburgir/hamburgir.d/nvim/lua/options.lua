-- Options
local options = {
	syntax='on',
  -- Turns on mouse
	mouse='a',

  -- Sets numberline
	number=true,
	ruler=true,

  -- Tab related settings
	autoindent=true,
	expandtab=false,
	tabstop=4,
	smarttab=true,
	shiftwidth=4,
	softtabstop=4,
	shiftround=true,

  -- Shows cursor position
	cursorline=true,
	cursorcolumn=true,

  -- Shows last used command in status line
--  showcmd=true
  -- Global status bar
	laststatus = 3,

  -- Use highlighting when doing a search
	showmatch=true,
  -- Highlight while searching
	hlsearch=true,
  -- Ignores capitalisation while searching
	ignorecase=true,
  -- Incremental search that shows partial matches
	incsearch=true,
  -- Automatically switch search to case-sensitive when search query contains an uppercase letter
	smartcase=true,

  -- Always try to show a paragraph’s last line.
	display = vim.opt.display --[[ + 'lastline' ]],
  -- Use an encoding that supports unicode.
	encoding='utf-8',
  -- Avoid wrapping a line in the middle of a word.
	linebreak=true,
  -- The number of screen lines to keep above and below the cursor
	scrolloff=1,
  -- The number of screen columns to keep to the left and right of the cursor
	sidescrolloff=5,
  -- Enable line wrapping.
	wrap=true,  -- use :set wrap! to disable wrap
  -- Set the commands to save in history default number is 20.
	history=1000,
  -- Disables fold at startup
	foldenable=false,
--  completeopt='menu,menuone,noselect'
	termguicolors = true,
  -- CursorHold time
	updatetime = 100,

  --Shows sign columns all the time
	signcolumn = 'yes',

	inccommand='nosplit',
  -- Swap files folder
	dir = '/home/hamburgir/.cache/nvim/swaps/',
  -- Undofile
	undofile = true,
	undodir ='/home/hamburgir/.cache/nvim/undo/',
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

--[[ vim.cmd [[
	fu! SaveSess()
	 execute 'mksession! ' . getcwd() . '/.session.vim'
	endfunction

	fu! RestoreSess()
	if filereadable(getcwd() . '/.session.vim')
		execute 'so ' . getcwd() . '/.session.vim'
		if bufexists(1)
			for l in range(1, bufnr('$'))
				if bufwinnr(l) == -1
					exec 'sbuffer ' . l
				endif
			endfor
		endif
	endif
	endfunction

	autocmd VimLeave * call SaveSess()
	autocmd VimEnter * nested call RestoreSess()
]]
