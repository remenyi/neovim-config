local flutter_tools = require("flutter-tools")

flutter_tools.setup {
    ui = {
        border = "rounded",
    },
    fvm = true,
    lsp = {
        settings = {
            lineLength = 120,
        },
    },
}
