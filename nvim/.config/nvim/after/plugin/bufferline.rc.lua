local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  options = {
    mode = "tabs",
    separator_style = 'slant',
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true
  },
  highlights = {
    separator = {
      fg = '#313B41',
      bg = '#39434d',
    },
    separator_selected = {
      fg = '#313B41',
    },
    background = {
      fg = '#657b83', -- unselected buffer color
      bg = '#39434d' -- background color
    },
    buffer_selected = {
      fg = '#C4CAC5',
      bold = true,
    },
    fill = {
      bg = '#313B41'
    }
  },
})


vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
