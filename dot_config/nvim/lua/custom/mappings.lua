-- lua/custom/mappings
local M = {}

-- add this table only when you want to disable default keys
M.disabled = {
  n = {
    ["<C-n>"] = "",
    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
  },
}

M.general = {
  n = {
    ["<leader>x"] = { "<cmd> bn <CR>", "next buffer" },
    ["<leader>z"] = { "<cmd> bp <CR>", "previous buffer" },
  },
}

M.neotest = {
  n = {
    ["<leader>tn"] = {
      function()
        require("neotest").run.run()
        -- require("neotest").run.run { strategy = "dap" }
      end,
      "run test",
    },
    ["<leader>tf"] = {
      function()
        require("neotest").run.run(vim.fn.expand "%")
      end,
      "run test for file",
    },
    ["<leader>ta"] = {
      function()
        require("neotest").run.run "tests"
      end,
      "run test all",
    },
    ["<leader>tl"] = {
      function()
        require("neotest").run.run_last()
      end,
      "run test last",
    },
    ["<leader>ts"] = {
      function()
        require("neotest").summary.toggle()
      end,
      "run test summary",
    },
  },
}

M.telescope = {
  plugin = true,

  n = {
    ["<leader>fb"] = { "<cmd> Telescope file_browser <CR>", "file browser" },
    ["<leader>b"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
    ["<leader>f"] = { "<cmd> Telescope find_files <CR>", "find files" },
    ["<leader>s"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
    ["<leader>o"] = { "<cmd> Telescope oldfiles <CR>", "find oldfiles" },
  },
}

M.navigator = {
  n = {

    ["<C-h>"] = { "<cmd> NavigatorLeft <CR>", "navigate left" },
    ["<C-j>"] = { "<cmd> NavigatorDown <CR>", "navigate down" },
    ["<C-k>"] = { "<cmd> NavigatorUp <CR>", "navigate up" },
    ["<C-l>"] = { "<cmd> NavigatorRight <CR>", "navigate right" },
  },
  t = {
    ["<C-h>"] = { "<cmd> NavigatorLeft <CR>", "navigate left" },
    ["<C-j>"] = { "<cmd> NavigatorDown <CR>", "navigate down" },
    ["<C-k>"] = { "<cmd> NavigatorUp <CR>", "navigate up" },
    ["<C-l>"] = { "<cmd> NavigatorRight <CR>", "navigate right" },
  },
}

M.fugitive = {
  n = {
    ["<leader>gs"] = { "<cmd> G <CR>", "git status" },
    ["<leader>g"] = { "<cmd> G <CR>", "git status" },
  },
}

M.dap = {
  n = {
    ["<leader>dc"] = {
      function()
        require("dap").continue()
      end,
    },
    ["<leader>do"] = {
      function()
        require("dap").step_over()
      end,
    },
    ["<leader>di"] = {
      function()
        require("dap").step_into()
      end,
    },
    ["<leader>dt"] = {
      function()
        require("dap").step_out()
      end,
    },
    ["<leader>db"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
    },
    ["<leader>dB"] = {
      function()
        require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
      end,
    },
    ["<leader>dr"] = {
      function()
        require("dap").repl.open()
      end,
    },
    ["<leader>du"] = {
      function()
        require("dapui").toggle()
      end,
    },
    ["<leader>dn"] = {
      function()
        require("dap-python").test_method()
      end,
    },
    ["<leader>ds"] = {
      function()
        require("dap-python").debug_selection()
      end,
    },
  },
}

M.projects = {
  n = {
    ["<leader>p"] = {
      function()
        require("telescope").extensions.project.project()
      end,
    },
    -- ["<leader>pf"] = {
    --   function()
    --     require("telescope").extensions.project.find_project_files()
    --   end,
    -- },
  },
}

return M
