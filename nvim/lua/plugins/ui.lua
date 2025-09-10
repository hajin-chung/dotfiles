return {
  -- colorscheme
  {
    "2nthony/vitesse.nvim",
    dependencies = { 
      { "tjdevries/colorbuddy.nvim", lazy=false }
    },
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme vitesse]])
    end
  },

  -- bottom fancy line
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        component_separators = '|',
        section_separators = '',
        theme = "vitesse",
      },
      sections = {
        lualine_a = {},
      },
    },
  },


  -- top buffer bar
  -- {
  --   'romgrk/barbar.nvim',
  --   init = function() vim.g.barbar_auto_setup = false end,
  --   opts = {
  --     animation = false,
  --     clickable = true,
  --     icons = {
  --       buffer_index = false,
  --       buffer_number = false,
  --       button = 'x',
  --       filetype = {
  --         enabled = false,
  --       },
  --     },
  --   },
  --   version = '^1.0.0',
  -- },
}
