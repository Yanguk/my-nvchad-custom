local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local cspell_config = {
  find_json = function(_cwd)
    return vim.fn.expand("~/.config/nvim/lua/custom/cspell/cspell.json")
  end,
}

local cspell = require "cspell"

local sources = {
  -- webdev stuff
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css", "tsx", "typescript", "json" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua.with { filetypes = { "lua" } },

  -- cpp
  -- b.formatting.clang_format,

  -- custom
  b.formatting.rustfmt.with { filetypes = { "rust" } },

  b.code_actions.gitsigns,

  -- b.code_actions.cspell.with {
  --   extra_args = { "--config", "~/.config/cspell.json" },
  -- },

  -- b.diagnostics.cspell.with {
  --   extra_args = { "--config", "~/.config/cspell.json" },
  -- },
  cspell.diagnostics.with { config = cspell_config },
  cspell.code_actions.with { config = cspell_config },
}

null_ls.setup {
  debug = true,
  sources = sources,
}
