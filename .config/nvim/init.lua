-- always set leader first!
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

-------------------------------------------------------------------------------
--
-- preferences
--
-------------------------------------------------------------------------------
-- make tmux looks normal
vim.opt.termguicolors = true
-- never ever folding
vim.opt.foldenable = false
vim.opt.foldmethod = 'manual'
vim.opt.foldlevelstart = 99
-- very basic "continue indent" mode (autoindent) is always on in neovim
-- could try smartindent/cindent, but meh.
-- vim.opt.cindent = true
-- XXX
-- vim.opt.cmdheight = 2
-- vim.opt.completeopt = 'menuone,noinsert,noselect'
-- not setting updatedtime because I use K to manually trigger hover effects
-- and lowering it also changes how frequently files are written to swap.
-- vim.opt.updatetime = 300
-- if key combos seem to be "lagging"
-- http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
-- vim.opt.timeoutlen = 300
-- keep more context on screen while scrolling
vim.opt.scrolloff = 2
-- never show me line breaks if they're not there
vim.opt.wrap = false
-- always draw sign column. prevents buffer moving when adding/deleting sign
vim.opt.signcolumn = 'yes'
-- sweet sweet relative line numbers
vim.opt.relativenumber = true
-- and show the absolute line number for the current line
vim.opt.number = true
-- keep current content top + left when splitting
vim.opt.splitright = true
vim.opt.splitbelow = true
-- infinite undo!
-- NOTE: ends up in ~/.local/state/nvim/undo/
vim.opt.undofile = true
--" Decent wildmenu
-- in completion, when there is more than one match,
-- list all matches, and only complete to longest common match
vim.opt.wildmode = 'list:longest'
-- when opening a file with a command (like :e),
-- don't suggest files like there:
vim.opt.wildignore = '.hg,.svn,*~,*.png,*.jpg,*.gif,*.min.js,*.swp,*.o,vendor,dist,_site'
-- tabs: go big or go home
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.expandtab = false
-- case-insensitive search/replace
vim.opt.ignorecase = true
-- unless uppercase in search term
vim.opt.smartcase = true
-- never ever make my terminal beep
vim.opt.vb = true
-- more useful diffs (nvim -d)
--- by ignoring whitespace
vim.opt.diffopt:append('iwhite')
--- and using a smarter algorithm
--- https://vimways.org/2018/the-power-of-diff/
--- https://stackoverflow.com/questions/32365271/whats-the-difference-between-git-diff-patience-and-git-diff-histogram
--- https://luppeng.wordpress.com/2020/10/10/when-to-use-each-of-the-git-diff-algorithms/
vim.opt.diffopt:append('algorithm:histogram')
vim.opt.diffopt:append('indent-heuristic')
-- show a column at 80 characters as a guide for long lines
-- vim.opt.colorcolumn = '80'
--- except in Rust where the rule is 100 characters
vim.api.nvim_create_autocmd('Filetype', { pattern = 'rust', command = 'set colorcolumn=100' })
-- show more hidden characters
-- also, show tabs nicer
vim.opt.listchars = 'tab:^ ,nbsp:¬,extends:»,precedes:«,trail:•'

