local builtin = require('telescope.builtin')
local telescope = require('telescope')

telescope.load_extension('flutter')
telescope.load_extension('projects')
telescope.load_extension('git_worktree')

vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-k>', builtin.live_grep, {})
vim.keymap.set('n', '<C-b>', builtin.buffers, {})

vim.keymap.set('n', '<leader>fc', telescope.extensions.flutter.commands, {})
vim.keymap.set('n', '<leader>fp', telescope.extensions.projects.projects, {})

vim.keymap.set('n', '<leader>gw', telescope.extensions.git_worktree.git_worktrees, {})
vim.keymap.set('n', '<leader>gc', telescope.extensions.git_worktree.create_git_worktree, {})
