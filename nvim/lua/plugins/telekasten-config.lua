return {
  "renerocksai/telekasten.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  cmd = { "Telekasten" },
  keys = {
    { "<leader>nb", "<cmd>Telekasten show_backlink<cr>", desc = "backlinks" },
    { "<leader>nf", "<cmd>Telekasten find_notes<cr>", desc = "find" },
    { "<leader>ng", "<cmd>Telekasten follow_link<cr>", desc = "goto link" },
    { "<leader>nl", "<cmd>Telekasten insert_link<cr>", desc = "insert link" },
    { "<leader>nn", "<cmd>Telekasten new_templated_note<cr>", desc = "new" },
    { "<leader>ns", "<cmd>Telekasten search_notes<cr>", desc = "search" },
    { "<leader>nt", "<cmd>Telekasten goto_today<cr>", desc = "today" },
  },
  config = function()
    require("telekasten").setup({
      home = vim.fn.expand("~/notes"),
      template_new_note = vim.fn.expand("~/personal/zettelkasten/templates/new_note.md"),
      template_daily = vim.fn.expand("~/personal/zettelkasten/templates/daily.md"),
      template_weekly = vim.fn.expand("~/notes/weekly.md"),
      media_previewer = "catimg-previewer",
      journal_auto_open = true,
    })
  end,
}
