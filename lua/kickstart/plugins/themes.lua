return {
  {
    'folke/tokyonight.nvim',
    name = 'tokyonight',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require('tokyonight').setup {
        -- style = 'night',
        -- light_style = 'day',
        transparent = true,
        styles = {
          keywords = { italic = false, bold = true },
        },
      }
    end,
  },

  {
    'AlexvZyl/nordic.nvim',
    name = 'nordic',
    lazy = false,
    priority = 1000,
    config = function()
      require('nordic').load()
    end,
  },
  {
    'neanias/everforest-nvim',
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require('everforest').setup {
        -- Your config here
      }
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    name = 'kanagawa',
    lazy = false,
    priority = 1000,
    config = function()
      require('kanagawa').setup({
        compile = false
      })
    end
  },
  {
    'marko-cerovac/material.nvim',
    name = 'material',
    lazy = false,
    priority = 1000,
    config = function()
      require('material').setup({
        contrast = {
          terminal = true,            -- Enable contrast for the built-in terminal
          sidebars = true,            -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
          floating_windows = true,    -- Enable contrast for floating windows
          cursor_line = true,         -- Enable darker background for the cursor line
          lsp_virtual_text = true,    -- Enable contrasted background for lsp virtual text
          non_current_windows = true, -- Enable contrasted background for non-current windows
          filetypes = {},             -- Specify which filetypes get the contrasted (darker) background
        },

        styles = { -- Give comments style such as bold, italic, underline etc.
          comments = { --[[ italic = true ]] },
          strings = { --[[ bold = true ]] },
          keywords = { --[[ underline = true ]] },
          functions = { --[[ bold = true, undercurl = true ]] },
          variables = {},
          operators = {},
          types = {},
        },

        plugins = { -- Uncomment the plugins that you use to highlight them
          -- Available plugins:
          -- "coc"
          -- "dap",
          -- "dashboard",
          -- "eyeliner",
          -- "fidget",
          -- "flash",
          -- "gitsigns",
          -- "harpoon",
          -- "hop",
          -- "illuminate",
          -- "indent-blankline",
          -- "lspsaga",
          -- "mini",
          -- "neogit",
          -- "neotest",
          -- "neo-tree",
          -- "neorg",
          -- "noice",
          -- "nvim-cmp",
          -- "nvim-navic",
          -- "nvim-tree",
          -- "nvim-web-devicons",
          -- "rainbow-delimiters",
          -- "sneak",
          -- "telescope",
          -- "trouble",
          -- "which-key",
          -- "nvim-notify",
        },

        disable = {
          colored_cursor = false, -- Disable the colored cursor
          borders = true,         -- Disable borders between verticaly split windows
          background = false,     -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
          term_colors = false,    -- Prevent the theme from setting terminal colors
          eob_lines = false       -- Hide the end-of-buffer lines
        },

        high_visibility = {
          lighter = false, -- Enable higher contrast text for lighter style
          darker = false   -- Enable higher contrast text for darker style
        },

        lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )

        async_loading = true,      -- Load parts of the theme asyncronously for faster startup (turned on by default)

        custom_colors = nil,       -- If you want to override the default colors, set this to a function

        custom_highlights = {},    -- Overwrite highlights with your own
      })
    end
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("cyberdream").setup({
        -- Recommended - see "Configuring" below for more config options
        transparent = true,
        italic_comments = true,
        hide_fillchars = true,
        borderless_telescope = true,
        terminal_colors = true,
      })
      vim.cmd("colorscheme cyberdream") -- set the colorscheme
    end,
  }
}
