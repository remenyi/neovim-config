local flutter_tools = require("flutter-tools")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

flutter_tools.setup {
    flutter_path = "C:\\Users\\p-gergely.remenyi\\fvm\\versions\\3.16.5\\bin\\flutter.bat",
    lsp = {
        capabilities = capabilities,
        settings = {
            lineLength = 120,
        },
    },
}

