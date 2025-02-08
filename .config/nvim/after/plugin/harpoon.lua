local status_ok, harpoon = pcall(require, "harpoon")
if not status_ok then
	return
end

mark = require("harpoon.mark")
ui = require("harpoon.ui")

harpoon.setup({
	tabline = true,
	menu = {
		width = vim.api.nvim_win_get_width(0) - 20,
	},
})

vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=#63698c')
vim.cmd('highlight! HarpoonActive guibg=NONE guifg=white')
vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7')
vim.cmd('highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7')
vim.cmd('highlight! TabLineFill guibg=NONE guifg=white')
