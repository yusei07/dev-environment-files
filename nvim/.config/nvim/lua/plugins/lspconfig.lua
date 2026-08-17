return {
  'neovim/nvim-lspconfig',
  config = function()
    vim.lsp.config('graphql', {
      filetypes = { 'graphql', 'gql' },
    })

    vim.lsp.config('lua_ls', {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    })

    vim.lsp.config('vimls', {})
    vim.lsp.config('html', {})
    vim.lsp.config('tailwindcss', {})
    vim.lsp.config('ts_ls', {})
    vim.lsp.config('cssls', {})
    vim.lsp.config('pylsp', {})

    vim.lsp.config('emmet_ls', {
      filetypes = { 'html', 'css', 'javascriptreact', 'typescriptreact' },
    })

    vim.lsp.config('sourcekit', {
      cmd = { 'sourcekit-lsp' },
      filetypes = { 'swift' },
    })

    vim.lsp.enable({
      'graphql',
      'lua_ls',
      'vimls',
      'html',
      'tailwindcss',
      'ts_ls',
      'cssls',
      'pylsp',
      'emmet_ls',
    })
  end,
}
