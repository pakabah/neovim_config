local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end

dap.adapters.delve = {
  type = 'server',
  port = '${port}',
  executable = {
    command = '/Users/paulakabah/go/bin/dlv',
    args = {'dap', '-l', '127.0.0.1:${port}'},
  }
}

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
  {
    type = "delve",
    name = "Debug",
    request = "launch",
    program = "${file}"
  },
  {
    type = "delve",
    name = "Debug test", -- configuration for debugging test files
    request = "launch",
    mode = "test",
    program = "${file}"
  },
  -- works with go.mod packages and sub packages 
  {
    type = "delve",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}"
  }
}

dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js'},
}

dap.adapters["pwa-node"] = {
  type = "server",
  host = "127.0.0.1",
  port = 8123,
  executable = {
    command = "js-debug-adapter",
  }
}

for _, language in ipairs { "typescript", "javasacript" } do
  dap.configurations[language] = {
    {
      tyoe = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
      runtimeExecutable = "node",
    },
  }
end

--[[ dap.configurations.javascript = { ]]
--[[   { ]]
--[[     name = 'Launch', ]]
--[[     type = 'node2', ]]
--[[     request = 'launch', ]]
--[[     program = '${file}', ]]
--[[     cwd = vim.fn.getcwd(), ]]
--[[     sourceMaps = true, ]]
--[[     protocol = 'inspector', ]]
--[[     console = 'integratedTerminal', ]]
--[[   }, ]]
--[[   { ]]
--[[     -- For this to work you need to make sure the node process is started with the `--inspect` flag. ]]
--[[     name = 'Attach to process', ]]
--[[     type = 'node2', ]]
--[[     request = 'attach', ]]
--[[     processId = require'dap.utils'.pick_process, ]]
--[[   }, ]]
--[[ } ]]
