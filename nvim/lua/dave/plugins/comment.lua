-- import comment plugin safely
local setup, comment = pcall(require, "Comment")
if not setup then
	return
end

-- enable comment
comment.setup()

-- Add an autocommand to set the commentstring for templ files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "templ",
	callback = function()
		-- Set the comment string for templ files to JavaScript-style comments
		vim.bo.commentstring = "// %s"
	end,
})
