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
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  -- statusline
  use 'nvim-lualine/lualine.nvim'
  -- bufferline
  use 'akinsho/nvim-bufferline.lua'

  use 'nvim-lua/plenary.nvim' -- Common utilities
  -- file explorer
  -- use {
  --   'nvim-tree/nvim-tree.lua',
  --   requires = {
  --     'nvim-tree/nvim-web-devicons',
  --   },
  --   tag = 'nightly'
  -- }
  use 'sainnhe/everforest' -- colorscheme
  use 'rmagatti/alternate-toggler'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  --  auto closing
  use 'windwp/nvim-autopairs'  -- autoclose parens, brackets, quotes, etc...
  use 'windwp/nvim-ts-autotag' -- autoclose tags
  use 'p00f/nvim-ts-rainbow'

  use 'mg979/vim-visual-multi'
  use 'gcmt/wildfire.vim'

  use 'tpope/vim-surround'              -- add, del, change surrounding
  use 'vim-scripts/ReplaceWithRegister' -- replace with register contents using motion (gr + motion)

  use 'kyazdani42/nvim-web-devicons'    -- File icons

  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'MattesGroeger/vim-bookmarks'
  use 'tom-anders/telescope-vim-bookmarks.nvim'

  -- autocompletion
  use 'hrsh7th/cmp-buffer' -- source for text in buffer
  use 'hrsh7th/cmp-path'   -- source for file system paths
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'onsails/lspkind-nvim'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'

  -- configuring lsp servers
  use 'hrsh7th/cmp-nvim-lsp' -- for autocompletion
  use 'glepnir/lspsaga.nvim' -- LSP UIs
  use 'jose-elias-alvarez/typescript.nvim'

  use 'L3MON4D3/LuaSnip' -- snippet engine

  -- style
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
  use 'jayp0521/mason-null-ls.nvim'

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
  use 'manzeloth/live-server'
  use 'mattn/emmet-vim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'RRethy/vim-illuminate'
  use 'folke/zen-mode.nvim'
  use 'akinsho/toggleterm.nvim'

  use 'themaxmarchuk/tailwindcss-colors.nvim'

  if packer_bootstrap then
    require("packer").sync()
  end
end)
