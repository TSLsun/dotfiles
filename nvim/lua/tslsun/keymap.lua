local M = {}

function Bind(mode, outer_opts)
  outer_opts = outer_opts or { noremap = true }
  return function(lhs, rhs, opts)
    opts = vim.tbl_extend("force",
      outer_opts,
      opts or {}
    )
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

M.nmap = Bind("n", { noremap = false })
M.nnoremap = Bind("n")
M.vnoremap = Bind("v")
M.xnoremap = Bind("x")
M.inoremap = Bind("i")

return M
