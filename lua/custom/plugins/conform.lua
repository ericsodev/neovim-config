return { -- Autoformat
	"stevearc/conform.nvim",
	opts = {
		notify_on_error = false,
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = false,
		},
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform can also run multiple formatters sequentially
			-- python = { "isort", "black" },
			--
			-- You can use a sub-list to tell conform to run *until* a formatter
			-- is found.
			javascript = { { "prettierd", "prettier" } },
			typescriptreact = { "prettier" },
			javascriptreact = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },
			typescript = { "prettierd" },
			svelte = { "prettierd" },
		},
	},
}
