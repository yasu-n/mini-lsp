-- LSP keymap

local K = {}

function K.setup(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "<space>h", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<space>H", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<space>d", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "<space>i", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<space>a", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<space>f", function()
        vim.lsp.buf.format { async = true }
    end, opts)
    vim.keymap.set("n", "<space>gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<space>r", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<space>/", vim.lsp.buf.document_symbol, opts)
    vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "<space>]", function()
        vim.diagnostic.jump { count = 1, float = true, }
    end, opts)
    vim.keymap.set("n", "<space>[", function()
        vim.diagnostic.jump { count = -1, float = true }
    end, opts)
    vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)
end

return K
