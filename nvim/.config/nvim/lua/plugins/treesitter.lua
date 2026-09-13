return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    dependencies = {
      'windwp/nvim-ts-autotag',
      'axelvc/template-string.nvim',
    },
    config = function()
      require('nvim-treesitter').setup()

      require('nvim-treesitter').install({
        'tsx', 'lua', 'vim', 'vimdoc', 'typescript', 'javascript',
        'html', 'css', 'json', 'graphql', 'regex', 'rust',
        'prisma', 'markdown', 'markdown_inline', 'swift',
      })

      -- highlighting + indent, per buffer
      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
          if lang and vim.treesitter.language.add(lang) then
            vim.treesitter.start(args.buf, lang)
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })

      require('nvim-ts-autotag').setup({})
      require('template-string').setup({})

      -- fold
      local opt = vim.opt
      opt.foldmethod = 'expr'
      opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      opt.foldenable = false
    end,
  },
}
