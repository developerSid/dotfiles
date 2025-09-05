vim.api.nvim_set_keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>bn", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>bp", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>bb", ":BufferLinePick<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>bc", ":BufferLinePickClose<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>bd", ":bdelete<CR>", { noremap = true, silent = true })
