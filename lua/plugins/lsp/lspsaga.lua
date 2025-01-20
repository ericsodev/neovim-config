return {
  'nvimdev/lspsaga.nvim',
  config = function()
    require('lspsaga').setup {
      lightbulb = { enable = false },
      rename = { in_select = false },
    }
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('Lspsaga', { clear = true }),
      callback = function()
        vim.keymap.set('n', '<leader>rn', ':Lspsaga rename mode=n<CR>', { desc = 'LSP: [R]e[n]ame' })
      end,
    })
  end,
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- optional
    'nvim-tree/nvim-web-devicons', -- optional
  },
}
