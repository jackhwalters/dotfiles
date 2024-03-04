local lsp_zero = require('lsp-zero')
local dap = require('dap')

lsp_zero.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

local lspconfig = require('lspconfig')
require('mason').setup({
    ensure_installed = {
        "debugpy",
        "codelldb",
    }
})
require('mason-lspconfig').setup({
    ensure_installed = {
        "pyright",
        "bashls",
        "clangd",
        "tsserver",
        "lua_ls"
    },
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            lspconfig.lua_ls.setup(lsp_zero.nvim_lua_ls())
        end,
        pyright = function()
            lspconfig.pyright.setup(lsp_zero.nvim_lua_ls())
        end,
        clangd = function()
            lspconfig.clangd.setup(lsp_zero.nvim_lua_ls())
        end,
        tsserver = function()
            lspconfig.tsserver.setup(lsp_zero.nvim_lua_ls())
        end,
    }
})

dap.configurations.cpp = {
    {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
        runInTerminal = true,
    }
}

dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/local/bin/lldb-vscode',
    name = 'lldb'
}

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'luasnip', keyword_length = 2 },
        { name = 'buffer',  keyword_length = 3 },
    },
    formatting = lsp_zero.cmp_format(),
    mapping = cmp.mapping.preset.insert({
        ['<s-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
})
