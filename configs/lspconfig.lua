local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"

local language_servers = lspconfig.util.available_servers()

for _, lsp in ipairs(language_servers) do
  if lsp ~= "lua_ls" then
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
end

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
