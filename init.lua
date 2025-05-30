vim.g.mapleader = " "

require("settings")
require("keymaps")
require("plugins")
require("autocmds")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
print(lazypath)
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stabe release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(require("plugins"))

