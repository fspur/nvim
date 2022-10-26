-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then return end

-- Color table for highlights
-- stylua: ignore
local colors = {
  yellow   = '#EBCB8B',
  green    = '#8FBCBB',
  blue     = '#88C0D0'
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = { 'mode' },
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
  'filesize',
  cond = conditions.buffer_not_empty,
}

ins_left {
  'filename',
  cond = conditions.buffer_not_empty,
  color = { fg = colors.blue, gui = 'bold' },
}

ins_left { 'location' }

ins_left { 'progress' }

ins_left {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  colored = true, -- Displays diagnostics status in color if set to true.
  update_in_insert = false, -- Update diagnostics in insert mode.
  always_visible = false,   -- Show diagnostics even if there are none.
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
  function()
    return '%='
  end,
}

ins_left {
  -- Lsp server name .
  function()
    local msg = 'None Active'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = ' LSP:',
  color = { colors.blue },
}

-- Add components to right sections
ins_right {
  'o:encoding', -- option component same as &encoding in viml
  cond = conditions.hide_in_width,
  color = { fg = colors.green },
}

ins_right {
  'fileformat',
  symbols = {
    unix = ' unix', -- e712
    dos = ' dos',  -- e70f
    mac = ' mac',  -- e711
  },
  colored = true,
  icons_enabled = true,
}

ins_right {
  'filetype',
  icons_enabled = true,
  colored = true,
}

ins_right {
  'branch',
  icon = '',
  color = { fg = colors.blue },
}

ins_right {
  'diff',
  colored = true, -- Displays a colored diff status if set to true
  diff_color = {
    -- Same color values as the general color option can be used here.
    added    = 'DiffAdd',    -- Changes the diff's added color
    modified = 'DiffChange', -- Changes the diff's modified color
    removed  = 'DiffDelete', -- Changes the diff's removed color you
  },
  symbols = {added = '+', modified = '~', removed = '-'}, -- Changes the symbols used by the diff.
  source = nil, -- A function that works as a data source for diff.
                -- It must return a table as such:
                --   { added = add_count, modified = modified_count, removed = removed_count }
                -- or nil on failure. count <= 0 won't be displayed.
}

-- Now don't forget to initialize lualine
lualine.setup(config)