-------------------------------------------------------------------------------
--
-- hotkeys
--
-------------------------------------------------------------------------------
-- quick-open
vim.keymap.set('', '<C-p>', '<cmd>Files<cr>')
vim.keymap.set('n', '<C-p>', ':Files')
-- vim.keymap.set("n", "<c-P>", require('fzf-lua').files, { desc = "Fzf Files" })
-- search buffers
vim.keymap.set('n', '<leader>;', '<cmd>Buffers<cr>')
-- quick-save
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>')
-- make missing : less annoying
vim.keymap.set('n', ';', ':')
-- Ctrl+j and Ctrl+k as Esc
-- vim.keymap.set('n', '<C-j>', '<Esc>')
-- vim.keymap.set('i', '<C-j>', '<Esc>')
-- vim.keymap.set('v', '<C-j>', '<Esc>')
-- vim.keymap.set('s', '<C-j>', '<Esc>')
-- vim.keymap.set('x', '<C-j>', '<Esc>')
-- vim.keymap.set('c', '<C-j>', '<Esc>')
-- vim.keymap.set('o', '<C-j>', '<Esc>')
-- vim.keymap.set('l', '<C-j>', '<Esc>')
-- vim.keymap.set('t', '<C-j>', '<Esc>')
-- Ctrl-j is a little awkward unfortunately:
-- https://github.com/neovim/neovim/issues/5916
-- So we also map Ctrl+k
vim.keymap.set('n', '<C-l>', '<Esc>')
vim.keymap.set('i', '<C-l>', '<Esc>')
vim.keymap.set('v', '<C-l>', '<Esc>')
vim.keymap.set('s', '<C-l>', '<Esc>')
vim.keymap.set('x', '<C-l>', '<Esc>')
vim.keymap.set('c', '<C-l>', '<Esc>')
vim.keymap.set('o', '<C-l>', '<Esc>')
vim.keymap.set('l', '<C-l>', '<Esc>')
vim.keymap.set('t', '<C-l>', '<Esc>')
-- Ctrl+h to stop searching
vim.keymap.set('v', '<C-h>', '<cmd>nohlsearch<cr>')
vim.keymap.set('n', '<C-h>', '<cmd>nohlsearch<cr>')
-- Jump to start and end of line using the home row keys
vim.keymap.set('', 'H', '^')
vim.keymap.set('', 'L', '$')
-- Neat X clipboard integration
-- <leader>p will paste clipboard into buffer
-- <leader>c will copy entire buffer into clipboard
vim.keymap.set('n', '<leader>p', '<cmd>read !wl-paste<cr>')
vim.keymap.set('n', '<leader>c', '<cmd>w !wl-copy<cr><cr>')
-- <leader><leader> toggles between buffers
vim.keymap.set('n', '<leader><leader>', '<c-^>')
-- <leader>, shows/hides hidden characters
vim.keymap.set('n', '<leader>,', ':set invlist<cr>')
-- always center search results
vim.keymap.set('n', 'n', 'nzz', { silent = true })
vim.keymap.set('n', 'N', 'Nzz', { silent = true })
vim.keymap.set('n', '*', '*zz', { silent = true })
vim.keymap.set('n', '#', '#zz', { silent = true })
vim.keymap.set('n', 'g*', 'g*zz', { silent = true })
-- "very magic" (less escaping needed) regexes by default
vim.keymap.set('n', '?', '?\\v')
vim.keymap.set('n', '/', '/\\v')
vim.keymap.set('c', '%s/', '%sm/')
-- open new file adjacent to current file
vim.keymap.set('n', '<leader>o', ':e <C-R>=expand("%:p:h") . "/" <cr>')
-- no arrow keys --- force yourself to use the home row
vim.keymap.set('n', '<up>', '<nop>')
vim.keymap.set('n', '<down>', '<nop>')
vim.keymap.set('i', '<up>', '<nop>')
vim.keymap.set('i', '<down>', '<nop>')
vim.keymap.set('i', '<left>', '<nop>')
vim.keymap.set('i', '<right>', '<nop>')
-- let the left and right arrows be useful: they can switch buffers
vim.keymap.set('n', '<left>', ':bp<cr>')
vim.keymap.set('n', '<right>', ':bn<cr>')
-- make j and k move by visual line, not actual line, when text is soft-wrapped
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
-- handy keymap for replacing up to next _ (like in variable names)
vim.keymap.set('n', '<leader>m', 'ct_')
-- F1 is pretty close to Esc, so you probably meant Esc
vim.keymap.set('', '<F1>', '<Esc>')
vim.keymap.set('i', '<F1>', '<Esc>')
-- auto include }
vim.keymap.set('i', '{<cr>', '{<cr>}<Esc>ko') 
-------------------------------------------------------------------------------
--
-- autocommands
--
-------------------------------------------------------------------------------
-- highlight yanked text
vim.api.nvim_create_autocmd(
	'TextYankPost',
	{
		pattern = '*',
		command = 'silent! lua vim.highlight.on_yank({ timeout = 500 })'
	}
)
-- jump to last edit position on opening file
vim.api.nvim_create_autocmd(
	'BufReadPost',
	{
		pattern = '*',
		callback = function(ev)
			if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
				-- except for in git commit messages
				-- https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
				if not vim.fn.expand('%:p'):find('.git', 1, true) then
					vim.cmd('exe "normal! g\'\\""')
				end
			end
		end
	}
)
-- prevent accidental writes to buffers that shouldn't be edited
vim.api.nvim_create_autocmd('BufRead', { pattern = '*.orig', command = 'set readonly' })
vim.api.nvim_create_autocmd('BufRead', { pattern = '*.pacnew', command = 'set readonly' })
-- leave paste mode when leaving insert mode (if it was on)
vim.api.nvim_create_autocmd('InsertLeave', { pattern = '*', command = 'set nopaste' })
-- help filetype detection (add as needed)
--vim.api.nvim_create_autocmd('BufRead', { pattern = '*.ext', command = 'set filetype=someft' })
-- correctly classify mutt buffers
local email = vim.api.nvim_create_augroup('email', { clear = true })
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
	pattern = '/tmp/mutt*',
	group = email,
	command = 'setfiletype mail',
})
-- also, produce "flowed text" wrapping
-- https://brianbuccola.com/line-breaks-in-mutt-and-vim/
vim.api.nvim_create_autocmd('Filetype', {
  pattern = 'mail',
  group = email,
  command = 'setlocal formatoptions+=w',
})
-- shorter columns in text because it reads better that way
local text = vim.api.nvim_create_augroup('text', { clear = true })
for _, pat in ipairs({'text', 'markdown', 'mail', 'gitcommit'}) do
	vim.api.nvim_create_autocmd('Filetype', {
		pattern = pat,
		group = text,
		command = 'setlocal spell tw=72 colorcolumn=73',
	})
