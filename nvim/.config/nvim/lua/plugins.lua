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
  -- use {
  --   'nvim-tree/nvim-tree.lua',
  --   requires = {
  --     'nvim-tree/nvim-web-devicons',
  --   },
  --   tag = 'nightly'
  -- }
  use 'sainnhe/everforest'
  use 'rmagatti/alternate-toggler'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  --  auto closing
  use 'windwp/nvim-autopairs'  -- autoclose parens, brackets, quotes, etc...
  use 'windwp/nvim-ts-autotag' -- autoclose tags
  use 'p00f/nvim-ts-rainbow'
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'axelvc/template-string.nvim'

  use 'mg979/vim-visual-multi'
  use 'gcmt/wildfire.vim'

  use 'tpope/vim-surround'              -- add, del, change surrounding
  use 'vim-scripts/ReplaceWithRegister' -- replace with register contents using motion (gr + motion)

  use 'kyazdani42/nvim-web-devicons'    -- File icons

  -- use 'MattesGroeger/vim-bookmarks'
  -- use 'tom-anders/telescope-vim-bookmarks.nvim'

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }

  use 'glepnir/lspsaga.nvim' -- LSP UIs
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'saadparwaiz1/cmp_luasnip'
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
  use 'manzeloth/live-server'
  -- use 'mattn/emmet-vim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'RRethy/vim-illuminate'
  -- use 'folke/zen-mode.nvim'
  use 'akinsho/toggleterm.nvim'

  use 'ThePrimeagen/harpoon'
  -- use 'andweeb/presence.nvim'
  use 'themaxmarchuk/tailwindcss-colors.nvim'

  if packer_bootstrap then
    require("packer").sync()
  end
end)
