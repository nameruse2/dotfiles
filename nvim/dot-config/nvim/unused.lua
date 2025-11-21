
--Comment toggle mapping for multiple modes
local function toggle_comment()
  local count = vim.v.count
  vim.cmd.normal { (count > 0 and count or "") .. "gcc", bang = false }
end

--Apply to several modes at once
local modes = { "n", "v", "x", "o" }
for _, mode in ipairs(modes) do
  vim.keymap.set(mode, "<leader>c", toggle_comment, { desc = "Toggle comment" })
end
