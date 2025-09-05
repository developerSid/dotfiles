return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional, for file icons
	config = function()
		require("bufferline").setup({
			options = {
				numbers = "none", -- Options: "none", "ordinal", "buffer_id", "both"
				close_command = "bdelete! %d", -- Command to close buffer
				right_mouse_command = "bdelete! %d", -- Command for right-click close
				indicator = {
					style = "icon", -- Display a triangle indicator (can be "underline" or "none")
				},
				separator_style = "slant", -- Options: "slant", "padded_slant", "thick", "thin"
				show_buffer_close_icons = true,
				show_close_icon = false,
				show_tab_indicators = true,
				diagnostics = "nvim_lsp", -- Display LSP diagnostics
				always_show_bufferline = true,
			},
		})
	end,
}
