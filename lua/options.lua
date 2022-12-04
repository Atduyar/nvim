local wo = vim.wo
local opt = vim.opt

-- set leader key
vim.g.mapleader = " "

-- set number
wo.number = true
wo.relativenumber = true

-- set tab
opt.expandtab = false
opt.shiftwidth = 4
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4

-- set list chars
opt.list = true
opt.listchars = { tab = '→ ' }

-- set colors
opt.cursorline = true
vim.cmd [[colorscheme carbonfox]]
-- require('nightfox').load("carbonfox")

-- NVimTree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.nvim_tree_auto_close = 1
opt.termguicolors = true
require("nvim-tree").setup()

-- ScrollBar
require("scrollbar").setup()

-- Lualine
require('lualine').setup()
require("bufferline").setup{}

-- LspServerInstaller
require("nvim-lsp-installer").setup{}
