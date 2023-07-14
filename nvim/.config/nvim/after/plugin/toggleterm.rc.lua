local status, toggleterm = pcall(require, "toggleterm")
if (not status) then return end

toggleterm.setup({
  direction = 'float',
  open_mapping = [[<c-\>]],
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = '1',
  start_in_insert = true,
  persist_size = true,
})
