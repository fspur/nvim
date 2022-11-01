vim.g.mapleader = ' '
local opts = { noremap = true, silent = true }
local nvim_keymap = vim.api.nvim_set_keymap
local vim_keymap = vim.keymap.set 

-- get active buffer path
nvim_keymap('n', '<leader>gp', ":lua print(vim.fn.expand('%:p'))<CR>", opts)

-- Clear highlights
nvim_keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
nvim_keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- better moving keys
nvim_keymap('n', '<C-h>', ':wincmd h<CR>', {silent = true})
nvim_keymap('n', '<C-j>', ':wincmd j<CR>', {silent = true})
nvim_keymap('n', '<C-k>', ':wincmd k<CR>', {silent = true})
nvim_keymap('n', '<C-l>', ':wincmd l<CR>', {silent = true})

-- better indentation
nvim_keymap('v', '<', '<gv', opts)
nvim_keymap('v', '>', '>gv', opts)

-- Navigate buffers
nvim_keymap("n", "<S-l>", ":bnext<CR>", opts)
nvim_keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
nvim_keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Better paste
nvim_keymap("v", "p", '"_dP', opts)

-- better moving lines
nvim_keymap('v', 'J', ':m \'>+1<CR>gv=gv', opts)
nvim_keymap('v', 'K', ':m \'<-2<CR>gv=gv', opts)

-- resizing
nvim_keymap('n', '<Leader>-', ':vertical resize -5<CR>', opts)
nvim_keymap('n', '<Leader>=', ':vertical resize +5<CR>', opts)

-- ctrl+backspace
nvim_keymap('i', '<C-h>', '<C-w>', opts)

-- tab movements
nvim_keymap('n', '<Leader>n', ':bn<CR>', {noremap = true})
nvim_keymap('n', '<Leader>p', ':bp<CR>', {noremap = true})
nvim_keymap('n', '<Leader>tn', ':tabnew<Space>', {noremap = true})
nvim_keymap('n', '<Leader>tm', ':tabmove<Space>', {noremap = true})
nvim_keymap('n', '<Leader>tp', ':tabclose<CR>', {noremap = true})
nvim_keymap('n', '<Leader>to', ':tabonly<CR>', {noremap = true})

-- quickfix
nvim_keymap('n', '<Leader>j', ':cnext<CR>', opts)
nvim_keymap('n', '<Leader>k', ':cprev<CR>', opts)

-- lsp
nvim_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts)
nvim_keymap('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', opts)
nvim_keymap('n', 'K', ':lua vim.lsp.buf.hover()<CR>', opts)
nvim_keymap('n', '<Leader>rn', ':lua vim.lsp.buf.rename()<CR>', opts)
nvim_keymap('n', 'gr', ':lua vim.lsp.buf.references()<CR>', opts)
nvim_keymap("n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
nvim_keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
nvim_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
nvim_keymap("n", "<leader>li", "<cmd>LspInfo<cr>", opts)
nvim_keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
nvim_keymap("n", "]e", ":lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
nvim_keymap("n", "[e", ":lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)

-- telescope
nvim_keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
nvim_keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
nvim_keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
nvim_keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

nvim_keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", {silent = true, noremap = true})

nvim_keymap("n", "<leader>df", ":DiffviewOpen<CR>", opts)
nvim_keymap("n", "<leader>dc", ":DiffviewClose<CR>", opts)

-- Git
nvim_keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
vim_keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
vim_keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')
