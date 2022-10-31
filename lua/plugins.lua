local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer... Please close and reopen neovim."
  vim.cmd [[packadd packer.nvim]]
end

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
      return require("packer.util").float { border = "rounded" }
    end,
  },
  git = {
    clone_timeout = 300, -- Timeout, in seconds, for git clones
  },
}

local disabled_built_ins = {
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"spellfile_plugin",
	"matchit"
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end

return require('packer').startup(function()
	use {
        'wbthomason/packer.nvim'
    }

    use {
        'fspur/nord.nvim',
		config = [[require('configs.colorscheme')]],
    }

	use {
		"neovim/nvim-lspconfig",
		config = [[require('configs.lsp')]],
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		config = [[require('configs.treesitter')]]
	}

	use {
        'nvim-lua/plenary.nvim'
    }

	-- use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use {
		'nvim-telescope/telescope.nvim',
		config = [[require('configs.telescope')]],
	}

    use {
        'numToStr/Comment.nvim',
		config = function()
			require("Comment").setup()
		end
    }

	use {
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup()
		end
	}

	use {
		'lewis6991/gitsigns.nvim',
		config = [[require('configs.gitsigns')]]
	}

    use {
        'tpope/vim-fugitive',
    }

 	use {
        'sindrets/diffview.nvim'
    }

 	use {
        'jose-elias-alvarez/null-ls.nvim',
	}

    use {
		"lukas-reineke/indent-blankline.nvim",
		config = [[require('configs.indentline')]],
	}

	use { 
		'nvim-lualine/lualine.nvim',
		config = [[require('configs.lualine')]]
	}

	use {
		'akinsho/bufferline.nvim',
		config = [[require('configs.bufferline')]],
		requires = 'kyazdani42/nvim-web-devicons',
	}

	use {
		"akinsho/toggleterm.nvim",
		config = [[require('configs.toggleterm')]],
	}

	use { 
		'lewis6991/impatient.nvim',
		config = [[require('configs.impatient')]],
	}

	use {
		"windwp/nvim-autopairs",
		config = [[require('configs.autopairs')]]
	}

end)

