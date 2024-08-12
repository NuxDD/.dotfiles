local colorscheme = "rose-pine-main"
--local colorscheme = "catppuccin-mocha"

function set_colorscheme(colorscheme)
	local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
	if not status_ok then
		vim.notify("colorscheme " .. colorscheme .. " not found!")
		return
	end
end

function switch_colorscheme()
	local x = vim.api.nvim_eval("g:colors_name")
	local	colorscheme = " "
	if x == "rose-pine" then
		colorscheme = "catppuccin-mocha"
	else
		colorscheme = "rose-pine-main"
	end
	set_colorscheme(colorscheme)
end

set_colorscheme(colorscheme)
