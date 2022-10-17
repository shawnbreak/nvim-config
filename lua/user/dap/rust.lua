local M = {}

function M.setup()
  local rt = require("rust-tools")

  local dbg_path = require("mason-core.package").get_install_path("codelldb") .. "codelldb/"
  local codelldb_path = dbg_path .. "extension/adapter/codelldb"
  local liblldb_path = dbg_path .. "extension/lldb/lib/liblldb.dylib"


  rt.setup({
    server = {
      on_attach = function(_, bufnr)
        -- Hover actions
        vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
        -- Code action groups
        vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
      end,
    },
    dap = {
      adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
    },
  })
end

return M
