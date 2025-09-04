local wk = require "which-key"

wk.add {
    -- comment
    { "<leader>/", "gcc", desc = "注释", remap = true },
    { "<leader>/", "gc", desc = "注释", remap = true },
    -- control
    { "<leader>q", group = "退出" },
    { "<leader>v", group = "行号显示" },
    { "<leader>vn", "<cmd>set nu!<CR>", desc = "显示行号" },
    { "<leader>vr", "<cmd>set rnu!<CR>", desc = "相对行号" },
    { "<leader>vc", "<cmd>NvCheatsheet<CR>", desc = "快捷键帮助" },
    -- LSP
    { "<leader>l", group = "LSP操作" },
    { "<leader>lt", vim.diagnostic.setloclist, desc = "问题列表" },
    { "<leader>lr", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "查找引用" },
    { "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "跳转定义" },
    { "<leader>ln", '<cmd>lua require ("nvchad.lsp.renamer")()<cr>', desc = "修改名字" },
    { "<leader>lo", "<cmd>SymbolsOutline<cr>", desc = "打开大纲" },
    -- telescope
    { "<leader>t", group = "文件管理" },
    { "<leader>tg", "<cmd>Telescope live_grep<CR>", desc = "搜索文本" },
    { "<leader>tb", "<cmd>Telescope buffers<CR>", desc = "搜索缓冲" },
    { "<leader>tm", "<cmd>Telescope marks<CR>", desc = "书签搜索" },
    { "<leader>to", "<cmd>Telescope oldfiles<CR>", desc = "最近打开" },
    { "<leader>ts", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "查找当前" },
    { "<leader>tc", "<cmd>Telescope git_commits<CR>", desc = "commit搜索" },
    { "<leader>tgs", "<cmd>Telescope git_status<CR>", desc = "status搜索" },
    { "<leader>tt", "<cmd>Telescope terms<CR>", desc = "终端切换" },
    { "<leader>th", "<cmd>Telescope help_tags<CR>", desc = "帮助" },
    { "<leader>tf", "<cmd>Telescope find_files<cr>", desc = "文件查找" },
    {
        "<leader>ta",
        "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
        desc = "全文件查找",
    },
    {
        "<leader>tv",
        function()
            require("nvchad.themes").open()
        end,
        desc = "主题切换",
    },
    -- Terminal
    -- new terminals
    { "<leader>T", group = "终端" },
    {
        "<leader>Th",
        function()
            require("nvchad.term").new { pos = "sp" }
        end,
        desc = "水平终端",
    },
    {
        "<leader>Tv",
        function()
            require("nvchad.term").new { pos = "vsp" }
        end,
        desc = "垂直终端",
    },
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
    --{ "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "切换" },
    --{ "<leader>ef", "<cmd>NvimTreeFocus<CR>", desc = "定位" },
}

-- tabufline
if require("nvconfig").ui.tabufline.enabled then
    wk.add {
        { "<leader>b", group = "Buffer操作" },
        { "<leader>bn", "<cmd>enew<CR>", desc = "新建缓冲" },
        {
            "<leader>bx",
            function()
                require("nvchad.tabufline").close_buffer()
            end,
            desc = "关闭缓冲",
        },
    }
end
