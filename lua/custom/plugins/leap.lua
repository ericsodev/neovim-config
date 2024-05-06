return {
	"ggandor/leap.nvim",
	-- Optional dependency
	config = function()
		require("leap").create_default_mappings()
	end,
}
