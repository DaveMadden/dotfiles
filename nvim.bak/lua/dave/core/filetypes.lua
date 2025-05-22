-- Automatically set filetype for .templ files
vim.api.nvim_exec(
	[[
  augroup TemplFileType
    autocmd!
    autocmd BufNewFile,BufRead *.templ set filetype=templ
  augroup END
]],
	false
)
