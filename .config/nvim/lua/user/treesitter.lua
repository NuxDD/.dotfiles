local treesitter = require("nvim-treesitter.configs")

treesitter.setup {
  ensure_installed = {"rust", "c", "python", "lua"},
  sync_install = false, 
  ignore_install = { "" }, 
  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = true,

  },
  indent = { enable = true, disable = { "yaml" } },
}
