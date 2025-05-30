local flutter_tools = require("flutter-tools")

flutter_tools.setup {
    ui = {
        border = "rounded",
    },
    fvm = true,
    root_patterns = { "example/pubspec.yaml", "pubspec.yaml" },
    lsp = {
        color = {
            enabled = true,
            virtual_text = true,
        },
        settings = {
            lineLength = 120,
        },
    },
    dev_log = {
        open_cmd = "bel sp",
        focus_on_open = false,
    },
    debugger = {
        enabled = false,
    },
}
