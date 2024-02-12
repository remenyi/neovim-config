vim.g.mapleader = " "

vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.opt.nu = true
vim.opt.relativenumber = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.wrap = true

vim.o.incsearch = true

vim.o.updatetime = 50

vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = { "*.html" },
    command = "0r ~/.config/nvim/templates/template.html",
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*.html" },
    callback = function()
        vim.o.shiftwidth = 2
        vim.o.tabstop = 2
        vim.o.softtabstop = 2
    end,
})


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
print(lazypath)
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    { "catppuccin/nvim",                            name = "catppuccin", priority = 1000 },
    { "nvim-treesitter/nvim-treesitter",            build = ":TSUpdate" },
    { "nvim-treesitter/nvim-treesitter-textobjects" },
    { 'VonHeikemen/lsp-zero.nvim',                  branch = 'v3.x' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    { 'linrongbin16/lsp-progress.nvim' },
    { 'akinsho/toggleterm.nvim', version = "*", config = true },
    { 'tpope/vim-fugitive' }
})
