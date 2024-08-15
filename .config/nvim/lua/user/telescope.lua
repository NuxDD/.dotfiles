local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

telescope.load_extension('media_files')

local vimgrep_arguments = { unpack(require("telescope.config").values.vimgrep_arguments) }

-- Live grep search in hidden/dot files but exclude git files.
table.insert(vimgrep_arguments, "--hidden")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

local actions = require "telescope.actions"

telescope.setup {
	defaults = {

		vimgrep_arguments = vimgrep_arguments,
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },

		mappings = {
			i = {
				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,

				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,

				["<C-c>"] = actions.close,
				["<C-t>"] = actions.select_tab,

				["<CR>"] = actions.select_default,
				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,
			},

			n = {
				["<ESC>"] = actions.close,
				["<CR>"] = actions.select_default,

				["j"] = actions.move_selection_next,
				["k"] = actions.move_selection_previous,
				["H"] = actions.move_to_top,
				["M"] = actions.move_to_middle,
				["L"] = actions.move_to_bottom,

				["gg"] = actions.move_to_top,
				["G"] = actions.move_to_bottom,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["?"] = actions.which_key,
			},
		},
	},

	extensions = {
		media_files = {
			filetypes = {"png", "webp", "jpg", "jpeg"},
			find_cmd = "rg"
		}
	},
}
