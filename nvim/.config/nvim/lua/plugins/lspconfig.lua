return {
  'neovim/nvim-lspconfig',
  config = function()
    local lspconfig = require('lspconfig')

    -- graphql
    lspconfig.graphql.setup({
      filetypes = {
        'graphql',
        'gql',
      },
    })

    -- lua
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    })

    lspconfig.vimls.setup({}) -- vim-language-server
    lspconfig.html.setup({})
    lspconfig.tailwindcss.setup({})
    lspconfig.ts_ls.setup({})
    lspconfig.cssls.setup({})
    lspconfig.pylsp.setup({})
    lspconfig.emmet_ls.setup({
      filetypes = { 'html', 'css', 'javascriptreact', 'typescriptreact' },
    })
  end,
}
