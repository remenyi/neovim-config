vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)
vim.o.showmode = false
vim.o.mouse = "a"
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.opt.signcolumn = 'yes'
vim.o.wrap = true
vim.o.incsearch = true
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.exrc = true
vim.o.scrolloff = 10
vim.o.hlsearch = true
vim.o.termguicolors = true
vim.o.background = "dark"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.inccommand = "split"

vim.opt.cursorline = true

vim.diagnostic.config({ virtual_text = true })
