-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, 'packer')
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

-- list of plugins to install
return packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- statusline
  use 'nvim-lualine/lualine.nvim'

  -- bufferline
  use 'akinsho/nvim-bufferline.lua'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- file explorer
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'

  use 'sainnhe/everforest' -- colorscheme
  use 'rmagatti/alternate-toggler' -- toggle boolean value

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  --  auto closing
  use 'windwp/nvim-autopairs'  -- autoclose parens, brackets, quotes, etc...
  use 'windwp/nvim-ts-autotag' -- autoclose tags

  use 'axelvc/template-string.nvim'

  use 'mg979/vim-visual-multi'
  use 'gcmt/wildfire.vim'

  use 'tpope/vim-surround'              -- add, del, change surrounding
  use 'vim-scripts/ReplaceWithRegister' -- replace with register contents using motion (gr + motion)

  -- autocompletion
  use 'hrsh7th/nvim-cmp' -- completion plugin
  use 'hrsh7th/cmp-buffer' -- source for text in buffer
  use 'hrsh7th/cmp-path' -- source for file system paths
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-cmdline'

  -- snippets
  use 'L3MON4D3/LuaSnip' -- snippet engine
  use 'saadparwaiz1/cmp_luasnip' -- for autocompletion
  use 'rafamadriz/friendly-snippets' -- useful snippets

  -- managing & installing lsp servers
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  -- configuring lsp servers
  use 'neovim/nvim-lspconfig' -- easily configure language servers
  use 'hrsh7th/cmp-nvim-lsp' -- for autocompletion
  use 'glepnir/lspsaga.nvim'


  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'jose-elias-alvarez/typescript.nvim'

  use 'xiyaowong/nvim-transparent'
  -- cmdline box (rm this plugin if you miss the default vim cmdline)
  -- use({
  --   "folke/noice.nvim",
  --   requires = {
  --     "MunifTanjim/nui.nvim",
  --     "rcarriga/nvim-notify",
  --   }
  -- })
  use 'folke/todo-comments.nvim'

  -- formatting & linting
  use 'jose-elias-alvarez/null-ls.nvim'

  -- commenting with gc
  use 'numToStr/Comment.nvim'

  -- git
  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim' -- For git blame & browse
  --use 'github/copilot.vim'

  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  use 'norcalli/nvim-colorizer.lua'
  use 'barrett-ruth/live-server.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'RRethy/vim-illuminate'
  use 'akinsho/toggleterm.nvim'
  use 'ThePrimeagen/harpoon'
  use 'themaxmarchuk/tailwindcss-colors.nvim'

  if packer_bootstrap then
    require("packer").sync()
  end
end)
