require('nvim-treesitter.configs').setup {
    ensure_installed = { 'lua', 'python', 'rust' },
    auto_install = false,
    highlight = { enable = true },
    indent = { enable = true },
}
