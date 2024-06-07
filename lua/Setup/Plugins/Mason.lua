-->> nvim/lua/Setup/Plugins/Mason.lua
--
return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup({
      providers = {
        "mason-core.providers.github",
        "mason-core.providers.registry-api",
        "mason-core.providers.std-path",
        {
            name = "mason-core.providers.std-lib",
            use_curl = true
        },
      }
    })
    require("mason-lspconfig").setup({
      ensure_installed = { "bashls", "clangd", "jdtls", "cssls", "dockerls", "tsserver", "eslint", "html", "pyright", "rust_analyzer", "lua_ls", "yamlls", "tailwindcss" }
    })
  end
}
