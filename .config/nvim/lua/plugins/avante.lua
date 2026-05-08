return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, 
  opts = {
    provider = "gemini",
    -- 【修改這裡】將 gemini 的設定包在 providers 裡面
    providers = {
      gemini = {
        model = "gemini-1.5-pro-latest", 
        temperature = 0,
        max_tokens = 4096,
      },
    },
  },
  build = "make", 
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    "HakonHarnes/img-clip.nvim",
  },
}
