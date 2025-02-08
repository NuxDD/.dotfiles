require('nvim-treesitter.configs').setup {
    ensure_installed = { 'lua', 'python', 'typescript', 'html', 'css', 'javascript' },
    auto_install = false,
    highlight = { enable = true },
    indent = { enable = true },
}
