return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	-- no 'main' field
	config = function()
		require("nvim-treesitter").setup({
			-- your options here (may need adjustment for the new API)
		})
	end,
}
