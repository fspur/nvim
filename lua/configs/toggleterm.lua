local status_ok, toggleterm = pcall(require, 'toggleterm')
if not status_ok then return end

toggleterm.setup {
	-- size can be a number or function which is passed the current terminal
	-- size = 20 | function(term)
	function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
	end,
	open_mapping = [[<C-\>]],
	hide_numbers = false, -- hide the number column in toggleterm buffers
	shade_filetypes = {},
	shade_terminals = true,
	start_in_insert = true,
	insert_mappings = true, -- whether or not the open mapping applies in insert mode
	persist_size = true,
	-- direction = 'vertical' | 'horizontal' | 'window' | 'float',
	direction = 'float',
	close_on_exit = true, -- close the terminal window when the process exits
	float_opts = {
		border = 'curved',
	}
}

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end
