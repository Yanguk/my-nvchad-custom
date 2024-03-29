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
  highlight = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    -- lsp
    "lua-language-server",
    "typescript-language-server",
    "eslint-lsp",
    "rust-analyzer",
    "clangd",
    "yaml-language-server",
    "bash-language-server",

    -- web dev stuff
    -- "css-lsp",
    -- "html-lsp",
    -- "deno",
    -- c/cpp stuff

    -- format
    "shfmt",
    "prettier",
    "clang-format",
    "stylua",

    -- util
    "cspell",
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
    { name = "copilot",  group_index = 2 },
    { name = "nvim_lsp", group_index = 2 },
    { name = "luasnip",  group_index = 2 },
    { name = "buffer",   group_index = 2 },
    { name = "nvim_lua", group_index = 2 },
    { name = "path",     group_index = 2 },
  },
}

local js = {
  left = 'console.log("',
  right = '")',
  mid_var = '", ',
  right_var = ")",
}

M.debugprint = {
  print_tag = "DEBUG_💥",
  filetypes = {
    ["typescript"] = js,
    ["typescriptreact"] = js,
  },
}

return M
