require'nvim-web-devicons'.setup {
     -- your personnal icons can go here (to override)
     -- you can specify color or cterm_color instead of specifying both of them
     -- DevIcon will be appended to `name`
     override = {
      zsh = {
        icon = "",
        color = "#428850",
        cterm_color = "65",
        name = "Zsh"
      }
     };
     -- globally enable default icons (default to false)
     -- will get overriden by `get_icons` option
     default = true;
}

--Color scheme
require('one-nvim')
vim.cmd [[
    set background=dark
    colorscheme one-nvim
]]

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

--Transparency
local _get_darken = false
function _G.toggle_background_transparent()
  if (not _get_darken) then
    vim.cmd("hi Normal guibg=#151515")
    vim.cmd("set background=dark")
    _get_darken = true
  else
    vim.cmd("hi Normal guibg=NONE")
    vim.cmd("hi Folded guibg=none ctermbg=none")
    vim.cmd("hi SignColumn guibg=none ctermbg=none")
    _get_darken = false
  end
end
local nnoremap = require("keys").nnoremap
nnoremap("<leader>t",toggle_background_transparent ,{silent = true})

