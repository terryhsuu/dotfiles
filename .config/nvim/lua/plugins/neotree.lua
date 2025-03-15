--
--
-- <leader>e	Toggle Neo-tree
-- <leader>b	Show open buffers in Neo-tree
-- <CR>	Open file but keep focus in Neo-tree
-- d	Delete selected file
-- r	Rename selected file
-- a	Create a new file or directory
-- q	Close Neo-tree
-- 
return {
  {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,      -- ❌ Don't hide dotfiles
          always_show = { ".*" },     -- ✅ Ensure dotfiles are always visible
        },
        follow_current_file = true,
        use_libuv_file_watcher = true,
        hijack_netrw_behavior = "open_default",
        cwd_target = "git_root", -- Start Neo-tree from the Git root
      },
      window = {
        width = 30,
        mappings = {
          ["<CR>"] = "open",
          ["q"] = "close_window",
          ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
          ["l"] = "focus_preview",
          ["<C-b>"] = { "scroll_preview", config = {direction = 10} },
          ["<C-f>"] = { "scroll_preview", config = {direction = -10} },
        },
      },
    })
    -- Toggle Neo-tree with <leader>e
    vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { noremap = true, silent = true })
  end,
},
}

