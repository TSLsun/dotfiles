local theme_ivy = { theme = "ivy", sort_lastused = true, }

require("telescope").setup {
  pickers = {
    buffers = { theme = "ivy", sort_lastused = true, },
    find_files = { theme = "ivy"},
  },
  defaults = {
    prompt_prefix = "  ",
    selection_caret = " ",
    path_display = { "smart" },
    entry_prefix = "  ",
    layout_config = {
      horizontal = {
        prompt_position = "bottom",
        preview_width = 0.6,
        results_width = 0.5,
      },
      bottom_pane = {
        prompt_position = "bottom",
        preview_width = 0.6,
        results_width = 0.5,
      },
      vertical = {
        mirror = false,
      },
      height = 0.85,
      width = 0.85,
      preview_cutoff = 150,
    },
  }
}
