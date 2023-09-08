vim.g.everforest_background = "hard"
vim.g.everforest_ui_contrast = "high"

local status, _ = pcall(function()
	vim.cmd("colorscheme everforest")
end)

if not status then
	print("colorscheme not found")
	return
end
