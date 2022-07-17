local remap = require("tslsun.keymap")
local nnoremap = remap.nnoremap

local telescope = require('telescope.builtin')

--nnoremap("<C-p>", ":Telescope")

nnoremap("<C-p>", function() telescope.find_files() end)
nnoremap("<leader>pf", function() telescope.git_files() end)

nnoremap("<leader>ps", function()
    telescope.grep_string({ search = vim.fn.input("Grep For > ")})
end)
nnoremap("<leader>pw", function()
  telescope.grep_string { search = vim.fn.expand("<cword>") }
end)

nnoremap("<leader>pb", function() telescope.buffers() end)
nnoremap("<leader>vh", function() telescope.help_tags() end)

nnoremap("<leader>gc", function() telescope.git_branches() end)

nnoremap("<leader>gw", function()
    require('telescope').extensions.git_worktree.git_worktrees()
end)
nnoremap("<leader>gm", function()
    require('telescope').extensions.git_worktree.create_git_worktree()
end)

