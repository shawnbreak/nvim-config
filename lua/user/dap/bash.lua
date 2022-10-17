local M = {}

local MASON_PACKAGE_PATH = require "mason-core.package".get_install_path("bash-debug-adapter")
local BASH_DEBUG_ADAPTER_BIN = MASON_PACKAGE_PATH .. "/bash-debug-adapter/bash-debug-adapter"
local BASHDB_DIR = MASON_PACKAGE_PATH .. "/bash-debug-adapter/extension/bashdb_dir"

function M.setup()
    local dap = require "dap"
    dap.adapters.sh = {
        type = "executable",
        command = BASH_DEBUG_ADAPTER_BIN,
    }
    dap.configurations.sh = {
        {
            name = "Launch Bash debugger",
            type = "sh",
            request = "launch",
            program = "${file}",
            cwd = "${fileDirname}",
            pathBashdb = BASHDB_DIR .. "/bashdb",
            pathBashdbLib = BASHDB_DIR,
            pathBash = "bash",
            pathCat = "cat",
            pathMkfifo = "mkfifo",
            pathPkill = "pkill",
            env = {},
            args = {},
            -- showDebugOutput = true,
            -- trace = true,
        }
    }
end

return M
