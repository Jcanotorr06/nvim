require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "ts_ls", "csharp_ls"}
vim.lsp.enable(servers)
vim.keymap.set("n", "<leader>l", vim.lsp.buf.format, { desc = "Format with LSP" })
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename with LSP" })

-- read :h vim.lsp.config for changing options of lsp servers 
