-- Language servers
-- See https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md for supported language servers

-- Rust
require'lspconfig'.rls.setup{} 

-- Javascript/Typescript
require'lspconfig'.tsserver.setup{}
