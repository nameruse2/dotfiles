return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    },
  keys = {
    {'<leader>t', "<cmd>NvimTreeToggle<CR>", desc = '[T]ree' },	
},
  config = function()
    require('nvim-tree').setup{}
  end,
  }
