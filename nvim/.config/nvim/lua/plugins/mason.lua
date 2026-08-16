return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    require('mason').setup({
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    })
    require('mason-lspconfig').setup({
      automatic_enable = false,
    })
    require('mason-tool-installer').setup({
      ensure_installed = {
        'lua_ls',
        'vim-language-server',
        'stylua',
        'html',
        'tailwindcss',
        'ts_ls',
        'cssls',
        -- 'c-language-server',
        'pylsp',
        'emmet_ls',
      },
    })
  end,
}
