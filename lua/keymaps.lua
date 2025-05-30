local map = vim.keymap.set

map("i", "jk", "<Esc>", { desc = "Exit insert mode" })

map("n", "<leader>j", "<cmd>cnext<CR>", { desc = "Next quickfix item" })
map("n", "<leader>k", "<cmd>cprev<CR>", { desc = "Previous quickfix item" })
map("n", "<leader>H", ":bprev<CR>", { desc = "Previous buffer" })
map("n", "<leader>L", ":bnext<CR>", { desc = "Next buffer" })

map("n", "wv", ":vsplit<CR>", { desc = "Vertical split" })
map("n", "ws", ":split<CR>", { desc = "Horizontal split" })
map("n", "wc", ":close<CR>", { desc = "Close tab" })
map("n", "wo", ":only<CR>", { desc = "Only tab" })
map("n", "wh", ":wincmd h<CR>", { desc = "Move to left split" })
map("n", "wl", ":wincmd l<CR>", { desc = "Move to right split" })
map("n", "wk", ":wincmd k<CR>", { desc = "Move to upper split" })
map("n", "wj", ":wincmd j<CR>", { desc = "Move to lower split" })
map("n", "w=", ":wincmd h<CR>", { desc = "Equalize splits" })
map("n", "w>", ":vertical resize +5<CR>", { desc = "Increase height" })
map("n", "w<", ":vertical resize -5<CR>", { desc = "Decrease height" })
map("n", "w+", ":resize +5<CR>", { desc = "Increase width" })
map("n", "w-", ":resize -5<CR>", { desc = "Decrease width" })

map("n", "<leader>pv", vim.cmd.Ex, { desc = "Open Explorer" })

map("t", "jk", "<C-\\><C-n>", { desc = "Exit terminal mode" })

map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition" })
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "Find references" })
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Hover info" })

map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "List buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Find help" })
map("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", { desc = "Search diagnostics" })

