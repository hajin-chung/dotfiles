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

-- format code
map('n', '<leader>fw', function() format_buffer() end)

function format_buffer()
  local filetype = vim.bo.filetype
  local filepath = vim.fn.expand("%:p")

  if filetype == "c" then
    vim.print(string.format("clang-format -i %s", filepath))
    local ret = vim.system({"clang-format", filepath}, { text = true }):wait()

    if ret.code ~= 0 then
      vim.print(string.format("clang-format error %d\n%s", ret.code, ret.stderr))
      return
    end

    local formatted = vim.split(ret.stdout, '\n')
    vim.api.nvim_buf_set_lines(0, 0, -1, false, formatted)
  elseif filetype == "rust" then
    vim.print(string.format("rustfmt --quiet --emit stdout --edition 2024 %s", filepath))
    local ret = vim.system(
      {"rustfmt", "--quiet", "--emit", "stdout", "--edition", "2024", filepath},
      { text = true }):wait()

    if ret.code ~= 0 then
      vim.print(string.format("rustfmt error %d\n%s", ret.code, ret.stderr))
      return
    end

    local formatted = vim.split(ret.stdout, '\n')
    vim.api.nvim_buf_set_lines(0, 0, -1, false, formatted)

  else
    vim.print("no formatter for current buffer type")
  end
end

