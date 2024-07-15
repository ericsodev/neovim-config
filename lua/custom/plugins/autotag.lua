return {
	"windwp/nvim-ts-autotag",
	config = function()
		require("nvim-ts-autotag").setup({
			per_filetye = {
				["svelte"] = {
					enable_close = false,
				},
			},
		})
	end,
}
