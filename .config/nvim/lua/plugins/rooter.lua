return {
-- 'airblade/vim-rooter'
  {
      'notjedi/nvim-rooter.lua',
      config = function()
          require('nvim-rooter').setup()
      end
  },
}
