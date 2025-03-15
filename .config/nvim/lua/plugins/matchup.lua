return {
	-- better %
	{
		'andymass/vim-matchup',
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
			vim.g.matchup_matchparen_enabled = 1
			-- Custom highlight for MatchParen
			vim.cmd("hi MatchParen ctermbg=grey guibg=grey ctermfg=black guifg=black cterm=NONE gui=NONE")
		end
	},
}
