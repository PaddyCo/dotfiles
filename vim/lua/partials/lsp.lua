-- Language servers
-- See https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md for supported language servers
require'lspconfig'.rls.setup{} -- Rust
require'lspconfig'.tsserver.setup{} -- Javascript/Typescript

