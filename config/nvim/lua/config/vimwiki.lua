vim.g.vimwiki_list = {
  {
    path = "~/vimwiki/",
    syntax = "markdown",
    ext = ".md",
  }
}

-- Set up keybindings for vimwiki
vim.keymap.set(
  'n',
  '<leader>ww',
  ':VimwikiIndex<CR>',
  { silent = true, desc ='Open Vimwiki index' })

vim.keymap.set(
  'n',
  '<leader>wt',
  ':VimwikiTabIndex<CR>',
  { silent = true, desc = 'Open Vimwiki in new tab' })

-- Optional: Lazy loading using autocommands
local vimwiki_group = 
  vim.api.nvim_create_augroup('VimwikiLazyLoad', { clear = true })

vim.api.nvim_create_autocmd({'BufEnter'}, {
  pattern = '*.md',
  group = vimwiki_group,
  callback = function()
    -- Ensure vimwiki is loaded
    pcall(function()
      vim.cmd('packadd vimwiki')
    end)
  end
})
