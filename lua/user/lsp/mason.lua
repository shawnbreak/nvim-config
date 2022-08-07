require("mason").setup()
require("mason-lspconfig").setup()

lspconfig = require("lspconfig")


local servers = {
  "pyright",
  "gopls",
  "rust_analyzer",
}


for _, server in pairs(servers) do
  opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }

  if server.name == "jsonls" then
    local jsonls_opts = require("user.lsp.settings.jsonls")
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if server.name == "sumneko_lua" then
    local sumneko_opts = require("user.lsp.settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server.name == "pyright" then
    local pyright_opts = require("user.lsp.settings.pyright")
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  if server.name == "vuels" then
    local vuels_opts = require("user.lsp.settings.vuels")
    opts = vim.tbl_deep_extend("force", vuels_opts, opts)
  end

  lspconfig[server].setup(opts)
end
