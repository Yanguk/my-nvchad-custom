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
    -- "c",
    "markdown",
    "markdown_inline",
    "json",
    "rust",
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    -- "lua-language-server",
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

return M
