
local notes_dir = vim.fn.expand("~/Documents/notes/")


-- Function to launch picker for ~/notes
local function pick_notes_files()
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
vim.keymap.set('n', '<leader>nf', pick_notes_files, { desc = "Pick a file in ~/notes/" })


local M = {}

function M.open_daily_note()
  local date = os.date("%Y-%m-%d") -- Get today's date
  local filepath = notes_dir .. "Journal/" .. date .. ".md" -- Build the full file path
  -- Create directory if it doesn't exist
  if vim.fn.isdirectory(notes_dir) == 0 then
    vim.fn.mkdir(notes_dir, "p")
  end
  vim.cmd("edit " .. filepath) -- Open the file
end


-- Prompt for a filename and open/create ~/notes/<filename>.md
function M.new_note()
  if vim.fn.isdirectory(notes_dir) == 0 then
    vim.fn.mkdir(notes_dir, "p")
  end
  -- Prompt user for a filename
  local filename = vim.fn.input("New note filename: ")
  if filename == nil or filename == "" then
    print("Canceled.")
    return
  end
  -- Ensure it ends with .md (optional)
  if not filename:match("%.md$") then
    filename = filename .. ".md"
  end

  local filepath = notes_dir .. filename
  vim.cmd("edit " .. vim.fn.fnameescape(filepath))
end

---------------------------------------------------------------------
-- Get list of existing daily notes sorted by date
---------------------------------------------------------------------
local function list_daily_notes()
  local notes_dir = vim.fn.expand("~/Documents/notes/Journal")
  local files = vim.fn.readdir(notes_dir)
  local dates = {}

  for _, f in ipairs(files) do
    if f:match("^%d%d%d%d%-%d%d%-%d%d%.md$") then
      table.insert(dates, f)
    end
  end

  table.sort(dates) -- lexicographic = chronological here
  return dates
end

---------------------------------------------------------------------
-- Get current filename if it's a daily note
---------------------------------------------------------------------
local function get_current_note()
  local file = vim.fn.expand("%:t")
  if file:match("^%d%d%d%d%-%d%d%-%d%d%.md$") then
    return file
  end
  return nil
end

---------------------------------------------------------------------
-- Move to previous or next existing note
---------------------------------------------------------------------
local function jump(delta)
  local current = get_current_note()
  if not current then
    print("Not in a daily note.")
    return
  end

  local notes = list_daily_notes()

  -- find current index
  local idx = nil
  for i, f in ipairs(notes) do
    if f == current then
      idx = i
      break
    end
  end

  if not idx then return end

  local target = notes[idx + delta]
  if not target then
    if delta == -1 then
      print("No previous daily note.")
    else
      print("No next daily note.")
    end
    return
  end

  local notes_dir = vim.fn.expand("~/Documents/notes/Journal")
  vim.cmd("edit " .. vim.fn.fnameescape(notes_dir .. "/" .. target))
end

function M.prev_daily_note()
  jump(-1)
end

function M.next_daily_note()
  jump(1)
end


return M

