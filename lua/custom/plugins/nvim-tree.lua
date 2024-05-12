return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- Mappings
		local function my_on_attach(bufnr)
			local api = require("nvim-tree.api")
			api.config.mappings.default_on_attach(bufnr)

			-- mappings
			vim.keymap.set("n", "<Leader>t", ":NvimTreeToggle<Enter>")
		end

		-- copy pasta from https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes
		-- Go to last used hidden buffer when deleting a buffer

		vim.api.nvim_create_autocmd("BufEnter", {
			nested = true,
			callback = function()
				local api = require("nvim-tree.api")

				-- Only 1 window with nvim-tree left: we probably closed a file buffer
				if #vim.api.nvim_list_wins() == 1 and api.tree.is_tree_buf() then
					-- Required to let the close event complete. An error is thrown without this.
					vim.defer_fn(function()
						-- close nvim-tree: will go to the last hidden buffer used before closing
						api.tree.toggle({ find_file = true, focus = true })
						-- re-open nivm-tree
						api.tree.toggle({ find_file = true, focus = true })
						-- nvim-tree is still the active window. Go to the previous window.
						vim.cmd("wincmd p")
					end, 0)
				end
			end,
		})

		require("nvim-tree").setup({
			on_attach = my_on_attach,
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 30,
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = true,
			},
			update_focused_file = {
				enable = true,
			},
		})
	end,
}
