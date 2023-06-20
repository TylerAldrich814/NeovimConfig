vim.keymap.set('n', '<leader>gs', vim.cmd.Git)

local Fugitive = vim.api.nvim_create_augroup("Fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
  group = Fugitive,
  pattern = "*",
  callback = function ()
    if vim.bo.ft ~= "fugitive" then
      return
    end

    local bufnr = vim.opt.nvim_get_current_buf()
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set('n', '<leader>g', function()
        vim.cmd.Git('push')
    end, opts)

    -- rebase always
    vim.keymap.set('n', '<leader>P', function()
      vim.cmd.Git({ 'pull', '--rebase' })
    end, opts)

    -- Easily sets the branch you are pushing and any tracking
    -- needed if you didn't set the branch up correctly.
    vim.keymap.set('n', '<leader>t', ':Git push -u origin', opts);
  end
})
