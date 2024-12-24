return {
  'ggandor/leap.nvim',
  dependencies = { 'tpope/vim-repeat' },
  config = function()
    vim.keymap.set({ 'n', 'x', 'o' }, 'S', '<Plug>(leap-backward)', { desc = 'Leap [S]earch backward' })
    vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap-forward)', { desc = 'Leap [S]earch forward' })
    -- Define equivalence classes for brackets and quotes, in addition to
    -- the default whitespace group.
    require('leap').opts.equivalence_classes = { ' \t\r\n', '([{', ')]}', '\'"`' }

    -- Use the traversal keys to repeat the previous motion without explicitly
    -- invoking Leap.
    require('leap.user').set_repeat_keys('<enter>', '<backspace>')

    -- The below settings make Leap's highlighting closer to what you've been
    -- used to in Lightspeed.

    vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' }) -- or some grey
    vim.api.nvim_set_hl(0, 'LeapMatch', {
      -- For light themes, set to 'black' or similar.
      fg = 'white',
      bold = true,
      nocombine = true,
    })
  end,
}
