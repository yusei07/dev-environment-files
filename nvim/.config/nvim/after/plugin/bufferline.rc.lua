local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  options = {
    mode = "tabs",
    separator_style = 'padded_slope',
    enforce_regular_tabs = true,
    show_buffer_icons = false,
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = false
  },
  highlights = {
    separator = {
      fg = '#3a454c',
      bg = '#4d5860',
    },
    separator_selected = {
      fg = '#3a454c',
      bg = '#afbf87'
    },
    background = {
      fg = '#999f93', -- unselected buffer color
      bg = '#4d5860' -- background color
    },
    buffer_selected = {
      fg = '#3a454c',
      bg = '#afbf87',
      bold = true,
    },
    fill = {
      bg = '#3a454c'
    },
    modified = {
        fg = '#afbf87',
        bg = '#4d5860',
    },
    modified_selected = {
        fg = '#4d5860',
        bg = '#afbf87',
    },
  },
})


vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
