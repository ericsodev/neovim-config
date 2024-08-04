return {
	"nvimtools/none-ls.nvim",
	lazy = false,
	config = function()
		-- IMPORTANT!
		local augroup = vim.api.nvim_create_augroup("NoneLsFormatting", {})

		local on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ bufnr = bufnr })
					end,
				})
			end
		end

		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- lua
				null_ls.builtins.formatting.stylua,

				-- typescript
				null_ls.builtins.formatting.prettierd.with({}),

				-- python
				null_ls.builtins.diagnostics.mypy.with({
					extra_args = { "--ignore-missing-imports" },
				}),
			},
			on_attach = on_attach,
		})
	end,
}
