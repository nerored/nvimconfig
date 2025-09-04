require "nvchad.mappings"

-- add yours here
-- 取消默认设置的map
vim.keymap.del("n", "<leader>n")
vim.keymap.del("n", "<leader>rn")
vim.keymap.del("n", "<leader>ch")
vim.keymap.del("n", "<leader>h")
vim.keymap.del("n", "<leader>v")
vim.keymap.del("n", "<leader>ds")
vim.keymap.del("n", "<C-n>")
vim.keymap.del("n", "<leader>e")

if require("nvconfig").ui.tabufline.enabled then
    vim.keymap.del("n", "<leader>b")
    vim.keymap.del("n", "<leader>x")
end

-- telescope
vim.keymap.del("n", "<leader>fw")
vim.keymap.del("n", "<leader>fb")
vim.keymap.del("n", "<leader>fh")
vim.keymap.del("n", "<leader>ma")
vim.keymap.del("n", "<leader>fo")
vim.keymap.del("n", "<leader>fz")
vim.keymap.del("n", "<leader>cm")
vim.keymap.del("n", "<leader>gt")
vim.keymap.del("n", "<leader>pt")
vim.keymap.del("n", "<leader>ff")
vim.keymap.del("n", "<leader>fa")
vim.keymap.del("n", "<leader>fm")

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- 配置粘贴后不覆盖默认寄存器
map("v", "p", '"_dP', { noremap = true, silent = true, desc = "粘贴后不覆盖默认寄存器" })
map("v", "P", '"_dP', { noremap = true, silent = true, desc = "向前粘贴后不覆盖默认寄存器" })

-- 对于普通模式下的粘贴，也可以进行类似配置
map("n", "p", "p", { noremap = true, silent = true })
map("n", "P", "P", { noremap = true, silent = true })

-- nvimtree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree" })

map("n", "<leader>qq", "<cmd>wqa<cr>", { desc = "完全退出" })