end
--- tex has so much syntax that a little wider is ok
vim.api.nvim_create_autocmd('Filetype', {
	pattern = 'tex',
	group = text,
	command = 'setlocal spell tw=80 colorcolumn=81',
})
-- TODO: no autocomplete in text

-------------------------------------------------------------------------------
--
-- plugin configuration
--
-------------------------------------------------------------------------------
require("config.lazy")

-- require("lazy").setup({
-- 	-- quick navigation
-- 	{
-- 		'ggandor/leap.nvim',
-- 		config = function()
-- 			require('leap').create_default_mappings()
-- 		end
-- 	},
-- 	-- language support
-- 	-- terraform
-- 	{
-- 		'hashivim/vim-terraform',
-- 		ft = { "terraform" },
-- 	},
-- 	-- svelte
-- 	{
-- 		'evanleck/vim-svelte',
-- 		ft = { "svelte" },
-- 	},
-- 	-- toml
-- 	'cespare/vim-toml',
-- 	-- yaml
-- 	{
-- 		"cuducos/yaml.nvim",
-- 		ft = { "yaml" },
-- 		dependencies = {
-- 			"nvim-treesitter/nvim-treesitter",
-- 		},
-- 	},
-- 	-- rust
-- 	{
-- 		'rust-lang/rust.vim',
-- 		ft = { "rust" },
-- 		config = function()
-- 			vim.g.rustfmt_autosave = 1
-- 			vim.g.rustfmt_emit_files = 1
-- 			vim.g.rustfmt_fail_silently = 0
-- 			vim.g.rust_clip_command = 'wl-copy'
-- 		end
-- 	},
-- 	-- fish
-- 	-- 'khaveesh/vim-fish-syntax',
-- 	-- markdown
-- 	{
-- 		'plasticboy/vim-markdown',
-- 		ft = { "markdown" },
-- 		dependencies = {
-- 			'godlygeek/tabular',
-- 		},
-- 		config = function()
-- 			-- never ever fold!
-- 			vim.g.vim_markdown_folding_disabled = 1
-- 			-- support front-matter in .md files
-- 			vim.g.vim_markdown_frontmatter = 1
-- 			-- 'o' on a list item should insert at same level
-- 			vim.g.vim_markdown_new_list_item_indent = 0
-- 			-- don't add bullets when wrapping:
-- 			-- https://github.com/preservim/vim-markdown/issues/232
-- 			vim.g.vim_markdown_auto_insert_bullets = 0
-- 		end
-- 	},
-- })


