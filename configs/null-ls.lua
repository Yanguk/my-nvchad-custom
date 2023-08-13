local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins
local cspell = require "cspell"
local cspell_config = require "custom.configs.cspell"

local sources = {
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css", "tsx", "typescript", "json" } },
  b.formatting.stylua.with { filetypes = { "lua" } },
  b.formatting.rustfmt.with { filetypes = { "rust" } },
  b.formatting.shfmt,
  b.formatting.yamlfmt,

  cspell.diagnostics.with({ config = cspell_config }),
  cspell.code_actions.with({ config = cspell_config }),
}

null_ls.setup {
  debug = true,
  sources = sources,
}
