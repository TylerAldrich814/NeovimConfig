--- nvim/lua/Setup/lazy.lua
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local plugins = require("Setup.PluginConfigs.plugins")

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup(plugins, {
 defaults = { lazy = false },
 -- install = { colorscheme = { "tokyonight" } },
 checker = { enabled = true },
 change_detection = {
  notify = false,
 },
 performance = {
  rtp = {
   disabled_plugins = {
    "gzip",
    "matchit",
    "matchparen",
    "netrwPlugin",
    "tarPlugin",
    "tutor",
    "tohtml",
    "zipPlugin",
   },
  },
 },
 debug = true,
})

