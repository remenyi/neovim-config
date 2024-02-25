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

vim.o.exrc = true

vim.g.neovide_scale_factor = 0.8
vim.g.neovide_transparency = 0.95

vim.opt.termguicolors = true

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
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    { 'linrongbin16/lsp-progress.nvim' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'L3MON4D3/LuaSnip' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'akinsho/toggleterm.nvim',       version = "*", config = true },
    {
        'akinsho/flutter-tools.nvim',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim', -- optional for vim.ui.select
        },
        config = true,
    },
    { 'tpope/vim-fugitive' },
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {}
        end,
        dependencies = { { 'nvim-tree/nvim-web-devicons' } }
    },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'lewis6991/gitsigns.nvim' },
    {
        'mrded/nvim-lsp-notify',
        dependencies = { { 'rcarriga/nvim-notify' } },
        config = function()
            require('lsp-notify').setup({
                notify = require('notify'),
            })
        end
    },
    { 'rcarriga/nvim-notify' },
    { 'github/copilot.vim' },
})
