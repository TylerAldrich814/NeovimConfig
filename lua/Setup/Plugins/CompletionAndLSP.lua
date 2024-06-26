--- nvim/lua/Setup/Plugins/CompletionAndLSP.lua
--
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "folke/lazydev.nvim",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lua",
    "neovim/nvim-lspconfig",
    "L3MON4D3/LuaSnip",
    "onsails/lspkind-nvim",
    "petertriho/cmp-git"
  },
  config = function()
    --> CMP Configuration
    require("cmp_git").setup()
    require("luasnip.loaders.from_vscode").lazy_load()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, {
        name = "lazydev",
        group_index = 0,
      })
    end

    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs(-4), 
        ['<C-d>'] = cmp.mapping.scroll_docs(4), 
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ["<C-e>"] = cmp.mapping.abort(),
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      }, {
        { name = 'buffer' },
      }),
    })

    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources(
        {
          { name = "git" },
        },
        {
          { name = "buffer" },
        }
      )
    })

    --> LSP Configuration
    local capabilities = require("cmp_nvim_lsp")
      .default_capabilities(
        vim.lsp
        .protocol
        .make_client_capabilities()
      )

    local servers = require("LSP.servers")
    for server, opts in pairs(servers) do
      opts.capabilities = capabilities
      require("lspconfig")[server].setup(opts)
    end

    require('lspkind').init({
      -- enables text annotations
      --
      -- default: true
      mode   = 'symbol_text',
      preset = 'default',
      symbol_map = {
        Text = '',
        Method = 'ƒ',
        Function = '',
        Constructor = '',
        Variable = '',
        Class = '',
        Interface = 'ﰮ',
        Module = '',
        Property = '',
        Unit = '',
        Value = '',
        Enum = '了',
        Keyword = '',
        Snippet = '﬌',
        Color = '',
        File = '',
        Reference = '',
        Folder = '',
        EnumMember = '',
        Constant = '',
        Struct = ''
      },
    })
  end
}

