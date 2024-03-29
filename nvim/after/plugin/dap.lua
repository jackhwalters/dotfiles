local builtin = require('dap')
vim.keymap.set('n', '<F1>', function() builtin.continue() end)
vim.keymap.set('n', '<F2>', function() builtin.step_over() end)
vim.keymap.set('n', '<F3>', function() builtin.step_into() end)
vim.keymap.set('n', '<F4>', function() builtin.step_out() end)
vim.keymap.set('n', '<F5>', function() builtin.terminate() end)
vim.keymap.set('n', '<Leader>b', function() builtin.toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() builtin.set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp', function() builtin.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() builtin.repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() builtin.run_last() end)
vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
    require('dap.ui.widgets').hover()
end)
vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
    require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
end)
