function ColorMyPencils(color)
	color = color or "everforest"
	vim.cmd.colorscheme(color)
-- this makes the active window transparent. not sure if I actually like that but will leave it for now
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- ColorMyPencils()

function Cobaltify()
    print('cobaltify');
    require('colorbuddy').colorscheme('cobalt2');
--    vim.cmd.colorscheme('cobalt2')
end

--vim.cmd.cobaltify()
Cobaltify();

function Newmoon()
    print('newmoon');
    vim.cmd.colorscheme('new-moon')
end
