return {
  {
    'mhartington/formatter.nvim',
    config = function()
      -- Utilities for creating configurations
      local util = require "formatter.util"
      local function prettier()
        return {
          exe = 'prettier',
          args = {
            '--config-precedence',
            'prefer-file',
            '--single-quote',
            '--no-bracket-spacing',
            '--prose-wrap',
            'always',
            '--arrow-parens',
            'always',
            '--trailing-comma',
            'all',
            '--no-semi',
            '--end-of-line',
            'lf',
            '--print-width',
            vim.bo.textwidth,
            '--stdin-filepath',
            vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
          },
          stdin = true,
        }
      end

      local function biome()
        return {
          exe = "biome",
          args = {
              "format",
              "--stdin-file-path",
              util.escape_path(util.get_current_buffer_file_path()),
            "--indent-style=space", 
            "--indent-width=4"
          },
          stdin = true,
        }
      end

      local function shfmt()
        return {
          exe = 'shfmt',
          args = { '-' },
          stdin = true,
        }
      end

      require("formatter").setup {
        logging = true,
        filetype = {
          javascript = { biome },
          typescript = { biome },
          javascriptreact = { biome },
          typescriptreact = { biome },
          vue = { prettier },
          ['javascript.jsx'] = { biome },
          ['typescript.tsx'] = { biome },
          markdown = { prettier },
          css = { prettier },
          json = { prettier },
          jsonc = { prettier },
          scss = { prettier },
          less = { prettier },
          yaml = { prettier },
          graphql = { prettier },
          html = { prettier },
          sh = { shfmt },
          bash = { shfmt },
          reason = {
            function()
              return {
                exe = 'refmt',
                stdin = true,
              }
            end,
          },
          rust = {
            function()
              return {
                exe = 'rustfmt',
                args = { '--emit=stdout' },
                stdin = true,
              }
            end,
          },
          python = {
            function()
              return {
                exe = 'black',
                args = { '--quiet', '-' },
                stdin = true,
              }
            end,
          },
          go = {
            function()
              return {
                exe = 'gofmt',
                stdin = true,
              }
            end,
          },
          nix = {
            function()
              return {
                exe = 'nixpkgs-fmt',
                stdin = true,
              }
            end,
          },
          lua = {
            function()
              return {
                exe = 'stylua',
                args = {
                  '--indent-type',
                  'Spaces',
                  '--line-endings',
                  'Unix',
                  '--quote-style',
                  'AutoPreferSingle',
                  '--indent-width',
                  vim.bo.tabstop,
                  '--column-width',
                  vim.bo.textwidth,
                  '-',
                },
                stdin = true,
              }
            end,
          },
        },
      }
    end
  }
}
