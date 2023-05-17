return {
  'nvim-orgmode/orgmode',
  dependencies = { 
    'nvim-treesitter/nvim-treesitter',
    'joaomsa/telescope-orgmode.nvim'},
  lazy = false,
  config = function()
    require('orgmode').setup_ts_grammar()
    require('orgmode').setup({
      org_agenda_files = {'~/org/*'},
      org_default_notes_file = '~/org/Inbox.org',
      org_archive_location = '~/org/archive2023.org',
      org_todo_keywords = {'TODO', 'WAITING', '|', 'DONE'},
      win_split_mode = 'auto',
      org_log_done = 'time',
      org_hide_leading_stars = true,
      org_deadline_warning_days = 1,
      org_agenda_skip_scheduled_if_done = true,
      org_agenda_skip_deadline_if_done = true,
      org_capture_templates = {
        n = { description = 'Note', template = '* %?'},
        t = { description = 'Todo', template = '* TODO %?'}
      },
  })
  require('telescope').load_extension('orgmode')
  end,
}

-- -- Get link concealing working
-- vim.opt.conceallevel = 2
-- vim.opt.concealcursor = 'nc'

-- vim.keymap.set('n', '<leader>of', require('telescope').extensions.orgmode.search_headings, { desc = '[F]ind headings' })
