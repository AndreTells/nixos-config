require('kanagawa').setup({
  compile = false,
  undercurl = true,
  commentStyle = { italic = true },
  keywordStyle = { italic = true },
  statementStyle = { bold = true },
  theme = "wave",
})
        
-- Set the colorscheme
vim.cmd("colorscheme kanagawa-dragon")
