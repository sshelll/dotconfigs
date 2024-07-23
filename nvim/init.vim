" init.lua
lua require('init')

" vim script
for f in glob('~/.config/nvim/vimscript/*.vim', 0, 1)
    execute 'source' f
endfor
