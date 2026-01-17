vim.g.mapleader = " "

vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.clipboard = "unnamedplus"
vim.opt.textwidth = 80
vim.deprecate = function() end

require('config.lsp')
require('config.kanagawa') -- color scheme configuration
require('config.telescope')
require('config.treesitter')
require('config.vimwiki')
require('config.noice')
