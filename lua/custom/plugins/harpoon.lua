return {
	"ThePrimeagen/harpoon",
	-- Optional dependency
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "add harpoon mark" })
		vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

		vim.keymap.set("n", "<leader>ha", function()
			ui.nav_file(1)
		end, { desc = "go to harpoon mark (1)" })
		vim.keymap.set("n", "<leader>hb", function()
			ui.nav_file(2)
		end, { desc = "go to harpoon mark (2)" })
		vim.keymap.set("n", "<leader>hc", function()
			ui.nav_file(3)
		end, { desc = "go to harpoon mark (3)" })
		vim.keymap.set("n", "<leader>hd", function()
			ui.nav_file(4)
		end, { desc = "go to harpoon mark (4)" })

		vim.keymap.set("n", "<C-h>", function()
			ui.nav_file(1)
		end)
		vim.keymap.set("n", "<C-t>", function()
			ui.nav_file(2)
		end)
		vim.keymap.set("n", "<C-n>", function()
			ui.nav_file(3)
		end)
		vim.keymap.set("n", "<C-s>", function()
			ui.nav_file(4)
		end)

		vim.keymap.set("n", "¡", function()
			ui.nav_file(1)
		end)
		vim.keymap.set("n", "™", function()
			ui.nav_file(2)
		end)
		vim.keymap.set("n", "£", function()
			ui.nav_file(3)
		end)
		vim.keymap.set("n", "¢", function()
			ui.nav_file(4)
		end)
	end,
}
