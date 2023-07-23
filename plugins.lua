-- cSpell:disable
local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
        dependencies = {
          "davidmh/cspell.nvim",
        },
      },
      "neovim/nvim-lspconfig",
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "NvChad/nvterm",
    opts = overrides.nvterm,
  },

  {
    "hrsh7th/nvim-cmp",
    event = { "CmdlineEnter", "InsertEnter" },
    dependencies = {
      "hrsh7th/cmp-cmdline",
    },
    config = function(_, opts)
      require "custom.configs.cmp"
      require("cmp").setup(opts)
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },

  {
    "numToStr/Comment.nvim",
    config = function(_, opts)
      require("Comment").setup(vim.tbl_deep_extend("force", opts, {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }))
    end,
  },

  {
    "folke/zen-mode.nvim",
    cmd = { "ZenMode" },
    config = true,
  },

  {
    "nvim-pack/nvim-spectre",
    cmd = { "Spectre" },
    opts = {
      default = {
        replace = {
          cmd = "oxi",
        },
      },
    },
  },

  {
    "simrat39/rust-tools.nvim",
    event = "BufRead",
    ft = { "rust" },
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require "custom.configs.rust-tools"
    end,
  },

  {
    "iamcco/markdown-preview.nvim",
    event = "BufRead",
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    init = function()
      vim.g.mkdp_theme = "dark"
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    ft = { "typescriptreact", "javascriptreact" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewFileHistory", "DiffviewOpen" },
    config = function()
      require("diffview").setup()
    end,
  },

  {
    "ziontee113/icon-picker.nvim",
    cmd = { "IconPickerNormal" },
    dependencies = {
      {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
      },
    },
    config = function()
      require("icon-picker").setup {
        disable_legacy_commands = true,
      }
    end,
  },

  {
    "antosha417/nvim-lsp-file-operations",
    event = "InsertEnter",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-tree/nvim-tree.lua" },
    },
    config = true,
  },

  {
    "rest-nvim/rest.nvim",
    event = "BufRead",
    ft = { "http" },
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  {
    "chrishrb/gx.nvim",
    keys = { "gx" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "kevinhwang91/nvim-ufo",
    event = "BufReadPost",
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          local builtin = require "statuscol.builtin"
          require("statuscol").setup {
            relculright = true,
            segments = {
              { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
              { text = { "%s" }, click = "v:lua.ScSa" },
              { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
            },
          }
        end,
      },
    },
    opts = {
      provider_selector = function()
        return { "treesitter", "indent" }
      end,
    },
    init = function()
      vim.keymap.set("n", "zR", require("ufo").openAllFolds)
      vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
    end,
  },
}

return plugins
