return {
  'linrongbin16/gitlinker.nvim',
  cmd = 'GitLink',
  opts = {},
  keys = {
    { '<leader>hy', '<cmd>GitLink<cr>', mode = { 'n', 'v' }, desc = 'Yank git link' },
    { '<leader>ho', '<cmd>GitLink!<cr>', mode = { 'n', 'v' }, desc = 'Open git link' },
  },
}
