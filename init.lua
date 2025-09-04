vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = ","

-- 完整配置示例（可选，确保剪贴板功能正常）
-- 检查系统是否支持剪贴板（可选判断）
vim.opt.clipboard:append "unnamedplus"

vim.opt.cursorline = true  -- 高亮当前行（可选，增强视觉效果）

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
    local repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
    {
        "NvChad/NvChad",
        lazy = false,
        branch = "v2.5",
        import = "nvchad.plugins",
    },

    { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
    require "mappings"
end)

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.relativenumber = false
