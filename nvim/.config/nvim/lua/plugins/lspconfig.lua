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
    vim.lsp.config('pylsp', {
      settings = {
        pylsp = {
          plugins = {
            pycodestyle = {
              ignore = { 'E501' }, -- line too long
            },
          },
        },
      },
    })

    vim.lsp.config('emmet_ls', {
      filetypes = { 'html', 'css', 'javascriptreact', 'typescriptreact' },
    })

    vim.lsp.config('sourcekit', {
      cmd = { 'sourcekit-lsp' },
      filetypes = { 'swift' },
      root_dir = function(bufnr, on_dir)
        local root =
          vim.fs.root(bufnr, { 'buildServer.json', 'Package.swift', '.git' })
        on_dir(root)
      end,
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
      'sourcekit',
    })
  end,
}
