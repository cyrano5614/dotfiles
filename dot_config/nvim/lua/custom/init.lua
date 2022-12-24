-- swap
vim.cmd [[ 
  set noswapfile 
  map , <leader>
]]
-- vim.opt.laststatus = 2 -- global statusline
vim.opt.cmdheight = 1 -- global statusline
-- vim.fn.sign_define("DapBreakpoint", { text = "⬤", texthl = "DapBreakpoint", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
vim.keymap.set("n", "] ", "o<Esc>k")
vim.keymap.set("n", "[ ", "O<Esc>j")
vim.keymap.set("n", "<Leader>c", "<CMD>bd<CR>")

-- vim.g.loaded_python_provier = 1
-- vim.g.loaded_python3_provier = 1
-- vim.g.python_host_prog = vim.env.HOME .. "/.pyenv/versions/neovim/bin/python"
-- vim.g.python3_host_prog = vim.env.HOME .. "/.pyenv/versions/neovim/bin/python"
-- require("telescope").load_extension "projects"
-- require("telescope").load_extension "fzf"
