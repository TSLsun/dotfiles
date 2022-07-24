local remap = require('utils.keymap')
local cmd = remap.cmd
local opts = remap.new_opts
local silent = remap.silent
local nnoremap = remap.nnoremap
local M = {}

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
nnoremap { '[e', vim.diagnostic.goto_prev, opts("diagnostic goto_prev", silent) }
nnoremap { ']e', vim.diagnostic.goto_next, opts("diagnostic goto_next", silent) }
nnoremap { '<space>q', vim.diagnostic.setloclist, opts("diagnostic setloclist", silent) }
nnoremap { '<space>e', vim.diagnostic.open_float, opts("diagnostic open_float", silent) }

-- See `:help vim.lsp.*` for documentation on any of the below functions
function M.on_attach(bufnr)
  local bufopts = { silent = true, buffer = bufnr }
  nnoremap { '<leader>dl', cmd("Telescope diagnostics"), bufopts }
  nnoremap { '<leader>lds', cmd("Telescope lsp_document_symbols"), bufopts }

  nnoremap { 'K', vim.lsp.buf.hover, bufopts }
  nnoremap { 'gD', vim.lsp.buf.declaration, bufopts }
  nnoremap { 'gd', vim.lsp.buf.definition, bufopts }
  nnoremap { "<leader>gd", cmd("Telescope lsp_definitions"), bufopts }
  nnoremap { 'gi', vim.lsp.buf.implementation, bufopts }
  nnoremap { "<leader>gi", cmd("Telescope lsp_implementations"), bufopts }
  nnoremap { 'gr', vim.lsp.buf.references, bufopts }
  nnoremap { "<leader>gr", cmd("Telescope lsp_references"), bufopts }
  nnoremap { '<space>D', vim.lsp.buf.type_definition, bufopts }
  nnoremap { "<leader><space>D", cmd("Telescope lsp_type_definitions"), bufopts }

  nnoremap { '<space>rn', vim.lsp.buf.rename, bufopts }
  nnoremap { '<space>ca', vim.lsp.buf.code_action, bufopts }
  nnoremap { "<leader><space>ca", cmd("Telescope lsp_code_actions"), bufopts }

  nnoremap { '<space>vh', vim.lsp.buf.signature_help, bufopts }

  nnoremap { '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts }
  nnoremap { '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts }
  nnoremap { '<space>wl',
    function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end,
    { silent = true, buffer = bufnr, desc = "print list_workspace_folders" }
  }
end

return M
