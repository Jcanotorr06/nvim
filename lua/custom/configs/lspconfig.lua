local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.config.lspconfig").capabilities

local lspconfig = require("lspconfig")

lspconfig.tsserver.setup({
  on_attach = on_attach,
  capabilities = capabilities
}) 
