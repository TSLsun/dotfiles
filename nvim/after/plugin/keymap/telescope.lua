local remap = require("tslsun.keymap")
local nnoremap = remap.nnoremap

local telescope = require('telescope.builtin')

nnoremap("<C-p>",
  function()
    telescope.find_files()
  end,
  { desc = "Telescope find_files" }
)
nnoremap("<leader>pf",
  function()
    telescope.git_files()
  end,
  { desc = "Telescope git_files" }
)
nnoremap("<leader>pb",
  function()
    telescope.buffers()
  end,
  { desc = "Telescope buffers" }
)
nnoremap("<leader>ph",
  function()
    telescope.help_tags()
  end,
  { desc = "Telescope help_tags" }
)
nnoremap("<leader>pk",
  function()
    telescope.keymaps()
  end,
  { desc = "Telescope keymaps" }
)
nnoremap("<leader>gb",
  function()
    telescope.git_branches()
  end,
  { desc = "Telescope git_branches" }
)

-- grep string/word
nnoremap("<leader>ps",
  function()
    telescope.grep_string({ search = vim.fn.input("Grep For > ") })
  end,
  { desc = "Telescope grep_string for input string" }
)
nnoremap("<space>fw",
  function()
    telescope.grep_string { search = vim.fn.expand("<cword>") }
  end,
  { desc = "Telescope grep_string for selected word" }
)

-- file browser
nnoremap("<leader>fb",
  function()
    require("telescope").extensions.file_browser.file_browser()
  end,
  { desc = "Telescope file_browser" }
)

-- git worktree
nnoremap("<leader>gwl",
  function()
    require('telescope').extensions.git_worktree.git_worktrees()
  end,
  { desc = "show git worktree list" }
)
nnoremap("<leader>gwa",
  function()
    require('telescope').extensions.git_worktree.create_git_worktree()
  end,
  { desc = "create new git worktree" }
)
nnoremap("<leader>gwx",
  function()
    require('telescope').extensions.git_worktree.delete_worktree()
  end,
  { desc = "remove git worktree" }
)
