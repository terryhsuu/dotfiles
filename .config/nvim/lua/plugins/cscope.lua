return {
  {
    "dhananjaylatkar/cscope_maps.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim", -- Optional: for using Telescope picker
    },
    config = function()
      require("cscope_maps").setup({
        -- Setup options
        disable_maps = false, -- true if you want to define your own maps
        skip_input_prompt = false, -- "true" to skip input prompt
        prefix = "<leader>c", -- The prefix for keymaps (e.g., <leader>cs for symbol)
        
        cscope = {
          -- Configuration for the cscope db
          db_file = "./cscope.out", -- Location of the cscope db file
          exec = "cscope", -- "cscope" or "gtags-cscope"
          picker = "telescope", -- "telescope", "fzf-lua" or "quickfix"
          skip_picker_for_single_result = false, 
		  db_build_cmd = { args = { "-b", "-q" } },
        },
      })
    end,
  }
}
