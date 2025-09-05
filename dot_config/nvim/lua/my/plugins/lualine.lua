return {
	-- Set lualine as statusline
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	-- See `:help lualine.txt`
	opts = {
		options = {
			icons_enabled = true,
			theme = "horizon",
			section_separators = { left = "", right = "" }, -- Pointy separators
			component_separators = { left = "", right = "" },
		},
	},
}
