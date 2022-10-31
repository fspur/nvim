vim.g.mapleader = ' '
local opts = { noremap = true, silent = true }

-- Clear highlights
vim.api.nvim_set_keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
vim.api.nvim_set_keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
vim.api.nvim_set_keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
vim.api.nvim_set_keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
vim.api.nvim_set_keymap("v", "<", "<gv", opts)
vim.api.nvim_set_keymap("v", ">", ">gv", opts)

-- Git
vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- better moving keys
vim.api.nvim_set_keymap('n', '<C-h>', ':wincmd h<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', ':wincmd j<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', ':wincmd k<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', ':wincmd l<CR>', {silent = true})

-- better indentation
vim.api.nvim_set_keymap('v', '<', '<gv', opts)
vim.api.nvim_set_keymap('v', '>', '>gv', opts)

-- Navigate buffers
vim.api.nvim_set_keymap("n", "<S-l>", ":bnext<CR>", opts)
vim.api.nvim_set_keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
vim.api.nvim_set_keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Better paste
vim.api.nvim_set_keymap("v", "p", '"_dP', opts)

-- better moving lines
vim.api.nvim_set_keymap('v', 'J', ':m \'>+1<CR>gv=gv', opts)
vim.api.nvim_set_keymap('v', 'K', ':m \'<-2<CR>gv=gv', opts)

-- resizing
vim.api.nvim_set_keymap('n', '<Leader>-', ':vertical resize -5<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>=', ':vertical resize +5<CR>', opts)

-- ctrl+backspace
vim.api.nvim_set_keymap('i', '<C-h>', '<C-w>', opts)

-- tab movements
vim.api.nvim_set_keymap('n', '<Leader>n', ':bn<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>p', ':bp<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>tn', ':tabnew<Space>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>tm', ':tabmove<Space>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>tp', ':tabclose<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>to', ':tabonly<CR>', {noremap = true})

-- quickfix
vim.api.nvim_set_keymap('n', '<Leader>j', ':cnext<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>k', ':cprev<CR>', opts)

-- toggle term
function _G.set_terminal_keymaps()
  local opt = {noremap = true}
  vim.api.nvim_buf_set_vim.api.nvim_set_keymap(0, 't', '<C-[>', [[<C-\><C-n>]], opt)
  vim.api.nvim_buf_set_vim.api.nvim_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opt)
  vim.api.nvim_buf_set_vim.api.nvim_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opt)
  vim.api.nvim_buf_set_vim.api.nvim_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opt)
  vim.api.nvim_buf_set_vim.api.nvim_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opt)
  vim.api.nvim_buf_set_vim.api.nvim_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opt)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_vim.api.nvim_set_keymaps()')

-- lsp
vim.api.nvim_set_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', opts)
vim.api.nvim_set_keymap('n', 'K', ':lua vim.lsp.buf.hover()<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>rn', ':lua vim.lsp.buf.rename()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gr', ':lua vim.lsp.buf.references()<CR>', opts)
vim.api.nvim_set_keymap("n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)

vim.api.nvim_set_keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>li", "<cmd>LspInfo<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
vim.api.nvim_set_keymap("n", "]e", ":lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
vim.api.nvim_set_keymap("n", "[e", ":lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)

-- telescope
vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", {silent = true, noremap = true})

vim.api.nvim_set_keymap("n", "<leader>df", ":DiffviewOpen<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>dc", ":DiffviewClose<CR>", opts)

