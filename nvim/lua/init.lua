-- install lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: set transparent manually, this is not a neovim builtin feature
vim.g.transparent = true

-- init plug mgr, for now I use lazy.nvim
require("plugins")

-- basic config, vim.o.* and vim.g.*
require("basic")

-- neovide
require('plugin-config/neovide')
