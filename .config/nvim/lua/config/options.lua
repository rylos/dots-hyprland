-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- Enable relative line numbers with absolute current line
vim.opt.relativenumber = true
vim.opt.number = true

-- Clipboard configuration
if vim.env.SSH_TTY then
  -- SSH environment - use OSC 52
  vim.opt.clipboard = "unnamedplus"
  local osc52 = require("vim.ui.clipboard.osc52")
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = osc52.copy("+"),
      ["*"] = osc52.copy("*"),
    },
    paste = {
      ["+"] = osc52.paste("+"),
      ["*"] = osc52.paste("*"),
    },
  }
else
  -- Local environment - use system clipboard
  vim.opt.clipboard = "unnamedplus"
end
-- Restore terminal cursor to vertical beam on exit
vim.api.nvim_create_autocmd("ExitPre", {
  group = vim.api.nvim_create_augroup("Exit", { clear = true }),
  command = "set guicursor=a:ver1",
  desc = "Set cursor back to beam when leaving Neovim.",
})
-- Remove "disable mouse" entries from the context menu
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("aunmenu PopUp.How-to\\ disable\\ mouse")
    vim.cmd("aunmenu PopUp.-2-")
  end,
  desc = "Remove 'disable mouse' entries from context menu",
})
