vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line[s] up" }) -- move VISUAL selected line up
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line[s] down" }) -- move VISUAL selected line down

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Remap normal line delete to blackhole delete
vim.keymap.set("n", "<leader>dd", '"_dd', { noremap = true, silent = true, desc = "Delete and blackhole current line" })

-- Remap visual delete to blackhole the deleted content
vim.keymap.set(
	"v",
	"<leader>d",
	'"_d',
	{ noremap = true, silent = true, desc = "Delete and blackhole current selected text" }
)
