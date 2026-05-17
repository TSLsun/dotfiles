local remap = require("utils.keymap")
local opts = remap.new_opts
local nnoremap = remap.nnoremap

local telescope_builtin = require('telescope.builtin')
local telescope_extensions = require('telescope').extensions

-- Telescope builtin
nnoremap({
  { "<C-f>",
    function()
      telescope_builtin.live_grep { search = vim.fn.expand("<cword>") }
    end,
    opts("Telescope live_grep")
  },
  { "<C-p>",
    function()
      telescope_builtin.find_files()
    end,
    opts("Telescope find_files")
  },
  {
    "<leader>pf",
    function()
      telescope_builtin.git_files()
    end,
    opts("Telescope git_files")
  },
  {
    "<leader>pb",
    function()
      telescope_builtin.buffers()
    end,
    opts("Telescope buffers")
  },
  {
    "<leader>ph",
    function()
      telescope_builtin.help_tags()
    end,
    opts("Telescope help_tags")
  },
  {
    "<leader>pk",
    function()
      telescope_builtin.keymaps()
    end,
    opts("Telescope keymaps")
  },
  {
    "<leader>gb",
    function()
      telescope_builtin.git_branches()
    end,
    opts("Telescope git_branches")
  },
})

-- grep string/word
nnoremap({
  {
    "<leader>ps",
    function()
      telescope_builtin.grep_string({ search = vim.fn.input("Grep For > ") })
    end,
    opts("Telescope grep_string for input string")
  },
  {
    "<space>fw",
    function()
      telescope_builtin.grep_string { search = vim.fn.expand("<cword>") }
    end,
    opts("Telescope grep_string for selected word")
  },
})

-- file browser
nnoremap({
  "<leader>fb",
  function()
    telescope_extensions.file_browser.file_browser()
  end,
  opts("Telescope file_browser")
})

-- git worktree
nnoremap({
  {
    "<leader>gwl",
    function()
      telescope_extensions.git_worktree.git_worktrees()
    end,
    opts("show git worktree list")
  },
  {
    "<leader>gwa",
    function()
      telescope_extensions.git_worktree.create_git_worktree()
    end,
    opts("create new git worktree")
  },
  {
    "<leader>gwx",
    function()
      telescope_extensions.git_worktree.delete_git_worktree()
    end,
    opts("remove git worktree")
  },
})
