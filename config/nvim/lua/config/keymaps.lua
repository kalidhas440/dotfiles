-- keymaps.lua
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Nvim-tree toggle
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

-- Bufferline navigation
map('n', '<leader>1', ':BufferLineGoToBuffer 1<CR>', opts)
map('n', '<leader>2', ':BufferLineGoToBuffer 2<CR>', opts)
map('n', '<leader>3', ':BufferLineGoToBuffer 3<CR>', opts)
map('n', '<leader>i', 'gg=G``', opts)
