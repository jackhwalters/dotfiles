return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use { 'catppuccin/nvim', as = 'catppuccin' }

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    use('nvim-treesitter/playground')

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
    }

    use('mbbill/undotree')

    use('tpope/vim-fugitive')

    use('airblade/vim-gitgutter')

    use('sindrets/diffview.nvim')

    use('mfussenegger/nvim-dap')
    use { 'rcarriga/nvim-dap-ui', requires = {'mfussenegger/nvim-dap'} }
    use {
        'theHamsta/nvim-dap-virtual-text',
        requires = {'mfussenegger/nvim-dap'},
        config = function()
            local dap = require('dap')
            local dapui = require('dapui')
            dapui.setup()
            dap.listeners.after.event_initialized['dapui_config'] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated['dapui_config'] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited['dapui_config'] = function()
                dapui.close()
            end
        end
    }

    use {
        'mfussenegger/nvim-dap-python',
        requires = {'mfussenegger/nvim-dap', 'rcarriga/nvim-dap-ui'},
        config = function()
            require('dap-python').setup(
                '$HOME/.local/share/nvim/mason/packages/debugpy/venv/bin/python'
            )
        end
    }

    use {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup {} end
    }

    use('preservim/nerdcommenter')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
            {'neovim/nvim-lspconfig'},
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
            {'jose-elias-alvarez/null-ls.nvim'},
        }
    }

    use('ThePrimeagen/vim-be-good')
end)
