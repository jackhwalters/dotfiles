local builtin = require("dapui")
builtin.setup()

vim.keymap.set('n', '<leader>dt', builtin.toggle)
