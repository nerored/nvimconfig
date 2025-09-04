return {
    -- ==============================================
    -- 核心基础插件（启动时加载，优先级最高）
    -- ==============================================
    {
        "nvim-lua/plenary.nvim",
        lazy = false, -- 底层工具库，全局依赖
    },
    {
        "mason-org/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            ensure_installed = {}, -- 按需添加需要自动安装的 LSP 服务
        },
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = true,
        config = function()
            require "configs.lspconfig"
        end,
        dependencies = {
            "mason-org/mason-lspconfig.nvim",
        },
    },

    -- ==============================================
    -- 代码补全/片段（插入模式加载）
    -- ==============================================
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            -- 代码片段核心
            {
                "L3MON4D3/LuaSnip",
                dependencies = "rafamadriz/friendly-snippets",
                opts = {
                    history = true,
                    updateevents = "TextChanged,TextChangedI",
                },
                config = function(_, opts)
                    require("luasnip").config.set_config(opts)
                    require "nvchad.configs.luasnip"
                end,
            },
            -- 自动补全括号
            {
                "windwp/nvim-autopairs",
                opts = {
                    fast_wrap = {},
                    disable_filetype = { "TelescopePrompt", "vim" },
                },
                config = function(_, opts)
                    require("nvim-autopairs").setup(opts)
                    -- 关联 cmp 自动补全
                    local cmp_autopairs = require "nvim-autopairs.completion.cmp"
                    require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
                end,
            },
            -- CMP 补全源（拆分每个源，修复语法错误）
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lua" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-buffer" },
            { "https://codeberg.org/FelipeLema/cmp-async-path.git" },
        },
        opts = function()
            return require "configs.nvimcmp"
        end,
    },
    {
        "github/copilot.vim",
        event = "InsertEnter", -- 延迟到插入模式，避免与 cmp 冲突
        config = function()
            ---- Copilot 基础配置，避免空函数
            --vim.g.copilot_no_tab_map = true
            --vim.g.copilot_assume_mapped = true
            ---- 绑定快捷键（与 cmp 无冲突）
            --vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', {
            --    silent = true,
            --    expr = true,
            --    desc = "Copilot: Accept suggestion",
            --})
        end,
    },

    -- ==============================================
    -- 代码编辑增强（按需加载）
    -- ==============================================
    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- 保存前格式化
        opts = require "configs.conform",
    },
    {
        "p00f/nvim-ts-rainbow",
        lazy = false,
        dependencies = { "nvim-treesitter/nvim-treesitter" }, -- 显式依赖
    },
    {
        "phaazon/hop.nvim",
        event = "BufRead",
        config = function()
            require("hop").setup()
            vim.api.nvim_set_keymap("n", "s", ":HopWord<cr>", { silent = true })
            vim.api.nvim_set_keymap("n", "S", ":HopLine<cr>", { silent = true })
        end,
    },
    {
        "nvim-pack/nvim-spectre",
        event = "VeryLazy",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("spectre").setup()
        end,
    },

    -- ==============================================
    -- UI/导航工具（按需加载）
    -- ==============================================
    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        opts = function()
            return require "configs.nvimtree"
        end,
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show { global = false }
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
        config = function()
            require "configs.whichkey"
        end,
    },
    {
        "simrat39/symbols-outline.nvim",
        cmd = "SymbolsOutline",
        config = function()
            require("symbols-outline").setup()
        end,
    },
    {
        "folke/trouble.nvim",
        opts = {},
        cmd = "Trouble",
        keys = {
            { "<leader>lx", "<cmd>Trouble diagnostics toggle<cr>", desc = "查看问题" },
            { "<leader>lX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "查看当前缓冲区问题" },
            { "<leader>ls", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "符号浏览" },
            { "<leader>ll", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP 浏览" },
            { "<leader>lL", "<cmd>Trouble loclist toggle<cr>", desc = "位置列表" },
            { "<leader>lQ", "<cmd>Trouble qflist toggle<cr>", desc = "快速修复列表" },
        },
    },
    {
        "sphamba/smear-cursor.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- 补全依赖
        opts = {
            enabled = true,
            cursor = {
                shape = "block",
                blink = true,
            },
            particles_enabled = true,
            --particles_max_num = 200,
            --stiffness = 0.5,
            --trailing_stiffness = 0.2,
            --trailing_exponent = 5,
            --damping = 0.6,
            --gradient_exponent = 0,
        },
    },
    -- ==============================================
    -- Git 辅助（按需加载）
    -- ==============================================
    {
        "f-person/git-blame.nvim",
        event = "BufRead",
        config = function()
            vim.cmd "highlight default link gitblame SpecialComment"
            vim.g.gitblame_enabled = 1
        end,
    },

    -- ==============================================
    -- AI 辅助（延迟加载）
    -- ==============================================
    {
        "yetone/avante.nvim",
        build = vim.fn.has "win32" ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
            or "make",
        event = "VeryLazy",
        version = false,
        opts = {
            instructions_file = "avante.md",
            provider = "copilot",
            providers = {
                copilot = {
                    endpoint = "https://api.githubcopilot.com",
                    model = "gemini-3-pro-preview",
                    proxy = nil, -- [protocol://]host[:port] Use this proxy
                    allow_insecure = false, -- Allow insecure server connections
                    timeout = 30000, -- Timeout in milliseconds
                    context_window = 64000, -- Number of tokens to send to the model for context
                    use_response_api = copilot_use_response_api, -- Automatically switch to Response API for GPT-5 Codex models
                    support_previous_response_id = false, -- Copilot doesn't support previous_response_id, must send full history
                    -- NOTE: Copilot doesn't support previous_response_id, always sends full conversation history including tool_calls
                    -- NOTE: Response API doesn't support some parameters like top_p, frequency_penalty, presence_penalty
                    extra_request_body = {
                        -- temperature is not supported by Response API for reasoning models
                        max_tokens = 20480,
                    },
                },
            },
            behaviour = {
                auto_suggestions = false,
                auto_set_highlight_group = true,
                auto_set_keymaps = true,
                auto_apply_diff_after_generation = false,
                support_paste_from_clipboard = false,
                minimize_diff = true,
                enable_token_counting = true,
                auto_add_current_file = true,
                enable_cursor_planning_mode = true,
                enable_claude_text_editor_tool_mode = true,
                confirmation_ui_style = "inline_buttons",
            },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "hrsh7th/nvim-cmp",
            "nvim-tree/nvim-web-devicons",
            "github/copilot.vim",
            -- 可选依赖
            { "echasnovski/mini.pick", lazy = true },
            { "nvim-telescope/telescope.nvim", lazy = true },
            { "ibhagwan/fzf-lua", lazy = true },
            { "stevearc/dressing.nvim", lazy = true },
            { "folke/snacks.nvim", lazy = true },
            {
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = { insert_mode = true },
                        use_absolute_path = true,
                    },
                },
            },
            {
                "MeanderingProgrammer/render-markdown.nvim",
                opts = { file_types = { "markdown", "Avante" } },
                ft = { "markdown", "Avante" },
            },
        },
    },
}
