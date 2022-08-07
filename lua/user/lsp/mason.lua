mason = require("mason")

mason.setup({

    github = {
        -- The template URL to use when downloading assets from GitHub.
        -- The placeholders are the following (in order):
        -- 1. The repository (e.g. "rust-lang/rust-analyzer")
        -- 2. The release version (e.g. "v0.3.0")
        -- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
        download_url_template = "https://hub.fastgit.xyz/%s/releases/download/%s/%s",
    },
})

require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)

        local opts = {
          on_attach = require("user.lsp.handlers").on_attach,
          capabilities = require("user.lsp.handlers").capabilities,
        }

        if server == "jsonls" then
          local jsonls_opts = require("user.lsp.settings.jsonls")
          opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
        end

        if server == "sumneko_lua" then
          local sumneko_opts = require("user.lsp.settings.sumneko_lua")
          opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
        end

        if server == "pyright" then
          local pyright_opts = require("user.lsp.settings.pyright")
          opts = vim.tbl_deep_extend("force", pyright_opts, opts)
        end

        if server == "vuels" then
          local vuels_opts = require("user.lsp.settings.vuels")
          opts = vim.tbl_deep_extend("force", vuels_opts, opts)
        end

        require("lspconfig")[server_name].setup(opts)
    end,
    -- Next, you can provide targeted overrides for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    -- ["rust_analyzer"] = function ()
    --     require("rust-tools").setup {}
    -- end
}
