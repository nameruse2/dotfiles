return {
  { "catppuccin/nvim", 
    name = "catppuccin" },

  { 'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'onedark'
    end,
  },

  { 'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

 -- { 'lukas-reineke/indent-blankline.nvim',
   -- opts = {
     -- char = '┊',
      --show_trailing_blankline_indent = false,
    --},
  --},

  {'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {},
  },
}
