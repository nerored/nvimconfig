require("nvchad.configs.lspconfig").defaults()

local servers = { "githubcopilot", "gopls", "buf_ls", "jsonls", "bashls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
vim.lsp.config["githubcopilot"] = {}
