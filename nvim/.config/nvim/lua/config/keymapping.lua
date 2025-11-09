local map = vim.api.nvim_set_keymap

-- Navigation
map("", "<leader>l", "<cmd>b#<CR>", { desc = "Open last buffer" })

--Window navigation
----hjkl
map("", "<C-h>", "<C-w><Left>", {})
map("", "<C-j>", "<C-w><Down>", {})
map("", "<C-k>", "<C-w><Up>", {})
map("", "<C-l>", "<C-w><Right>", {})
map("", "<C-S-h>", "<cmd>tabprev<CR>", {})
map("", "<C-S-l>", "<cmd>tabnext<CR>", {})
----Arrows
map("", "<C-Up>", "<C-w><Up>", {})
map("", "<C-Down>", "<C-w><Down>", {})
map("", "<C-Left>", "<C-w><Left>", {})
map("", "<C-Right>", "<C-w><Right>", {})
map("", "<C-S-Left>", "<cmd>tabprev<CR>", {})
map("", "<C-S-Right>", "<cmd>tabnext<CR>", {})

--Toggles
map("", "<C-S-l>", "<cmd>set relativenumber!<CR>", {})

-- Disable
map("", "<F1>", "<Nop>", {})

-- Lsp binds
local opts = { noremap = true, silent = true }
opts.desc = "Show LSP references"
map("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
opts.desc = "Go to declaration"
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration<CR>", opts)
opts.desc = "Show LSP definitions"
map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
opts.desc = "Show LSP implementations"
map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
opts.desc = "Show LSP type definitions"
map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
opts.desc = "Next diagnostic"
map("n", "g<Down>", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
opts.desc = "Previous diagnostic"
map("n", "g<Up>", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
opts.desc = "LSP Format"
map("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
opts.desc = "See available code actions"
map("n", "<leader>a", "<leader>ca", opts)
opts.desc = "Smart rename"
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename<CR>", opts)
opts.desc = "Show documentation under cursor"
map("n", "K", "<cmd>lua vim.lsp.buf.hover<CR>", opts)
opts.desc = "Restart LSP"
map("n", "<leader>rs", "<cmd>LspRestart<CR>", opts)
