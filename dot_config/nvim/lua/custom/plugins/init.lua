local overrides = require "custom.plugins.overrides"

return {
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  -- overrde plugin configs
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },

  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },
  ["NvChad/ui"] = {
    override_options = overrides.ui,
  },
  ["nvim-telescope/telescope.nvim"] = {
    config = function()
      -- require "plugins.configs.telescope"
      require "custom.plugins.telescope"
    end,
    -- override_options = overrides.telescope,
  },

  -- ["folke/which-key.nvim"] = {
  --   override_options = {
  --     disable = false,
  --   },
  -- },

  ["kyazdani42/nvim-tree.lua"] = {
    override_options = overrides.nvimtree,
  },
  -- Install a plugin

  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
    requires = { "nvim-lua/plenary.nvim" },
  },
  ["nvim-telescope/telescope-project.nvim"] = {
    initial_mode = "normal",
    requires = { "nvim-telescope/telescope.nvim" },
  },
  -- ["ahmedkhalf/project.nvim"] = {
  --   config = function()
  --     require("project_nvim").setup {
  --       patterns = {
  --         ".git",
  --         "package.json",
  --         ".terraform",
  --         "go.mod",
  --         "requirements.yml",
  --         "pyrightconfig.json",
  --         "pyproject.toml",
  --       },
  --       -- detection_methods = { "lsp", "pattern" },
  --       detection_methods = { "pattern" },
  --     }
  --   end,
  -- },

  -- load it after nvim-lspconfig cuz we lazy loaded lspconfig
  -- ["vimpostor/vim-tpipeline"] = {},
  ["nvim-treesitter/nvim-treesitter-textobjects"] = {},
  ["nvim-telescope/telescope-fzf-native.nvim"] = {
    run = "make",
  },
  ["nvim-telescope/telescope-file-browser.nvim"] = {},
  ["tpope/vim-fugitive"] = {},

  -- ["alexghergh/nvim-tmux-navigation"] = {
  --   config = function()
  --     require("nvim-tmux-navigation").setup {
  --       -- disable_when_zoomed = true, -- defaults to false
  --       keybindings = {
  --         left = "<C-h>",
  --         down = "<C-j>",
  --         up = "<C-k>",
  --         right = "<C-l>",
  --         last_active = "<C-\\>",
  --         next = "<C-Space>",
  --       },
  --     }
  --   end,
  -- },
  ["numToStr/Navigator.nvim"] = {
    config = function()
      require("Navigator").setup {}
    end,
  },
  ["nvim-neotest/neotest-python"] = {},
  ["nvim-neotest/neotest"] = {
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    -- adapters = {
    --   require "neotest-python",
    -- },
    config = function()
      require("neotest").setup {
        adapters = {
          require "neotest-python",
        },
      }
    end,
  },
  ["mfussenegger/nvim-dap-python"] = {
    after = "nvim-dap",
    config = function()
      -- require("core.lazy_load").on_file_open "nvim-dap-python.nvim"
      require("dap-python").setup(vim.env.HOME .. "/.pyenv/versions/debugpy/bin/python", {})
      -- require("dap-python").setup { "python" }
    end,
  },
  ["mfussenegger/nvim-dap"] = {

    -- config = function()
    --   -- require("core.lazy_load").on_file_open "nvim-dap-python.nvim"
    --   require("dap").setup {}
    -- end,
  },
  ["rcarriga/nvim-dap-ui"] = {
    config = function()
      require("dapui").setup {}
    end,
  },
}
