return {
  "rose-pine/neovim",
  name = "rose-pine",
  -- Optional dependency
  config = function()
    require("rose-pine").setup({ dark_variant = "main" })
    vim.cmd("colorscheme rose-pine")
  end,
}
