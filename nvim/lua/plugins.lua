local fn = vim.fn
local cmd = vim.cmd
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    cmd('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    cmd 'packadd packer.nvim'
end

cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- SELF-CONTAINED
    use {'wbthomason/packer.nvim', opt = true}

    -- STILL IN EXPERIMENT
    use {'tjdevries/train.nvim'}

    -- TREE-SITTER
    use {'nvim-treesitter/nvim-treesitter-refactor', after = 'nvim-treesitter'}
    use {'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter'}
    use {'nvim-treesitter/playground', after = 'nvim-treesitter'}
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
        config = function() require 'treesitter' end
    }

    -- LANGUAGE-SERVER
    use {'neovim/nvim-lspconfig',
        config = function()
            local lsp = require 'lspconfig'
            lsp.pyls.setup {}
        end
    }

    -- TELESCOPE
    use {'nvim-telescope/telescope.nvim',
        requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'},
    }

    -- COLORSCHEME
    use {'tjdevries/gruvbuddy.nvim', requires = 'tjdevries/colorbuddy.vim'}
    use {'/home/redbug312/.config/nvim/cactusbuddy',
        requires = {'tjdevries/colorbuddy.vim', 'glepnir/galaxyline.nvim'},
        config = function()
            vim.g.cactusbuddy_galaxyline_enabled = true
            require('colorbuddy').colorscheme('cactusbuddy')
        end
    }

    -- AUTO-COMPLETE
    use {'nvim-lua/completion-nvim',
        config = function()
            vim.g.completion_trigger_keyword_length = 3
            vim.cmd 'autocmd BufEnter * lua require"completion".on_attach()'
        end
    }

    -- BRACKET-MATCHING
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'cohama/lexima.vim'

    -- MOTION & OBJECTS
    use 'tpope/vim-commentary'         -- gc
    use 'christoomey/vim-sort-motion'  -- gs
    use 'junegunn/vim-easy-align'      -- ga

    -- TAGS-GENERATION
    use {'ludovicchabant/vim-gutentags',
        config = function()
            vim.g.gutentags_project_root = {'.tags'}
            vim.g.gutentags_ctags_tagfile = '.tags'
            vim.g.gutentags_file_list_command = {
                markers = { ['.git'] = 'git ls-files', ['.hg']  = 'hg files' }
            }
        end
    }

    -- MISCELLANEOUS
    use 'wakatime/vim-wakatime'
    use 'derekwyatt/vim-fswitch'

    -- USER-INTERFACE
    use 'kshenoy/vim-signature'

    use {'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function() require('gitsigns').setup {
            signs = {
                add          = { hl = 'LineNr' },
                change       = { hl = 'LineNr' },
                delete       = { hl = 'LineNr', text = '═' },
                topdelete    = { hl = 'LineNr', text = '╤' },
                changedelete = { hl = 'LineNr', text = '╧' },
            },
        } end
    }

    use {'kyazdani42/nvim-tree.lua',
        config = function()
            vim.g.nvim_tree_icons = {
                git = {
                    unstaged  = '(△)',
                    staged    = '(✓)',
                    unmerged  = '(!)',
                    renamed   = '(-)',
                    untracked = '(+)',
                },
                folder = {
                    default = '▶',
                    open    = '▼',
                }
            }
        end
    }

    use {'lvht/tagbar-markdown', after = 'tagbar'}
    use {'majutsushi/tagbar',
        config = function()
            vim.g.tagbar_autofocus = 1
            vim.g.tagbar_sort = 0
        end
    }

end)
