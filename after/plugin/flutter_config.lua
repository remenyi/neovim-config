local flutter_tools = require("flutter-tools")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

flutter_tools.setup {
    ui = {
        border = "rounded",
    },
    fvm = true,
    lsp = {
        capabilities = capabilities,
        settings = {
            lineLength = 120,
        },
    },
}
