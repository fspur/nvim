local status_ok, _ = pcall(vim.cmd, "colorscheme " .. COLORSCHEME)

if not status_ok then
    vim.cmd([[colorscheme slate]])
end
