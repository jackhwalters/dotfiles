return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use { 'catppuccin/nvim', as = 'catppuccin' }

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

    use {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup {} end
    }

    use('preservim/nerdcommenter')

    use('ThePrimeagen/vim-be-good')
end)
