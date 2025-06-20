local status, dap = pcall(require, "dap")
if (not status) then return end

-- Cấu hình icons
vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='▶️', texthl='', linehl='', numhl=''})

-- Cấu hình cho các ngôn ngữ khác nhau
-- Python
dap.adapters.python = {
  type = 'executable';
  command = 'python';
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
  {
    type = 'python';
    request = 'launch';
    name = "Launch file";
    program = "${file}";
    pythonPath = function()
      return '/usr/bin/python3'
    end;
  },
}

-- Go
dap.adapters.delve = {
  type = 'server',
  port = '${port}',
  executable = {
    command = vim.fn.exepath('dlv'),
    args = {'dap', '-l', '127.0.0.1:${port}'},
  }
}

-- Fallback nếu không tìm thấy dlv trong PATH
if vim.fn.executable('dlv') == 0 then
  -- Tìm kiếm dlv trong các vị trí phổ biến
  local possible_paths = {
    vim.fn.expand('~/.local/share/nvim/mason/bin/dlv'),
    vim.fn.expand('~/.local/share/nvim/mason/packages/delve/dlv'),
    vim.fn.expand('~/go/bin/dlv'),
    '/usr/local/bin/dlv',
    '/usr/bin/dlv'
  }
  
  for _, path in ipairs(possible_paths) do
    if vim.fn.executable(path) == 1 then
      dap.adapters.delve.executable.command = path
      break
    end
  end
end

dap.configurations.go = {
  {
    type = 'delve',
    name = 'Debug',
    request = 'launch',
    program = "${file}"
  },
  {
    type = 'delve',
    name = 'Debug Package',
    request = 'launch',
    program = "${fileDirname}"
  },
  {
    type = 'delve',
    name = 'Debug test',
    request = 'launch',
    mode = 'test',
    program = "${file}"
  },
  {
    type = 'delve',
    name = 'Debug test (go.mod)',
    request = 'launch',
    mode = 'test',
    program = "./${relativeFileDirname}"
  }
}

-- JavaScript/TypeScript
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/.local/share/nvim/mason/packages/node-debug2-adapter/out/src/nodeDebug.js'},
}

dap.configurations.javascript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require'dap.utils'.pick_process,
  },
}

dap.configurations.typescript = dap.configurations.javascript

-- Thêm cấu hình DAP cho Java
dap.adapters.java = function(callback)
  -- Sử dụng JDTLS để debug
  callback({
    type = 'server',
    host = '127.0.0.1',
    port = 5005,
  })
end

-- Cấu hình debug cho Java
dap.configurations.java = {
  {
    type = 'java',
    request = 'attach',
    name = "Debug (Attach) - Remote",
    hostName = "127.0.0.1",
    port = 5005,
  },
}
