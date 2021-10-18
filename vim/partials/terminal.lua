-- Enter Terminal-mode (insert) automatically
-- Disables number lines on terminal buffers
-- allows you to use Ctrl-c on terminal window
-- Escape to unfocus terminal
-- C-v Esc to send Escape to terminal (verbatim escape)
vim.api.nvim_exec([[
    augroup neovim_terminal
      autocmd!
      autocmd TermOpen * startinsert
      autocmd TermOpen * :set nonumber norelativenumber
      autocmd TermOpen * tnoremap <buffer> <C-c> i<C-c>
      autocmd TermOpen * tnoremap <buffer> <Esc> <C-\><C-n>
      autocmd FileType fzf tunmap <buffer> <Esc>
      autocmd TermOpen * tnoremap <buffer> <C-v><Esc> <Esc>
    augroup END
]], false)
