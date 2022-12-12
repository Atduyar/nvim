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

-- set backup
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

-- set list chars
opt.list = true
opt.listchars = { tab = '→ ' }

-- set colors
opt.cursorline = true
vim.cmd("colorscheme carbonfox")
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

require('gitsigns').setup()

require('nvim-treesitter.configs').setup({
  ensure_installed = { "bash", "c", "javascript", "json", "lua", "python", "typescript", "tsx", "css", "rust", "java", "yaml", "markdown", "markdown_inline" }, -- one of "all" or a list of languages
	ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "css" }, -- list of language that will be disabled
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "python", "css" } },
})
require("telescope").setup {
  pickers = {
    buffers = {
      sort_lastused = true,
      theme = "dropdown",
      previewer = false,
      mappings = {
        i = {
          ["<c-d>"] = "delete_buffer",
	  
        },
        n = {
          ["<c-d>"] = "delete_buffer",
        }
      }
    },
    find_files = {
      theme = "dropdown"
    }
  },
}
