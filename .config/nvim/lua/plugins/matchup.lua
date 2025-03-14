return {
	-- better %
	{
		'andymass/vim-matchup',
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }

			-- Custom highlight for MatchParen
			vim.cmd("hi MatchParen ctermbg=white guibg=white ctermfg=black guifg=black cterm=NONE gui=NONE")
		end
	},
}
