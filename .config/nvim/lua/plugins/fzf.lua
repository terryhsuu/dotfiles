 return {
  	{
  	  "junegunn/fzf",
  	  build = ":call fzf#install()",  -- Installs fzf binary automatically
  	},
  	{
  	  "junegunn/fzf.vim", -- Optional: Add fzf.vim for extra Neovim integration
  	  	config = function()
  	  		-- stop putting a giant window over my editor
  	  		vim.g.fzf_layout = { down = '~30%' }

			-- FZF key mappings
			vim.api.nvim_set_keymap('n', '<leader>fl', ':Lines<CR>', { noremap = true, silent = true })
			vim.api.nvim_set_keymap('n', '<leader>fb', ':BLines<CR>', { noremap = true, silent = true })
			vim.api.nvim_set_keymap('n', '<leader>ff', ':Files<CR>', { noremap = true, silent = true })
			vim.api.nvim_set_keymap('n', '<leader>fg', ':GFiles<CR>', { noremap = true, silent = true })
			vim.api.nvim_set_keymap('n', '<leader>f?', ':GFiles?<CR>', { noremap = true, silent = true })
			vim.api.nvim_set_keymap('n', '<leader>ft', ':Tags<CR>', { noremap = true, silent = true })
			vim.api.nvim_set_keymap('n', '<leader>fa', ':Ag<CR>', { noremap = true, silent = true })
			vim.api.nvim_set_keymap('n', '<leader>fc', ':Commits<CR>', { noremap = true, silent = true })
			vim.api.nvim_set_keymap('n', '<leader>bf', ':Buffers<CR>', { noremap = true, silent = true })
            -- FZF actions
			vim.g.fzf_action = {
			  ['ctrl-t'] = 'tab split',
			  ['ctrl-x'] = 'split',
			  ['ctrl-v'] = 'vsplit'
			}
			-- FZF colors
			vim.g.fzf_colors = {
			  fg      = { 'fg', 'Normal' },
			  bg      = { 'bg', 'Normal' },
			  hl      = { 'fg', 'Comment' },
			  ['fg+'] = { 'fg', 'CursorLine', 'CursorColumn', 'Normal' },
			  ['bg+'] = { 'bg', 'CursorLine', 'CursorColumn' },
			  ['hl+'] = { 'fg', 'Statement' },
			  info    = { 'fg', 'PreProc' },
			  prompt  = { 'fg', 'Conditional' },
			  pointer = { 'fg', 'Exception' },
			  marker  = { 'fg', 'Keyword' },
			  spinner = { 'fg', 'Label' },
			  header  = { 'fg', 'Comment' }
			}

			-- FZF history
			vim.g.fzf_history_dir = vim.fn.expand('~/.local/share/fzf-history')
  	  	end
  	}
 }
