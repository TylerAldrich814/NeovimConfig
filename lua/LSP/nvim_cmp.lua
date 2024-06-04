--- nvim/lua/LSP/nvim_cmp.lua
--
require("cmp_git").setup()
local ls = require("luasnip.loaders.from_vscode").lazy_load()
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    expand = function( args )
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
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
      { name="git" },
    },
    {
      { name="buffer" },
    }
)})

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

-- --# get Definition in virtical split
-- vim.api.nvim_set_keymap("n", "<leader>gdv", "<cmd> vsplit | lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
-- --# get Definition in horizontal split
-- vim.api.nvim_set_keymap("n", "<leader>gdh", "<cmd> split | lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
-- --# Open Definition in new buffer
-- vim.api.nvim_set_keymap("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
--
-- vim.api.nvim_set_keymap("n", "<leader>gr", "<cmd>:belowright split | lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
--
-- vim.api.nvim_set_keymap("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })


return cmp, ls, luasnip
