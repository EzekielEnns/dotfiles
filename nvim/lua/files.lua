require('harpoon').setup({})
local nnoremap = require("keys").nnoremap
local silent = {silent = true}


nnoremap("<leader>q",function () require("harpoon.ui").nav_file(1) end,silent)
nnoremap("<leader>w",function () require("harpoon.ui").nav_file(2) end,silent)
nnoremap("<leader>e",function () require("harpoon.ui").nav_file(3) end,silent)
nnoremap("<leader>r",function () require("harpoon.ui").nav_file(4) end,silent)

nnoremap("<leader>x",":Explore <CR>", silent)
nnoremap("<leader>a",function () require("harpoon.mark").add_file() end,silent)
nnoremap("<leader>z",function () require("harpoon.ui").toggle_quick_menu()end ,silent)

nnoremap("<leader>x",":Explore <CR>", silent)
--GFiles/Files, Ag, Rg, Buffers, commit
