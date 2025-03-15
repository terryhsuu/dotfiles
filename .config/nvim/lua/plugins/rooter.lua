return {
  {
    'notjedi/nvim-rooter.lua',
    config = function()
      require('nvim-rooter').setup {
        manual = false
      }
    end
  }
}
