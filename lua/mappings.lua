require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map({ "n", "i", "v" }, "<leader>q", "<cmd>wqa<cr>")

-- 配置粘贴后不覆盖默认寄存器
vim.keymap.set("v", "p", '"_dP', { noremap = true, silent = true, desc = "粘贴后不覆盖默认寄存器" })
vim.keymap.set("v", "P", '"_dP', { noremap = true, silent = true, desc = "向前粘贴后不覆盖默认寄存器" })

-- 对于普通模式下的粘贴，也可以进行类似配置
vim.keymap.set("n", "p", "p", { noremap = true, silent = true })
vim.keymap.set("n", "P", "P", { noremap = true, silent = true })
