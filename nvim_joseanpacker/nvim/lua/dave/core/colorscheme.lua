vim.g.everforest_background = 'hard'
vim.g.everforest_ui_contrast = 'high'

local status, _ = pcall(vim.cmd, "colorscheme everforest")
if not status then
  print("colorscheme not found")
  return
end
