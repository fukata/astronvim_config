local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- encoding
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.fileencodings = "utf-8"

vim.opt.clipboard = 'unnamed,unnamedplus'
if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "clipboard-wsl",
    copy = {
      ["+"] = "xsel --clipboard --input",
      ["*"] = "xsel --clipboard --input"
    },
    paste = {
      ["+"] = "xsel --clipboard --output",
      ["*"] = "xsel --clipboard --output"
    },
    cache_enable = 0,
  }
elseif vim.fn.has("mac") == 1 then
  vim.g.clipboard = {
    name = "clipboard-mac",
    copy = {
      ["+"] = "pbcopy",
      ["*"] = "pbcopy"
    },
    paste = {
      ["+"] = "pbpaste",
      ["*"] = "pbpaste"
    },
    cache_enable = 0,
  }
end

-- alias
-- T -> Neotest run
vim.cmd [[command! -nargs=* T Neotest run <args>]]
-- To -> Neotest output
vim.cmd [[command! -nargs=* To Neotest output <args>]]
-- keymap for Neotest
vim.api.nvim_set_keymap('n', '<S-T>', '<cmd>lua require("neotest").run.run()<CR>', { noremap = true, silent = true })

require("lazy").setup { "AstroNvim/AstroNvim", version = "^4", import = "astronvim.plugins" }

