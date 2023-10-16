-- local dap = require('dap')
local dap_go = require("nvim-dap-go")
local widgets = require("dap.ui.widgets")

vim.keymap.set("n", "<leader>db", function()
	vim.cmd("DapToggleBreakpoint")
end)

vim.keymap.set("n", "<leader>dus", function()
	local sidebar = widgets.sidebar(widgets.scopes)
	sidebar.open()
end)

vim.keymap.set("n", "<leader>dgt", function()
	dap_go.debug_test()
end)

vim.keymap.set("n", "<leader>dgl", function()
	dap_go.debug_last()
end)

vim.keymap.set("n", "<leader>gsj", function()
	vim.cmd("GoTagAdd json")
end)

vim.keymap.set("n", "<leader>gsy", function()
	vim.cmd("GoTagAdd yaml")
end)
