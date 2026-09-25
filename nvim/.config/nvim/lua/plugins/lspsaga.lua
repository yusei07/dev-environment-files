return {
  'nvimdev/lspsaga.nvim',
  config = function()
    local keymap = vim.keymap

    require('lspsaga').setup {
      ui = {
        border = 'rounded',
      },
    }

    keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<cr>')
    keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<cr>')
    keymap.set('n', '<leader>o', '<cmd>Lspsaga outline<cr>')

    local builtin = require 'telescope.builtin'

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gd', '<cmd>Lspsaga goto_definition<cr>', opts)
        vim.keymap.set('n', '<space>r', '<cmd>Lspsaga rename<cr>', opts)
        vim.keymap.set(
          { 'n', 'v' },
          '<space>ca',
          '<cmd>Lspsaga code_action<cr>',
          opts
        )
        vim.keymap.set('n', 'gr', builtin.lsp_references, opts)
      end,
    })

    local function show_documentation()
      local filetype = vim.bo.filetype
      if vim.tbl_contains({ 'vim', 'help' }, filetype) then
        vim.cmd('h ' .. vim.fn.expand '<cword>')
      elseif vim.tbl_contains({ 'man' }, filetype) then
        vim.cmd('Man ' .. vim.fn.expand '<cword>')
      else
        vim.cmd 'Lspsaga hover_doc'
      end
    end

    vim.keymap.set('n', '<space>k', show_documentation, { silent = true })

    -- show the full diagnostic message under the cursor in a popup
    vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)

    -- error lens
    local severity = vim.diagnostic.severity
    vim.diagnostic.config {
      -- inline error messages (off by default since nvim 0.11)
      virtual_text = {
        spacing = 4,
        prefix = '●',
      },
      severity_sort = true,
      float = {
        border = 'rounded',
        source = true,
      },
      signs = {
        text = {
          [severity.ERROR] = '',
          [severity.WARN] = '',
          [severity.INFO] = '',
          [severity.HINT] = '',
        },
        linehl = {
          [severity.ERROR] = 'ErrorLine',
          [severity.WARN] = 'WarningLine',
          [severity.INFO] = 'InfoLine',
          [severity.HINT] = 'HintLine',
        },
      },
    }
  end,
}
