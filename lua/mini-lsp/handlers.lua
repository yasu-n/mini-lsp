-- LSP handlers

local R = {}

function R.setup(client, bufnr)
    vim.diagnostic.config({
        virtual_text = false,
        underline = true,
    })

    vim.lsp.buf.hover({
        border = "single",
    })

    vim.lsp.buf.signature_help({
        border = "single",
    })
    --vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    --    vim.lsp.buf.hover, { border = "rounded", }
    --)

    --vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    --    vim.lsp.buf.signature_help, { border = "single", }
    --)

end

return R
