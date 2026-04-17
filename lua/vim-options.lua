vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.api.nvim_set_hl(0, "Normal", {bg = "#1e1e1e"})
vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})

-- Restore opaque background for Neo-tree
vim.api.nvim_set_hl(0, "NeoTreeNormal", {bg = "#272822"})
vim.api.nvim_set_hl(0, "NeoTreeNormalNC", {bg = "#272822"})
