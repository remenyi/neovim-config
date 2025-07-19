local telescope_builtin = require("telescope.builtin")

vim.lsp.config('lua_ls', {
    root_dir = function(bufnr, on_dir)
        if vim.fn.bufname(bufnr):match('%.lua$') then
            on_dir(vim.fn.getcwd())
        end
    end,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    }
})

vim.lsp.enable('lua_ls')

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostics" })
vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = 1 }) end, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
    callback = function(ev)
        if not vim.api.nvim_buf_is_valid(ev.buf) then
            return
        end

        local mappings = {
            { "n",          "gd",        vim.lsp.buf.definition,                             "[G]oto [D]efinition" },
            { "n",          "K",         vim.lsp.buf.hover,                                  "Hover Info" },
            { "n",          "gi",        vim.lsp.buf.implementation,                         "[G]oto [I]mplementation" },
            { "n",          "<space>D",  vim.lsp.buf.type_definition,                        "Type [D]efinition" },
            { "n",          "<space>rn", vim.lsp.buf.rename,                                 "[R]e[n]ame Symbol" },
            { { "n", "v" }, "<space>ca", vim.lsp.buf.code_action,                            "[C]ode [A]ctions" },
            { "n",          "gr",        telescope_builtin.lsp_references,                   "[G]oto [R]eferences" },
            { "n",          "<leader>f", function() vim.lsp.buf.format { async = true } end, "[F]ormat Document" },
        }

        for _, map in ipairs(mappings) do
            if vim.api.nvim_buf_is_valid(ev.buf) then
                vim.keymap.set(map[1], map[2], map[3], { buffer = ev.buf, desc = map[4] })
            end
        end
    end,
})
