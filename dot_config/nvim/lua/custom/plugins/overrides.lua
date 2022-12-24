local M = {}

M.treesitter = {
  ensure_installed = {
    "bash",
    "cmake",
    "css",
    "dockerfile",
    "go",
    "hcl",
    "html",
    "java",
    "javascript",
    "json",
    "kotlin",
    "latex",
    "ledger",
    "lua",
    "markdown",
    "markdown_inline",
    "query",
    "python",
    "regex",
    "toml",
    "vim",
    "yaml",
    "help",
  },
  indent = {
    enable = false,
  },
}

M.mason = {
  ensure_installed = {
    -- bash
    "bash-language-server",
    "shfmt",
    "shellcheck",

    -- docker
    "dockerfile-language-server",

    -- json
    "json-lsp",

    -- markdown
    "marksman",

    -- python stuff
    "pyright",
    "flake8",
    "mypy",
    "black",
    "isort",
    "debugpy",

    -- terraform
    "terraform-ls",
    "tflint",

    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "typescript-language-server",
    "eslint_d",
    "prettier",

    -- latex
    "texlab",

    -- yaml
    "yaml-language-server",
    "yamllint",
  },
}

M.ui = {
  tabufline = {
    enabled = false,
  },
}

M.telescope = {
  initial_mode = "test",
  extensions_list = { "themes", "terms", "project", "fzf" },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
