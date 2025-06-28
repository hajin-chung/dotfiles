-- set keymaps
local map = vim.keymap.set
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map("n", "<C-h>", "<C-w><C-h>")
map("n", "<C-l>", "<C-w><C-l>")
map("n", "<C-j>", "<C-w><C-j>")
map("n", "<C-k>", "<C-w><C-k>")

map("n", "<leader>pv", "<CMD>Oil<CR>")
-- map("n", "<leader>pv", "<CMD>Ex<CR>")

-- move around buffers
local opts = { noremap = true, silent = true }
map('n', '<C-n>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<C-m>', '<Cmd>BufferNext<CR>', opts)
map('n', '<C-q>', '<Cmd>BufferClose<CR>', opts)

map("n", "<leader>e", vim.diagnostic.open_float, opts)
