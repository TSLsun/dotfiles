local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})
local TslsunGroup = augroup('Tslsun', {})

autocmd('TextYankPost', {
  group = yank_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 160,
    })
  end,
})

autocmd({"BufWritePre"}, {
    group = TslsunGroup,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

function R(name)
    require("plenary.reload").reload_module(name)
end
