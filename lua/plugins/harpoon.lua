return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'

    -- REQUIRED
    harpoon:setup {
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
      },
    }
    -- REQUIRED

    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end, { desc = '[A]ppend harpoon list' })
    vim.keymap.set('n', '<C-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    vim.keymap.set('n', '¡', function()
      harpoon:list():select(1)
    end)
    vim.keymap.set('n', '™', function()
      harpoon:list():select(2)
    end)
    vim.keymap.set('n', '£', function()
      harpoon:list():select(3)
    end)
    vim.keymap.set('n', '¢', function()
      harpoon:list():select(4)
    end)

    harpoon:extend {
      UI_CREATE = function(cx)
        vim.keymap.set('n', '<C-v>', function()
          harpoon.ui:select_menu_item { vsplit = true }
        end, { buffer = cx.bufnr })

        vim.keymap.set('n', '<C-h>', function()
          harpoon.ui:select_menu_item { hsplit = true }
        end, { buffer = cx.bufnr })
      end,
    }

    -- Toggle previous & next buffers stored within Harpoon list
    -- vim.keymap.set('n', '<C-S-P>', function()
    --   harpoon:list():prev()
    -- end)
    -- vim.keymap.set('n', '<C-S-N>', function()
    --   harpoon:list():next()
    -- end)
  end,
}
