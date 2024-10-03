return {
	{
	"neoclide/coc.nvim",
	branch = 'release',
	config = function()
		local keyset = vim.keymap.set
      -- Add any custom Coc configuration here
      -- Example: enable language servers and configure coc.nvim key mappings
		-- GoTo code navigation
		keyset("n", "gd", "<Plug>(coc-definition)", {silent = true})
		keyset("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
		keyset("n", "gi", "<Plug>(coc-implementation)", {silent = true})
		keyset("n", "gr", "<Plug>(coc-references)", {silent = true})

      -- Other Coc-specific settings
      vim.cmd([[ 
        " Trigger completion with <Tab>
        inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
        inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

        " Use <CR> to confirm completion
        inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
      ]])
    end
	},
}
