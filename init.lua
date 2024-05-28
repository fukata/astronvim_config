local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

vim.opt.clipboard = 'unnamed,unnamedplus'
if vim.fn.has("wsl") then
  vim.g.clipboard = {
    name = "clipboard-wsl",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe"
    },
    paste = {
      ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))'
    },
    cache_enable = 0,
  }
end

require("lazy").setup { "AstroNvim/AstroNvim", version = "^4", import = "astronvim.plugins" }

