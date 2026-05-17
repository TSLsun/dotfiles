--
--Telescope setup
--
require("telescope").setup {
  defaults = {
    prompt_prefix = "  ",
    selection_caret = " ",
    path_display = { "smart" },
    entry_prefix = "  ",
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.6,
        results_width = 0.5,
      },
      bottom_pane = {
        prompt_position = "top",
        preview_width = 0.6,
        results_width = 0.5,
      },
      center = {
        prompt_position = "top",
        width = 0.85,
        height = 0.85,
      },
      cursor = {
        width = 0.8,
        height = 0.9,
        preview_cutoff = 40,
      },
      width = 0.85,
      height = 0.9,
    },
  },
  pickers = {
    buffers = { theme = "ivy", sort_lastused = true, },
    find_files = { theme = "ivy" },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_cursor {}
    }
  }
}

require("telescope").load_extension("fzf")
require("telescope").load_extension("ui-select")
