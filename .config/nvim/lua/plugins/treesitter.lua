-- lua/plugins/treesitter.lua

return {
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { "cpp", "rust", "python" }, -- Add your language here
		highlight = { enable = true },
		fold = { enable = false },
		matchup = {
			enable = true,              -- mandatory, false will disable the whole extension
			-- [options]
		},
      }
    end
  }
}

