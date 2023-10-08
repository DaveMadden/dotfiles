vim.g.everforest_background = "hard"
vim.g.everforest_ui_contrast = "high"
vim.g.everforest_transparent_background = "0" -- 1 is transparent, 2 changes other ui elements

local status, _ = pcall(function()
	vim.cmd("colorscheme everforest")
end)

if not status then
	print("colorscheme not found")
	return
end
