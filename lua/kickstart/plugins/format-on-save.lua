return {
  {
    'elentok/format-on-save.nvim',
    config = function()
      local formatters = require("format-on-save.formatters")
      require('format-on-save').setup({
        exclude_path_patterns = {
          "/node_modules/",
          ".local/share/nvim/lazy",
        },
        formatter_by_ft = {
          python = formatters.black,
          javascript = formatters.lsp
        }
      })
    end
  }
}
