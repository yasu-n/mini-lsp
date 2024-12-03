--- rust_analyzer.lua
--- rust-analyzer configuration 

--- Reload workspace
--- @param bufnr integer buffer no
local function reload_workspace(bufnr)
    local clients = vim.lsp.get_clients({ bufnr = bufnr, name = 'rust_analyzer' })
    for _, client in ipairs(clients) do
        vim.notify 'Reload Cargo Workspace'
        client.request('rust-analyzer/reloadWorkspace', nil, function(err)
            if err then
                error(tostring(err))
            end
            vim.notify('Cargo workspace reload')
        end, 0)
    end
end

--- Get workspace root
--- @return string workspace_root workspace root directory
local function workspace_root()
    local dir = vim.fs.root(0, {'Cargo.toml'})
    local result = vim.system({
        'cargo',
        'metadata',
        '--no-deps',
        '--format-version',
        '1'
    })
    if result and result[1] then
        result = vim.json.decode(table.concat(result, ''))
        if result['workspace_root'] then
            dir = vim.fs.normalize(result['workspace_root'])
        end
    end
    return dir 
end

return {
    name = 'rust_analyzer',
    cmd = { 'rust-analyzer' },
    root_dir = vim.fs.root(0, { 'Cargo.toml' }),
    workspace_root = workspace_root,
    settings = {

    },
    capabilities = {
        experimental = {
            serverStatusNotification = true,
        },
    },
    before_init = function(init_params, config)
        if config.settings and config.settings['rust-analyzer'] then
            init_params.initializationOptions = config.settings['rust-analyzer']
        end
    end,
    commands = {
        CargoReload = {
            function()
                reload_workspace(0)
            end,
        }
    }
}
