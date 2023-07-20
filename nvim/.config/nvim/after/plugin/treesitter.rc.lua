local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "markdown",
    "markdown_inline",
    "tsx",
    "fish",
    "json",
    "yaml",
    "vim",
    "swift",
    "css",
    "html",
    "lua",
    "python",
    "c",
    "javascript",
    "typescript"
  },

  sync_install = false,
  auto_install = true,

  autotag = {
    enable = true,
  },
  -- rainbow = {
  --   enable = true,
  --   -- extended_mode = true,
  --   max_file_lines = nil,
  -- },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  }
}

require('template-string').setup({
  filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'python' }, -- filetypes where the plugin is active
  jsx_brackets = true,                                                                        -- must add brackets to jsx attributes
  remove_template_string = false,                                                             -- remove backticks when there are no template string
  restore_quotes = {
    -- quotes used when "remove_template_string" option is enabled
    normal = [[']],
    jsx = [["]],
  },
})

-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
