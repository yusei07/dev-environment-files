local status, indent = pcall(require, "indent_blankline")
if (not status) then return end

indent.setup {
  buftype_exclude = { "terminal" },
  filetype_exclude = { "NvimTree", "packer", "lsp-installer", "python", "javascript", "css", "lua" },
  space_char_blankline = " ",
  show_current_context = true,
  context_patterns = {
    "class", "return", "function", "method", "^if", "^while", "jsx_element", "^for", "^object",
    "^table", "block", "arguments", "if_statement", "else_clause", "jsx_element",
    "jsx_self_closing_element", "try_statement", "catch_clause", "import_statement",
    "operation_type"
  }
}
