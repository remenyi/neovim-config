vim.g.mapleader = " "

vim.g.have_nerd_font = true

vim.o.clipboard = "unnamedplus"

vim.o.showmode = false

vim.o.mouse = "a"

vim.o.breakindent = true

vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.opt.signcolumn = 'yes'

vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.opt.nu = true
vim.opt.relativenumber = true

vim.o.wrap = true

vim.o.incsearch = true

vim.o.updatetime = 250

vim.o.exrc = true

vim.o.scrolloff = 10

vim.o.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.o.list = true
-- somehow I can't change 'opt' to 'o'
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.o.termguicolors = true

vim.keymap.set("n", "<leader>j", "<cmd>cnext<CR>")
vim.keymap.set("n", "<leader>k", "<cmd>cprev<CR>")

vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = { "*.html" },
    command = "0r ~/.config/nvim/templates/template.html",
})

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
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
    { 'tpope/vim-sleuth' },
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
    --    {
    --        'mrded/nvim-lsp-notify',
    --        dependencies = { { 'rcarriga/nvim-notify' } },
    --       config = function()
    --           require('lsp-notify').setup({
    --               notify = require('notify'),
    --           })
    --       end
    --   },
    { 'rcarriga/nvim-notify' },
    { 'github/copilot.vim' },
    { 'ahmedkhalf/project.nvim' },
    { 'ThePrimeagen/git-worktree.nvim' },
    {
        "iabdelkareem/csharp.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
            "Tastyep/structlog.nvim",
        },
        config = function()
            require("mason").setup()
            require("csharp").setup()
            vim.keymap.set("n", "<leader>dr", "<cmd>lua require('csharp').run_project()<CR>")
            vim.keymap.set("n", "<leader>dg", "<cmd>lua require('csharp').go_to_definition()<CR>")
        end
    },
    {
        "nomnivore/ollama.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },
        keys = {
            {
                "<leader>oo",
                ":<c-u>lua require('ollama').prompt()<cr>",
                desc = "ollama prompt",
                mode = { "n", "v" },
            },
        },
    },
})
