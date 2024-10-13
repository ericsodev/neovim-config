return {
  'ThePrimeagen/git-worktree.nvim',
  config = function()
    require('git-worktree').setup {}
    require('telescope').load_extension 'git_worktree'

    local git_worktree = require('telescope').extensions.git_worktree
    vim.keymap.set('n', '<leader>wt', git_worktree.git_worktrees, { desc = 'Search Git [W]orktrees [T]elescope' })
    vim.keymap.set('n', '<leader>wc', git_worktree.create_git_worktree, { desc = 'Git [W]orktree [C]reate' })
  end,
}
