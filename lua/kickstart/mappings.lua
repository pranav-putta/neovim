-- [[ Basic Keymaps ]]
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

local utils = require 'kickstart.utils'
local get_icon = utils.get_icon
local wk = require 'which-key'

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', '<leader>w', '<Cmd>w<CR>', { desc = 'Save File' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('i', 'jk', '<Esc>')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })
vim.keymap.set('n', '<leader>.', function()
  require('Comment.api').toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
end, { desc = '[.] Comment line' })

-- telescope mappings
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>sb', '<Cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>',
  { desc = '[S]earch [B]rowse' })

-- barbar mappings
vim.keymap.set('n', '<leader>b]', '<Cmd>BufferNext<CR>', { desc = 'Buffer Next' })
vim.keymap.set('n', '<leader>b[', '<Cmd>BufferPrevious<CR>', { desc = 'Buffer Previous' })
vim.keymap.set('n', '<leader>bb', '<Cmd>BufferPick<CR>', { desc = 'Buffer Pick' })
vim.keymap.set('n', '<leader>b|', function()
  vim.cmd.vsplit()
end, { desc = 'Buffer Vertical Split' })
map('n', '<leader>c', '<Cmd>BufferClose<CR>', { desc = 'Buffer Close' })

-- formatter mappings
vim.keymap.set('n', '<leader>f', require('conform').formatexpr, opts)

-- movement mappings
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- aerial mappings
vim.keymap.set('n', '<leader>m', '<Cmd>AerialToggle<CR>', { desc = 'Minimap' })

-- themery mapping
vim.keymap.set('n', '<leader>t', '<Cmd>Telescope colorscheme<CR>', { desc = 'Themes' })

-- more descriptions
wk.register({
  b = {
    name = 'Buffers/Tabs',
  },
  s = {
    name = 'Search/File Browser',
  },
  g = {
    name = 'Git',
  },
}, { prefix = '<leader>' })
