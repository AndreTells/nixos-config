-- Basic Telescope setup
require('telescope').setup({
  defaults = {
    prompt_prefix = " 🔍 ",  -- Customize prompt symbol
    selection_caret = " ❯ ",
    path_display = { "truncate" },  -- Truncate long paths
  },
  pickers = {
    -- Picker-specific configurations (optional)
    find_files = {
      hidden = true,  -- Include hidden files
    },
  },
  extensions = {
    -- Extension configurations (e.g., fzf-native)
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
    },
  },
})

-- Load extensions (e.g., fzf-native)
pcall(require('telescope').load_extension, 'fzf')

-- Set keymaps for Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fb', builtin.current_buffer_fuzzy_find, { desc = 'Find buffers' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'grep in the current file system'})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })
