vim.pack.add{
  { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/hrsh7th/cmp-nvim-lsp' },
}
--[[
vim.lsp.config['ccls'] = {
  -- Command to start the language server.
  cmd = { 'ccls' },

  -- C and C++ filetypes.
  filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
  root_dir = vim.fn.getcwd(),

  -- Detect the project root.
  root_markers = { '.ccls', 'compile_commands.json', 'compile_flags.txt', '.git' },

  -- Server-specific settings.
  init_options = {
    cache = {
      directory = '.ccls-cache',
    },
  },
}
]]
local capabilities = require('cmp_nvim_lsp').default_capabilities()
vim.lsp.config['clangd'] = {
  cmd = { 'clangd', '--background-index' },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
  root_markers = { 'compile_commands.json', 'compile_flags.txt', '.git' },
  capabilities = capabilities
}

vim.lsp.config['lua_ls'] = {
        cmd = {'lua-language-server'},
        filetypes = {'lua'},

          -- Detect the project root.
          root_markers = { {'.luarc.json'}, '.git' },
  capabilities = capabilities
  }
vim.lsp.config.pylsp = {
  cmd = { 'pylsp' },
  filetypes = { 'python' },
  root_markers = { '.git', 'pyproject.toml', 'setup.py' },
  capabilities = capabilities
}
vim.lsp.config.ts_ls = {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  root_markers = { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' },
  capabilities = capabilities
}

-- Enable the language server.
-- vim.lsp.enable('ccls')
vim.lsp.enable('clangd')
vim.lsp.enable('lua_ls')
vim.lsp.enable('pylsp')
vim.lsp.enable('ts_ls')
