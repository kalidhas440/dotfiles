-- plugins.lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Colorscheme
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  -- Icons
  {
    'nvim-tree/nvim-web-devicons',
    lazy = true,
  },
  -- Status line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          theme = 'tokyonight',
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
        },
      })
    end,
  },
  -- Bufferline for tabs
  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-web-devicons',
    config = function()
      require("bufferline").setup{}
    end,
  },
  -- File explorer
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = 'nvim-web-devicons',
    config = function()
      require("nvim-tree").setup()
    end,
  },
  -- Indent Guides
  {
    "lukas-reineke/indent-blankline.nvim",
     config = function()
       require("ibl").setup ({
     --  show_current_context = true,
      -- show_current_context_start = true,
       })
     end
   },
   -- Cursorline
   {
  	'yamatsum/nvim-cursorline',
  	config = function()
    	require('nvim-cursorline').setup({
      	cursorline = {
        enable = true,
        timeout = 1000,
        number = true,
    	}
    	})
  	end
    },
    -- Autopairs
  {
	  'windwp/nvim-autopairs',
	  config = function()
		require('nvim-autopairs').setup({})
	  end,
  },
  -- Indentation and Formatting
  {
	  'tpope/vim-sleuth',
  },
  -- Smart Handling of Indentation on Newlines
  {
    'tpope/vim-endwise',
  },
    
})
