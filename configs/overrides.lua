local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    -- "html",
    -- "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "json",
    "rust",
    "http",
    "toml",
  },
  indent = {
    enable = true,
    -- disable = { "rust", 'typescript' },
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
  },
  highlight = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    -- "css-lsp",
    -- "html-lsp",
    "typescript-language-server",
    "eslint-lsp",
    -- "deno",
    "prettier",
    "rust-analyzer",
    "cspell",
    -- c/cpp stuff
    -- "clangd",
    -- "clang-format",
    "yaml-language-server",
    "bash-language-server",
    "shfmt",
    "yamlfmt",
    "taplo",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = { enable = true },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.nvterm = {
  terminals = {
    type_opts = {
      float = {
        row = 0.02,
        col = 0.048,
        width = 0.905,
        height = 0.9,
      },
    },
  },
}

M.telescope = {
  pickers = {
    buffers = {
      -- show_all_buffers = true,
      -- sort_lastused = true,
      -- theme = "dropdown",
      -- previewer = false,
      mappings = {
        i = {
          ["<c-d>"] = "delete_buffer",
        },
      },
    },
    oldfiles = {
      cwd_only = true,
    },
  },
}

M.copilot = {
  -- Possible configurable fields can be found on:
  -- https://github.com/zbirenbaum/copilot.lua#setup-and-configuration
  suggestion = {
    enable = false,
  },
  panel = {
    enable = false,
  },
  filetypes = { ["*"] = true },
}

-- for copilot-cmp
M.cmp = {
  sources = {
    { name = "copilot", group_index = 2 },
    { name = "nvim_lsp", group_index = 2 },
    { name = "luasnip", group_index = 2 },
    { name = "buffer", group_index = 2 },
    { name = "nvim_lua", group_index = 2 },
    { name = "path", group_index = 2 },
  },
}

return M
