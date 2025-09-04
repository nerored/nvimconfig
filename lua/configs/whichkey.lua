local wk = require "which-key"

wk.add {
    -- LSP
    { "<leader>l", group = "LSP操作" },
    { "<leader>lr", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "查找引用" },
    { "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "跳转定义" },
    { "<leader>ln", '<cmd>lua require ("nvchad.lsp.renamer")()<cr>', desc = "修改名字" },
    { "<leader>lo", "<cmd>SymbolsOutline<cr>", desc = "打开大纲" },
    -- File Finder
    { "<leader>f", group = "搜索操作" },
    -- AI
    { "<leader>a", group = "AI操作" },
    { "<leader>aa", "<cmd>AvanteAsk<cr>", desc = "AI提问" },
    -- Searcher
    { "<leader>s", group = "搜索替换" },
    { "<leader>ss", "<cmd>lua require('spectre').toggle()<CR>", desc = "打开搜索" },
    { "<leader>sw", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", desc = "搜索当前" },
    {
        "<leader>sp",
        "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>",
        desc = "搜索当前文件",
    },
    -- nvimtree
    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "文件列表" },
}
