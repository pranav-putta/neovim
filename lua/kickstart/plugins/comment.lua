-- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
return {
  'numToStr/Comment.nvim',
  opts = {
    -- add any options here
    toggler = {
      line = '<leader>.',
    },
    opleader = {
      line = '<leader>.',
    }
  },
  lazy = false,
}
