return {
  '3rd/diagram.nvim',
  opts = { -- you can just pass {}, defaults below
    events = {
      render_buffer = { 'InsertLeave', 'BufWinEnter', 'TextChanged' },
      clear_buffer = { 'BufLeave' },
    },
    renderer_options = {
      mermaid = {
        background = 'white', -- nil | "transparent" | "white" | "#hex"
        theme = 'forest', -- nil | "default" | "dark" | "forest" | "neutral"
        scale = 3, -- nil | 1 (default) | 2  | 3 | ...
        width = 800, -- nil | 800 | 400 | ...
        height = 600, -- nil | 600 | 300 | ...
        cli_args = nil, -- nil | { "--no-sandbox" } | { "-p", "/path/to/puppeteer" } | ...
      },
    },
  },
  keys = {
    {
      'K', -- or any key you prefer
      function()
        require('diagram').show_diagram_hover()
      end,
      mode = 'n',
      ft = { 'markdown' }, -- Only in these filetypes
      desc = 'Show diagram in new tab',
    },
  },
}
