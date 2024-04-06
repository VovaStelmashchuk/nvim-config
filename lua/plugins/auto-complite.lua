return {
  {
	  "L3MON4D3/LuaSnip",
	  -- follow latest release.
	  version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	  -- install jsregexp (optional!).
	  build = "make install_jsregexp"

  },
  {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer", -- For buffer completions
      "hrsh7th/cmp-path", -- For path completions
      "hrsh7th/cmp-cmdline", -- For command line completions
      "hrsh7th/cmp-nvim-lsp", -- For LSP completions
      "hrsh7th/cmp-vsnip", -- For snippet completions
      "hrsh7th/vim-vsnip", -- Snippet engine
    },
    config = function()
      local cmp = require "cmp"

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
          { name = 'vsnip' },
          { name = 'buffer' },
          { name = 'path' },
        })
      })

      -- Setup for '/' command line searching
      cmp.setup.cmdline('/', {
        sources = {
          { name = 'buffer' }
        }
      })

      -- Setup for ':' command line
      cmp.setup.cmdline(':', {
        sources = cmp.config.sources({
          { name = 'path' },
          { name = 'cmdline' }
        })
      })
    end
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
      -- Update the capabilities for LSP servers to include the completion capabilities offered by nvim-cmp
      require('lspconfig')['lua_ls'].setup { capabilities = capabilities }
      require('lspconfig')['gopls'].setup { capabilities = capabilities }
      require('lspconfig')['groovyls'].setup { capabilities = capabilities }
    end
  }
}

