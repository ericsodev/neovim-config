return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    -- require('neo-tree').setup {
    --   enabled = false,
    --   close_if_last_file = true,
    --   source_selector = {
    --     winbar = false,
    --     statusline = false,
    --   },
    --   filesystem = {
    --     follow_current_file = { enabled = true, leave_dirs_open = true },
    --     bind_to_cwd = true,
    --     use_libuv_file_watcher = true,
    --   },
    --   sources = { 'filesystem', 'buffers', 'git_status' },
    --   open_files_do_not_replace_types = { 'terminal', 'Trouble', 'trouble', 'qf', 'Outline' },
    --   git_status = {
    --     symbols = {
    --       -- -- Change type
    --       -- added = '', -- or "✚", but this is redundant info if you use git_status_colors on the name
    --       -- modified = '', -- or "", but this is redundant info if you use git_status_colors on the name
    --       -- deleted = '✖', -- this can only be used in the git_status source
    --       -- renamed = '󰁕', -- this can only be used in the git_status source
    --       -- -- Status type
    --       -- untracked = '',
    --       -- ignored = '',
    --       unstaged = '󰄱',
    --       staged = '',
    --       conflict = '',
    --     },
    --   },
    -- }
    -- vim.keymap.set('n', '<leader>t', ':Neotree toggle<cr>', { desc = '[T]oggle Neotree' })
  end,
}
