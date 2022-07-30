--
-- LSP setup
--
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "jdtls" ,"sumneko_lua", "dockerls", "jsonls", "yamlls",
  }
})

local lspconfig = require('lspconfig')
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local function on_attach(client, bufnr)
  if client.server_capabilities.document_formatting then
    vim.cmd([[
      augroup formatting
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
        autocmd BufWritePre <buffer> lua OrganizeImports(1000)
      augroup END
    ]])
  end

  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_highlight then
    vim.cmd([[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]])
  end

  -- Set keymap
  require('keymap.lsp').on_attach(bufnr)

end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

-- java
-- set JAVA_HOME to temurin-18.jdk (jdtls requires at least Java 17)
lspconfig["jdtls"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
  use_lombok_agent = false,
  settings = {
    java = {
      completion = {
        -- Defines the type filters.
        -- All types whose fully qualified name matches the selected filter strings will be ignored in content assist
        -- or quick fix proposals and when organizing imports.
        -- For example 'java.awt.*' will hide all types from the awt packages.
        filteredTypes = {
          "antlr.*",
          "bitronix.*",
          "com.docusign.*",
          "com.lowagi.*",
          "com.sun.*",
          "org.apache.xmlbeans.*"
        },
        -- When set to true, method arguments are guessed when a method is selected from as list of code assist proposals.
        guessMethodArguments = false,
      },
      configuration = {
        -- Controls whether to exclude extension-generated project settings files (.project, .classpath, .factorypath, .settings/)
        -- from the file explorer.
        checkProjectSettingsExclusions = false,
      },
      format = {
        settings = {
          -- Optional formatter profile name from the Eclipse formatter settings.
          profile = "GoogleStyle",
          -- Specifies the url or file path to the Eclipse formatter xml settings.
          url = "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml",
        },
      },
      -- Enable/disable the implementations code lens.
      implementationsCodeLens = {
        enabled = false,
      },
      maven = {
        -- Enable/disable download of Maven source artifacts as part of importing Maven projects.
        downloadSources = true,
      },
      -- Enable/disable the references code lens.
      referencesCodeLens = {
        enabled = true,
      },
      -- Automatically show build status on startup.
      showBuildStatusOnStart = {
        enabled = true,
      },
      -- Enable/disable the signature help.
      signatureHelp = {
        enabled = true,
      },
    }
  },
}

-- lua
lspconfig["sumneko_lua"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
  settings = {
    Lua = {
      runtime = {
        -- Get the language server to recognize LuaJIT globals like `jit` and `bit`
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim', 'use' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

lspconfig["dockerls"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
}

lspconfig["jsonls"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
}

lspconfig["yamlls"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
}
