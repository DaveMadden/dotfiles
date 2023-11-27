-- import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

saga.setup({
	scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
	definition = {
		keys = {
			edit = "<CR>",
			close = "<Esc>",
		},
	},
	action = {
		open = "<CR>",
	},
	ui = {
		colors = {
			normal_bg = "#022746",
		},
	},
	move_in_saga = { prev = "<C-k>", next = "<C-j>" },
	finder_action_keys = {
		open = "<CR>",
	},
	definition_action_keys = {
		edit = "<CR>",
	},
})

-- saga.setup({
-- 	-- keybinds for navigation in lspsaga window
-- 	scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
-- 	-- use enter to open file with definition preview
-- 	definition = {
-- 		keys = {
-- 			edit = "<CR>",
-- 			close = "<Esc>", --this doesn't work but i think it's because lspsaga is buggy tbh. there are no docs.
-- 		},
-- 	},
-- 	action = {
-- 		open = "<CR>",
-- 	},
-- 	ui = {
-- 		colors = {
-- 			normal_bg = "#022746",
-- 		},
-- 	},
-- })
--
-- saga.setup({
-- 	move_in_saga = { prev = "<C-k>", next = "<C-j>" },
-- 	finder_action_keys = {
-- 		open = "<CR>",
-- 	},
-- 	definition_action_keys = {
-- 		edit = "<CR>",
-- 	},
-- })
