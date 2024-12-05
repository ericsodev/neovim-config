return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({
			settings = {
				save_on_toggle = true,
			},
		})

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<C-S-P>", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<C-S-N>", function()
			harpoon:list():next()
		end)

		vim.keymap.set("n", "¡", function()
			harpoon:list():select(1)
		end, { desc = "Go to harpoon mark 1" })
		vim.keymap.set("n", "™", function()
			harpoon:list():select(2)
		end, { desc = "Go to harpoon mark 2" })
		vim.keymap.set("n", "£", function()
			harpoon:list():select(3)
		end, { desc = "Go to harpoon mark 3" })
		vim.keymap.set("n", "¢", function()
			harpoon:list():select(4)
		end, { desc = "Go to harpoon mark 4" })
		vim.keymap.set("n", "¨", function()
			harpoon:list():select(5)
		end, { desc = "Go to harpoon mark 5" })
		vim.keymap.set("n", "ˆ", function()
			harpoon:list():select(6)
		end, { desc = "Go to harpoon mark 6" })
		vim.keymap.set("n", "ø", function()
			harpoon:list():select(7)
		end, { desc = "Go to harpoon mark 7" })
		vim.keymap.set("n", "ª", function()
			harpoon:list():select(8)
		end, { desc = "Go to harpoon mark 8" })
	end,
}
