local wo = vim.wo
local opt = vim.opt

-- set leader key
vim.g.mapleader = " "

-- set number
wo.number = true
wo.relativenumber = true

-- set tab
opt.expandtab = false
opt.smartindent = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

-- set backup
opt.writebackup = false
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- set list chars
opt.list = true
opt.listchars = { tab = '→ ' }

-- set updatetime
opt.updatetime = 50

-- set colors
opt.cursorline = true
vim.cmd("colorscheme nightfox")

-- nvimTree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.nvim_tree_auto_close = 1
opt.termguicolors = true

-- foldtext
function 
	_G.custom_fold_text()
	local line = vim.fn.getline(vim.v.foldstart)
	local line_count = vim.v.foldend - vim.v.foldstart + 1
	return "=>" .. line 
end
--opt.foldmethod = "indent"
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
--opt.foldtext = 'v:lua.custom_fold_text()'
opt.fillchars = { eob = "-", fold = " " }
opt.foldenable = false

require("nvim-tree").setup()

-- ScrollBar
require("scrollbar").setup()

-- Lualine
require('lualine').setup()
require("bufferline").setup{
	options = {
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				-- text = function()
				-- 	return vim.fn.getcwd()
				-- end,
				highlight = "Directory",
				text_align = "left"
			}
		}
	}
}

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
  defaults = {
    ripgrep_arguments = {
      'rg',
      '--hidden',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
  },
}

local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()
