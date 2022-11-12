--dignostic info display 
vim.diagnostic.config({
  virtual_text={
      format=function(diagnostic)
          return string.format("%.91s%s", diagnostic.message,
                            (string.len(diagnostic.message) > 91 and '...' or ''))
        end
    },
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = false,
})

--lsp actions
local on_attach = function (client, bufner)
    vim.api.nvim_buf_set_option(bufner, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    --hover display
    vim.api.nvim_create_autocmd("CursorHold", {
      callback = function()
        local opts = {
          focusable = false,
          close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
          border = 'rounded',
          source = 'always',
          prefix = ' ',
          scope = 'cursor',
        }
        vim.diagnostic.open_float(nil, opts)
      end
    })
    local nnoremap = require("keys").nnoremap
    local opts = {silent = true,buffer=bufner}
    nnoremap('gD',vim.lsp.buf.declaration,opts)
    nnoremap('gd',vim.lsp.buf.definition,opts)
    nnoremap('gi',vim.lsp.buf.implementation,opts)
    nnoremap('gr',vim.lsp.buf.references,opts)
end

-- code completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
vim.g.coq_settings = { auto_start='shut-up' }
capabilities = require('coq').lsp_ensure_capabilities(capabilities)

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local lspconfig = require('lspconfig')
-- LSP servers
    lspconfig.sumneko_lua.setup {
      settings = {
        Lua = {
          runtime = { version = 'LuaJIT', },
          diagnostics = { globals = {'vim'}, },
          workspace = { library = vim.api.nvim_get_runtime_file("", true), },
          telemetry = { enable = false, },
        },
      },
      --TODO add this to all configs 
      capabilities = capabilities,
      on_attach = on_attach,
    }
    lspconfig.tsserver.setup{
      capabilities = capabilities,
      on_attach = on_attach,
    }
    lspconfig.emmet_ls.setup{
      capabilities = capabilities,
      on_attach = on_attach,
    }
    lspconfig.cssls.setup{
        capabilities = capabilities,
        on_attach = on_attach
    }
    lspconfig.cssmodules_ls.setup{
        capabilities = capabilities,
        on_attach = on_attach,
    }

--git gutters
vim.opt.updatetime = 100
vim.opt.signcolumn = "yes"
--syntax highlighting 
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "rust" },
  sync_install = false,
  auto_install = true,
  ignore_install = { "javascript" },
  highlight = {
    enable = true,
    disable = { "c", "rust" },
    additional_vim_regex_highlighting = false,
  },
}

--coming soon
require("null-ls").setup()
