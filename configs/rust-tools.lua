local rt = require "rust-tools"

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

rt.setup {
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy",
          -- overrideCommand = {
          --   "cargo",
          --   "clippy",
          --   "--fix",
          --   "--workspace",
          --   "--message-format=json",
          --   "--all-targets",
          --   "--allow-dirty",
          -- },
        },
      },
    },
  },
}
