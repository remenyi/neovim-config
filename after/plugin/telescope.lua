local telescope = require('telescope')

telescope.load_extension('flutter')

vim.keymap.set('n', '<leader>fc', telescope.extensions.flutter.commands, {})
