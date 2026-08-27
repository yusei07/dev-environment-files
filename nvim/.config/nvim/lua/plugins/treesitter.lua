return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    event = { 'BufReadPre', 'BufNewFile' },
    build = ':TSUpdate',
    dependencies = {
      'windwp/nvim-ts-autotag',
      'axelvc/template-string.nvim',
    },
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'tsx',
          'lua',
          'vim',
          'typescript',
          'javascript',
          'html',
          'css',
          'json',
          'graphql',
          'regex',
          'rust',
          'prisma',
          'markdown',
          'markdown_inline',
          'swift',
        },

        sync_install = false,

        auto_install = false, -- disables installation on every new file I open

        highlight = {
          enable = true,

          additional_vim_regex_highlighting = false,
        },
        autotag = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<enter>',
            node_incremental = '<enter>',
            scope_incremental = false,
            node_decremental = '<bs>',
          },
        },
      })

      require('template-string').setup({})

      -- fold
      local opt = vim.opt
      opt.foldmethod = 'expr'
      opt.foldexpr = 'nvim_treesitter#foldexpr()'
      opt.foldenable = false
    end,
  },
}
