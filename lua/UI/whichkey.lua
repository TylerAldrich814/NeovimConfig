--- nvim/lua/UI/whichkey.lua
--

local wk = require('which-key')

vim.keymap.set('n', '<leader>e', "<cmd>lua require('Methods.Utility').TreeToggle()<cr>")
vim.keymap.set('n', '<leader>sv', '<cmd>vsplit<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>sh', '<cmd>split<cr>', { noremap = true, silent = true })

-- vim.keymap.set('n', "<leader>ts', '<cmd>lua require('Methods.Utility').ToggleSplit()<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ts', "<cmd>lua require('Methods.Utility').ToggleSplit()<cr>")

vim.keymap.set('n', '-', "<cmd>resize -1<CR>")
vim.keymap.set('n', '_', "<cmd>vertical resize +1<CR>")
vim.keymap.set('n', '+', "<cmd>vertical resize -1<CR>")
vim.keymap.set('n', '=', "<cmd>resize +1<CR>")

-- MacOS Clipboard Copy
-- Map <leader>y to yank (copy) text to the system clipboard in visual mode
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true, silent = true })

local GeneralMappings = {
  ["C-c"] = {"Copy selection to MacOS Clipboard"},
}

local BufferMappings = {
  b = {
    name = "Bufferline",
    d = { "<cmd>lua require('Methods.utility').SplitDocs()<CR>", "Split Docs Group" }
  }
}

local MoveWindowMappings = {
  m = {
    name = "Move Split Window Position",
    h = { "<cmd>lua vim.cmd('wincmd H')<CR>", "Move Window Left" },
    j = { "<cmd>lua vim.cmd('wincmd J')<CR>", "Move Window Down" },
    k = { "<cmd>lua vim.cmd('wincmd K')<CR>", "Move Window Up" },
    l = { "<cmd>lua vim.cmd('wincmd L')<CR>", "Move Window Right" },
  }
}

local ResizeWindowMappings = {
  ["<C-y"] = { "<cmd>lue vertical resize -1", "Resize Window - Left" },
  ["<C-u"] = { "<cmd>lue resize -1",          "Resize Window - Down" },
  ["<C-i"] = { "<cmd>lue resize +1",          "Resize Window - Up"   },
  ["<C-o"] = { "<cmd>lue vertical resize +1", "Resize Window - Right" },
}

local TelescopeMappings = {
  f = {
    name = "Telescope",
    f = { "<cmd>Telescope find_files<CR>", "Find File", noremap=false },
    g = { "<cmd>Telescope live_grep<CR>", "Live Grep" },
    b = { "<cmd>Telescope buffers<CR>", "Buffers" },
    h = { "<cmd>Telescope help_tags<CR>", "Help Tags" },
    r = { "<cmd>Telescope oldfiles<CR>", "Open Recent File" },
    n = { "<cmd>enew<CR>", "New File" },
  },
}


local LSPMappings = {
  g = {
    name = "CMP",
    d  = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to Definition", { noremap = true }},
    dv = { "<cmd> vsplit | lua vim.lsp.buf.definition()<CR>", "Go to Defintion | vsplit" },
    dh = { "<cmd> split  | lua vim.lsp.buf.definition()<CR>", "Go to Defintion | hsplit" },
    r  = { "<cmd>:belowright split | lua vim.lsp.buf.definition()<CR>", "Go to Definition | Below-Right"},
  },
  l = {
    name = "LSP",
    r = { "<cmd> lua vim.lsp.buf.references()<CR>",    "References" },
    i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation" },
  }
}

local BufferlineMappings = {
  -- b = {
    name = "Bufferline",
    xh   = { "<cmd> BufferLineCloseLeft<CR>",   "Close Left" },
    xo   = { "<cmd> BufferLineCloseOthers<CR>", "Close Others" },
    xl   = { "<cmd> BufferLineCloseRight<CR>",  "Close Right" },
    h    = { "<cmd> BufferLineCyclePrev<CR>",   "Cycle Prev" },
    l    = { "<cmd> BufferLineCycleNext<CR>",   "Cycle Next" },
    gt   = { "<cmd>lua require('Methods.utility').bufferline_goto_buffer()<CR>", "Jump to Buffer #"},
    gc   = { "<cmd> BufferLineGroupClose<CR>",   "Close Group" },
  -- }
}

wk.register(LSPMappings,        { prefix = "<leader>" })
wk.register(TelescopeMappings,  { prefix = "<leader>" })
wk.register(BufferlineMappings, { prefix = "<leader>" })
wk.register(MoveWindowMappings, { prefix = "<leader>" })
wk.register(BufferMappings,     { prefix = "<leader>" })
wk.register(GeneralMappings)

return wk

