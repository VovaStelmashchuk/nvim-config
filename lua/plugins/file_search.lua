return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')

    telescope.setup {
      defaults = {
        file_ignore_patterns = { "node_modules" }
      },
    }

    vim.keymap.set('n', '<space>ff', builtin.find_files, {})
    vim.keymap.set('n', '<space>gs', builtin.live_grep, {})
  end
}
