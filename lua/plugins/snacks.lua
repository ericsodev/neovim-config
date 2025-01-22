-- lazy.nvim
return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    ---@class snacks.dim.Config
    dim = {
      enabled = false,
      scope = {
        min_size = 5,
        max_size = 25,
        siblings = true,
      },
      -- animate scopes. Enabled by default for Neovim >= 0.10
      -- Works on older versions but has to trigger redraws during animation.
      ---@type snacks.animate.Config|{enabled?: boolean}
      animate = {
        enabled = vim.fn.has 'nvim-0.10' == 1,
        easing = 'outQuad',
        duration = {
          step = 20, -- ms per step
          total = 200, -- maximum duration
        },
      },
      -- what buffers to dim
      filter = function(buf)
        return vim.g.snacks_dim ~= false and vim.b[buf].snacks_dim ~= false and vim.bo[buf].buftype == ''
      end,
    },
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    indent = { enabled = false },
    input = { enabled = true, win = { position = 'float' } },
    notifier = {
      enabled = false,
      timeout = 2500,
    },
    quickfile = { enabled = true },
    scroll = {
      enabled = true,
      animate = {
        delay = 100, -- delay in ms before using the repeat animation
        duration = { step = 4, total = 50 },
        easing = 'linear',
      },
      -- what buffers to animate
      filter = function(buf)
        return vim.g.snacks_scroll ~= false and vim.b[buf].snacks_scroll ~= false and vim.bo[buf].buftype ~= 'terminal'
      end,
    },
    statuscolumn = { enabled = false },
    words = { enabled = false },
  },

  init = function()
    local snacks = require 'snacks'
    vim.keymap.set('n', '<leader>;sd', function()
      if snacks.dim.enabled then
        snacks.dim.disable()
      else
        snacks.dim.enable()
      end
    end, { desc = '[S]nacks [D]im' })
  end,
}
