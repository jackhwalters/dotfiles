-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = false,
        custom = {
            "^.git$",
            "^__pycache__$",
            "^.pytest_cache$"
        }
	},
    git = {
        enable = true,
        ignore = false
    }
})

-- Map Tree commands
vim.api.nvim_set_keymap('n', '<leader>tre', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>trf', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>trc', ':NvimTreeCollapse<CR>', { noremap = true, silent = true })
