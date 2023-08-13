local lspconfig = require "lspconfig"

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local util = require "custom.configs.util"

lspconfig["tsserver"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      importModuleSpecifierPreference = "non-relative",
    },
  },
}

lspconfig["eslint"].setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)

    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
  settings = util.eslint_settings,
}

lspconfig["bashls"].setup{
	on_attach = on_attach,
  capabilities = capabilities,
	filetypes = {"sh", "zsh", "bash"},
}

lspconfig["yamlls"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
