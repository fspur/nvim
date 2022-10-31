local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then return end
bufferline.setup {
    options = {
        mode = "buffers", -- set to "tabs" to only show tabpages instead
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 18,
        separator_style = "slant",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        truncate_names = true,
        diagnostics = "nvim_lsp",
        numbers = function(opts)
            return string.format('%s', opts.raise(opts.id))
        end,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            if context.buffer:current() then
                return ''
            end

            return ''
        end
    }
}
