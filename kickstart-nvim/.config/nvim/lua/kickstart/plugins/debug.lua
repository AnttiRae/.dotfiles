-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
  -- NOTE: Yes, you can install new plugins here!
  'mfussenegger/nvim-dap',
  -- NOTE: And you can specify dependencies as well
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Required dependency for nvim-dap-ui
    'nvim-neotest/nvim-nio',

    -- Installs the debug adapters for you
    'mason-org/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Add your own debuggers here
    'leoluz/nvim-dap-go',
    'msfussenegger/nvim-dap-python',
  },
  keys = {
    { '<leader>d', group = 'debug' },
    { '<leader>dc', '<Cmd>lua require"dap".continue()<CR>', desc = 'continue' },
    { '<leader>dl', '<Cmd>lua require"dap".run_last()<CR>', desc = 'run last' },
    { '<leader>dq', '<Cmd>lua require"dap".terminate()<CR>', desc = 'terminate' },
    { '<leader>dh', '<Cmd>lua require"dap".stop()<CR>', desc = 'stop' },
    { '<leader>dn', '<Cmd>lua require"dap".step_over()<CR>', desc = 'step over' },
    { '<leader>ds', '<Cmd>lua require"dap".step_into()<CR>', desc = 'step into' },
    { '<leader>dS', '<Cmd>lua require"dap".step_out()<CR>', desc = 'step out' },
    { '<leader>db', '<Cmd>lua require"dap".toggle_breakpoint()<CR>', desc = 'toggle br' },
    { '<leader>dB', '<Cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', desc = 'set br condition' },
    { '<leader>dp', '<Cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', desc = 'set log br' },
    { '<leader>dr', '<Cmd>lua require"dap".repl.open()<CR>', desc = 'REPL open' },
    { '<leader>dk', '<Cmd>lua require"dap".up()<CR>', desc = 'up callstack' },
    { '<leader>dj', '<Cmd>lua require"dap".down()<CR>', desc = 'down callstack' },
    { '<leader>di', '<Cmd>lua require"dap.ui.widgets".hover()<CR>', desc = 'info' },
    { '<leader>d?', '<Cmd>lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes)<CR>', desc = 'scopes' },
    { '<leader>df', '<Cmd>Telescope dap frames<CR>', desc = 'search frames' },
    { '<leader>dC', '<Cmd>Telescope dap commands<CR>', desc = 'search commands' },
    { '<leader>dL', '<Cmd>Telescope dap list_breakpoints<CR>', desc = 'search breakpoints' },

    -- Basic debugging keymaps, feel free to change to your liking!
    {
      '<F5>',
      function()
        require('dap').continue()
      end,
      desc = 'Debug: Start/Continue',
    },
    {
      '<F1>',
      function()
        require('dap').step_into()
      end,
      desc = 'Debug: Step Into',
    },
    {
      '<F2>',
      function()
        require('dap').step_over()
      end,
      desc = 'Debug: Step Over',
    },
    {
      '<F3>',
      function()
        require('dap').step_out()
      end,
      desc = 'Debug: Step Out',
    },
    {
      '<leader>db',
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = 'Debug: Toggle Breakpoint',
    },
    {
      '<leader>dB',
      function()
        require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end,
      desc = 'Debug: Set Breakpoint',
    },
    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    {
      '<F7>',
      function()
        require('dapui').toggle()
      end,
      desc = 'Debug: See last session result.',
    },
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        'delve',
        'debugpy',
      },
    }

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    }

    -- Change breakpoint icons
    vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
    vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
    local breakpoint_icons = vim.g.have_nerd_font
        and { Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = '' }
      or { Breakpoint = '●', BreakpointCondition = '⊜', BreakpointRejected = '⊘', LogPoint = '◆', Stopped = '⭔' }
    for type, icon in pairs(breakpoint_icons) do
      local tp = 'Dap' .. type
      local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
      vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
    end

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- Install golang specific config
    require('dap-go').setup {
      delve = {
        -- On Windows delve must be run attached or it crashes.
        -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
        detached = vim.fn.has 'win32' == 0,
      },
    }
    require('dap-python').setup()
    local dap_python = require 'dap-python'
    dap_python.setup 'python'
    dap_python.test_runner = 'pytest'
  end,
}
