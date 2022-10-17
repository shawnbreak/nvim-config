local M = {}

function M.setup(_)
  require("dap-python").setup("/usr/bin/python3", {})


  local dap = require('dap')
  dap.configurations.python = {
    {
      type = 'python';
      request = 'launch';
      name = "Launch file";
      program = "${file}";
    },
  }
end

return M
