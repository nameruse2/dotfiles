
-- Function to launch picker for ~/notes
local function pick_notes_files()
  local notes_dir = vim.fn.expand("~/Documents/notes/")
  -- gather files under notes_dir (recursive)
  local files = {}
  for path, type in vim.fs.dir(notes_dir, {depth = 4, hidden = true}) do
    if type == "file" then
      table.insert(files, vim.fs.joinpath(notes_dir, path))
    end
  end

  -- Define source
  local source = {
    name = "NotesFiles",
    cwd  = notes_dir,
    items = files,
    preview = function(buf_id, item)
      -- read first ~100 lines of the file for preview
      local lines = vim.fn.readfile(item, '', 100)
      vim.api.nvim_buf_set_lines(buf_id, 0, -1, false, lines)
    end,
    choose = function(item)
      if not item then return end
      vim.cmd.edit(item)
    end,
  }

  -- Start the picker
  require('mini.pick').start({ source = source })
end

-- Map a key for ease of use, e.g. <leader>n
vim.keymap.set('n', '<leader>n', pick_notes_files, { desc = "Pick a file in ~/notes/" })



