return {
  -- Detect tabstop and shiftwidth automatically
  "tpope/vim-sleuth",

  -- Adds git related signs to the gutter, as well as utilities for managing changes
  { 
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
  },

  {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  },

  -- Highlight todo, notes, etc in comments
  { 
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  },

  -- file explorer
  {
    'stevearc/oil.nvim',
    opts = {
      default_file_explorer = true,
      columns = {
        "permissions", "size", { "mtime", format = "%Y.%m.%d %T" },
      },
      use_default_keymaps = true,
      view_options = {
        show_hidden = true,

        sort = {
          { "type", "asc" },
          { "name", "asc" },
        }
      }
    },
  },
}
