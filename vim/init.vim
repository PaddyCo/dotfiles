" Keybindings

" - Find project
execute 'source ' . expand("~/.dotfiles/vim/project-switcher.vim")
nmap <leader>pp :call SwitchProject()<CR>

" - Build
nmap <leader>bm make

" - Open scratchpad
nmap <leader>x :split <bar> :wincmd j <bar> :e ~/.scratch<CR>

" - Easymotion
nmap <Leader>ss <Plug>(easymotion-overwin-f2)
nmap <Leader>sw <Plug>(easymotion-overwin-w)

" - CA65 Assembler
augroup filetypedetect
    au BufNewFile,BufRead *.s,*.inc set ft=asm_ca65
augroup END
