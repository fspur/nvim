local status_ok, treesitter = pcall(require, 'nvim-treesitter')
if not status_ok then return end

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then return end

configs.setup({
  ensure_installed = { "markdown", "markdown_inline", "bash", "python", "ruby", "go" },
	ignore_install = { "" }, 
	sync_install = false,

  highlight = {
		enable = true,
		disable = { "lua" },
	},
	endwise = {
		enable = true,
},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "python", "css" } },

	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},

})