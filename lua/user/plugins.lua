local fn = vim.fn

-- Automatically  install packer
-- local install_path = fn.stdpath "data" .. "site/pack/packer/start/packer.nvim"
-- if fn.empty(fn.glob(install_path)) > 0 then
--     PACKER_BOOTSTRAP = fn.system {
--         "git",
--         "clone",
--         "--deepth",
--         "1",
--         "https://github.com/wbthomason/packer.nvim",
--         install_path,
--     }
--     print "Installing packer close and reopen Neovim..."
--     vim.cmd [[packadd packer.nvim]]
-- end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]


-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float {border = "rounded"}
        end
    },
    git = {
        default_url_format = 'https://hub.gitfast.tk/%s.git'
    }
}

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins 
    use 'kyazdani42/nvim-web-devicons'
    use 'nvim-lualine/lualine.nvim'
    use "goolord/alpha-nvim"

    -- Colorscheme
    use 'folke/tokyonight.nvim'
    use 'Mofiqul/vscode.nvim'
    use "EdenEast/nightfox.nvim"

    -- cmp plugins
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"

    -- snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- LSP
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"

    -- Telescope
    use 'nvim-telescope/telescope.nvim'


    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- nvim-tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
          'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
    }

    -- bufferline
    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

    -- gitsigns
    use {
      'lewis6991/gitsigns.nvim',
      -- tag = 'release' -- To use the latest release
    }

    -- Harpoon
    use 'ThePrimeagen/harpoon'

    -- Project
    use "ahmedkhalf/project.nvim"

    -- ToggleTerm
    use "akinsho/toggleterm.nvim"

    -- AutoPaire
    use "windwp/nvim-autopairs"

    -- Which Key
    use "folke/which-key.nvim"

    -- Comment
    use 'numToStr/Comment.nvim'
    
    -- lspkind vscode-like pictograms
    use "onsails/lspkind.nvim"

    -- nvim-dap
    use 'mfussenegger/nvim-dap'
    use "theHamsta/nvim-dap-virtual-text"
    use "rcarriga/nvim-dap-ui"
    use "nvim-telescope/telescope-dap.nvim"
    use "mfussenegger/nvim-dap-python"
    use "leoluz/nvim-dap-go"
    use 'simrat39/rust-tools.nvim'

    -- Automatically set up  your configuration file after cloning packer.nvim
    -- Put this at the end of all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
