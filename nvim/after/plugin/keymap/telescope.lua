local remap = require("tslsun.keymap")
local nnoremap = remap.nnoremap

local telescope = require('telescope.builtin')

nnoremap("<C-p>", function() telescope.find_files() end)
nnoremap("<leader>pf", function() telescope.git_files() end)
nnoremap("<leader>pb", function() telescope.buffers() end)
nnoremap("<leader>ph", function() telescope.help_tags() end)
nnoremap("<leader>gb", function() telescope.git_branches() end)

-- grep string/word
nnoremap("<space>fs", function()
  telescope.grep_string({ search = vim.fn.input("Grep For > ") })
end)
nnoremap("<space>fw", function()
  telescope.grep_string { search = vim.fn.expand("<cword>") }
end)

-- file browser
nnoremap("<leader>fb", function()
  require("telescope").extensions.file_browser.file_browser()
end)

-- git worktree
nnoremap("<leader>gwl", function()
  require('telescope').extensions.git_worktree.git_worktrees()
end)
nnoremap("<leader>gwa", function()
  require('telescope').extensions.git_worktree.create_git_worktree()
end)
nnoremap("<leader>gwx", function()
  require('telescope').extensions.git_worktree.delete_worktree()
end)
