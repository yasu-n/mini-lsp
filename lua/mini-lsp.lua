--- mini-lsp.lua

local M = {}

--- Start LSP server
--- @param conf vim.lsp.ClientConfig
--- @param opts vim.lsp.start.Opts?
local function start(conf, opts)
    conf = vim.tbl_deep_extend('force', conf, require(conf.name) or {})
    vim.lsp.start(conf, opts or {})
end

--- LspAttach autocmd
--- @param on_attach fun(in: vim.lsp.Client|nil, in: integer)
function M.on_attach(on_attach)
    vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
            local bufnr = args.buf
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            on_attach(client, bufnr)
        end,
    })
end

function M.setup(conf, opts)
    start(conf, opts)
end


return M
