function! SwitchProject()
  let l:opts = {
              \ 'sink': function('SwitchToProjectDir'),
              \ 'source': 'ls -d ~/projects/*',
              \ 'down': '40%'
              \ }
  call fzf#run(fzf#wrap(l:opts))
endfunction

function! SwitchToProjectDir(projectLine)
  execute 'cd ' . a:projectLine
  :Files
endfunction
