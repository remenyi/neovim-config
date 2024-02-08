local lualine = require('lualine')

lualine.setup({
    sections = {
        lualine_z = {
            require('lsp-progress').progress,
        },
    }
})

-- listen lsp-progress event and refresh lualine
vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
vim.api.nvim_create_autocmd("User", {
    group = "lualine_augroup",
    pattern = "LspProgressStatusUpdated",
    callback = require("lualine").refresh,
})
