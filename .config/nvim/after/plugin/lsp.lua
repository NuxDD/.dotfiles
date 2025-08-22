-- LSP on_attach function
local on_attach = function(_, bufnr)
    local bufmap = function(keys, func)
        vim.keymap.set('n', keys, func, { buffer = bufnr })
    end
    
    bufmap('<leader>r', vim.lsp.buf.rename)
    bufmap('<leader>ca', vim.lsp.buf.code_action)
	bufmap('gd', function()
		vim.lsp.buf.definition({
			on_list = function(options)
				if #options.items == 1 then
					-- Single location: jump directly using proper LSP utilities
					local item = options.items[1]
					vim.cmd('edit ' .. vim.fn.fnameescape(item.filename))
					vim.api.nvim_win_set_cursor(0, {item.lnum, item.col - 1})
				else
					-- Multiple locations: show quickfix
					vim.fn.setqflist({}, ' ', options)
					vim.cmd('cfirst')
				end
			end
		})
	end)
    bufmap('gD', vim.lsp.buf.declaration)
    bufmap('gI', vim.lsp.buf.implementation)
    bufmap('<leader>D', vim.lsp.buf.type_definition)
    bufmap('gr', require('telescope.builtin').lsp_references)
    bufmap('gs', require('telescope.builtin').lsp_document_symbols)
    bufmap('gS', require('telescope.builtin').lsp_dynamic_workspace_symbols)
    bufmap('K', vim.lsp.buf.hover)
    
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, {})
end
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Mason setup
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "rust_analyzer" },
})

local function setup_lsp_servers()
    local lspconfig = require('lspconfig')
    local installed_servers = require("mason-lspconfig").get_installed_servers()
    
    local default_setup = {
        on_attach = on_attach,
        capabilities = capabilities,
    }
    
    -- Custom configurations for specific servers
    local custom_configs = {
        lua_ls = function()
            require('neodev').setup()
            lspconfig.lua_ls.setup(vim.tbl_deep_extend("force", default_setup, {
                settings = {
                    Lua = {
                        workspace = { checkThirdParty = false },
                        telemetry = { enable = false },
                    },
                }
            }))
        end,
    }
    
    for _, server_name in ipairs(installed_servers) do
        if custom_configs[server_name] then
            custom_configs[server_name]()
        else
            lspconfig[server_name].setup(default_setup)
        end
    end
end
setup_lsp_servers()
