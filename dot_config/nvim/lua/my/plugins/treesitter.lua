return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	-- no 'main' field
	config = function()
		require("nvim-treesitter").setup({
			-- your options here (may need adjustment for the new API)
		})

		-- Neovim 0.12 ships a Lua parser whose fields match its runtime query.
		-- The parser bundled by the current nvim-treesitter checkout does not,
		-- so keep that parser from shadowing Neovim's compatible bundled parser.
		local treesitter_init = vim.api.nvim_get_runtime_file("lua/nvim-treesitter/init.lua", false)[1]
		if treesitter_init then
			local treesitter_root = vim.fn.fnamemodify(treesitter_init, ":p:h:h:h")
			vim.opt.runtimepath:remove(treesitter_root)
		end
	end,
}
