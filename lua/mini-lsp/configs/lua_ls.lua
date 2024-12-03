--- lua_ls.lua
--- lua-language-server configuration

local root_files = {
    '.luarc.json',
    '.luarc.jsonc',
    '.luacheckrc',
}

return {
    name = 'lua_ls',
    cmd = { 'lua-language-server' },
    root_dir = vim.fs.find(root_files, { upward = true }),
    single_file_support = true,
    log_level = vim.lsp.protocol.MessageType.Warning,
}
