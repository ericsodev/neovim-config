return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  config = function()
    require('oil').setup {
      view_options = {
        show_hidden = true,
      },
      skip_confirm_for_simple_edits = true,
      keymaps = {
        ['<C-v>'] = { 'actions.select', opts = { vertical = true } },
        ['<C-h>'] = { 'actions.select', opts = { horizontal = true } },
      },
      watch_for_changes = true,
    }

    -- Auto enable preview on select
    vim.api.nvim_create_autocmd('User', {
      pattern = 'OilEnter',
      callback = vim.schedule_wrap(function(args)
        local oil = require 'oil'
        if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
          oil.open_preview()
        end
      end),
    })

    vim.keymap.set('n', '_', require('oil').toggle_float)
  end,
}
