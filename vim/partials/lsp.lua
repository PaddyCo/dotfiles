-- Language servers
-- See https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md for supported language servers

-- Rust
require'lspconfig'.rls.setup{
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
} 

-- Javascript/Typescript
require'lspconfig'.tsserver.setup{
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}
