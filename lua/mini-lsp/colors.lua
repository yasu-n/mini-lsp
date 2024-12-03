-- LSP color
local C = {}

function C.setup(client, bufnr)
    if client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_set_option_value('updatetime', 500, { scope = 'global' })
        vim.api.nvim_set_hl(0, "LspReferenceText", { bg = "DarkGray" })
        vim.api.nvim_set_hl(0, "LspReferenceRead", { bg = "DarkGray" })
        vim.api.nvim_set_hl(0, "LspReferenceWrite", { bg = "DarkGray" })
        vim.api.nvim_set_hl(0, "LspReferenceTarget", { bg = "DarkGray" })

        vim.api.nvim_create_augroup("lsp_document_highlight", {
            clear = true
        })

        vim.api.nvim_clear_autocmds {
            buffer = bufnr,
            group = "lsp_document_highlight"
        }

        vim.api.nvim_create_autocmd("CursorHold", {
            callback = vim.lsp.buf.document_highlight,
            buffer = bufnr,
            group = "lsp_document_highlight",
            desc = "Document Highlight",
        })

        vim.api.nvim_create_autocmd("CursorMoved", {
            callback = vim.lsp.buf.clear_references,
            buffer = bufnr,
            group = "lsp_document_highlight",
            desc = "Clear All the Refereneces",
        })
    end
end

return C;
