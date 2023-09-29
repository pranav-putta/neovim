return {
  "folke/tokyonight.nvim",
  name = "tokyonight",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("tokyonight").setup({
      style = "night",
      light_style = "day",
      transparent = true,
      styles = {
        keywords = { italic = false, bold = true }
      }
    })
    vim.cmd [[colorscheme tokyonight]]
  end
}
