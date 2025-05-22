-- local dap = require('dap')
-- local dap_go = require("nvim-dap-go")
local widgets = require("dap.ui.widgets")

local dap = require("dap")

dap.configurations.go = {
	{
		type = "go",
		name = "Launch",
		request = "launch",
		program = "${file}",
		dlvToolPath = vim.fn.exepath("dlv"), -- Adjust to your `dlv` path if necessary
	},
}

local dap_go_setup, dap_go = pcall(require, "dap-go")
if not dap_go_setup then
	return
end

dap_go.setup({
	dap_configurations = {
		{ type = "go", name = "Attach remote", mode = "remote", request = "attach" },
	},
	delve = {
		-- the path to the executable dlv which will be used for debugging.
		-- by default, this is the "dlv" executable on your PATH.
		path = "dlv",
		-- time to wait for delve to initialize the debug session.
		-- default to 20 seconds
		initialize_timeout_sec = 20,
		-- a string that defines the port to start delve debugger.
		-- default to string "${port}" which instructs nvim-dap
		-- to start the process in a random available port
		port = "${port}",
		-- additional args to pass to dlv
		args = {},
		-- the build flags that are passed to delve.
		-- defaults to empty string, but can be used to provide flags
		-- such as "-tags=unit" to make sure the test suite is
		-- compiled during debugging, for example.
		-- passing build flags using args is ineffective, as those are
		-- ignored by delve in dap mode.
		build_flags = "",
	},
})

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
