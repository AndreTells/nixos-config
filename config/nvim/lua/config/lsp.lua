-- Set up LSP
local lspconfig = require('lspconfig')

local cmp = require('cmp')
      
-- Set up nvim-cmp
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
    { name = 'buffer' },
  })
})

-- Set up lspconfig
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Language servers to install (you'll need to add these to systemPackages)
local servers = { 'pyright', 'nil_ls', 'clangd'}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
  }
end

vim.lsp.enable('sqruff')

-- Keybindings
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover documentation' })
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
