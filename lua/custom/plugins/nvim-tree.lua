return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- Mappings
		local function my_on_attach(bufnr)
			local api = require("nvim-tree.api")
			api.config.mappings.default_on_attach(bufnr)

			-- mappings
			vim.keymap.set("n", "<Leader>t", ":NvimTreeToggle<Enter>", { desc = "Toggle NvimTree" })
			vim.keymap.set("n", "<Leader>nt", ":NvimTreeToggle<Enter>", { desc = "Toggle NvimTree" })

			-- copy pasta to stage and unstage files

			local git_add = function()
				local node = api.tree.get_node_under_cursor()
				local gs = node.git_status.file

				-- If the current node is a directory get children status
				if gs == nil then
					gs = (node.git_status.dir.direct ~= nil and node.git_status.dir.direct[1])
					    or (node.git_status.dir.indirect ~= nil and node.git_status.dir.indirect[1])
				end

				-- If the file is untracked, unstaged or partially staged, we stage it
				if gs == "??" or gs == "MM" or gs == "AM" or gs == " M" then
					vim.cmd("silent !git add " .. node.absolute_path)

					-- If the file is staged, we unstage
				elseif gs == "M " or gs == "A " then
					vim.cmd("silent !git restore --staged " .. node.absolute_path)
				end

				api.tree.reload()
			end

			vim.keymap.set("n", "ga", git_add, { desc = "Git Add" })
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
				signcolumn = "yes",
				width = {
					max = "25%",
				},
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
			diagnostics = {
				enable = true,
			},
		})
	end,
}
