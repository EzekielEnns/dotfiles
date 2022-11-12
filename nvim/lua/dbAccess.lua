local nnoremap = require("keys").nnoremap
local silent = {silent = true}

nnoremap("<leader>d",":DBUIToggle<CR>",silent)

--vim.cmd [[ autocmd BufAdd * if bufname() ==# "<dbui>" | call set_special_buffer_options() | endif
--https://learnvimscriptthehardway.stevelosh.com/chapters/23.html
--https://vimdoc.sourceforge.net/htmldoc/autocmd.html
--https://www.reddit.com/r/neovim/comments/t0xysw/how_to_set_some_different_options_for_some/
