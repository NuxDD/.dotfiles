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
