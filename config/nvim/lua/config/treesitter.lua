require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true,
    -- List of languages that will be disabled for highlighting
    disable = {},
    -- Additional options for highlighting
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
  },
})
