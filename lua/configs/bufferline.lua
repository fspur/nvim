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
    tab_size = 20,
    separator_style = "thin",
		close_command = "bdelete! %d",
		right_mouse_command = "bdelete! %d",
		left_mouse_command = "buffer %d",
		middle_mouse_command = nil,
		max_name_length = 18,
		max_prefix_length = 15,
		truncate_names = true,
		tab_size = 18,
		diagnostics_update_in_insert = false,
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			return "("..count..")"
	  end
  }
}