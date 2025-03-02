return {
  'echasnovski/mini.surround',
  config = function()
    require('mini.surround').setup {
      mappings = {
        add = '<C-m>a', -- Add surrounding in Normal and Visual modes
        delete = '<C-m>d', -- Delete surrounding
        find = '<C-m>f', -- Find surrounding (to the right)
        find_left = '<C-m>F', -- Find surrounding (to the left)
        highlight = '<C-m>h', -- Highlight surrounding
        replace = '<C-m>r', -- Replace surrounding
        update_n_lines = '<C-m>n', -- Update `n_lines`

        suffix_last = 'l', -- Suffix to search with "prev" method
        suffix_next = 'n', -- Suffix to search with "next" method
      },
    }
  end,
}
