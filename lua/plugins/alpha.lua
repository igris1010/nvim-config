vim.pack.add{
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
  { src = 'https://github.com/goolord/alpha-nvim.git' },
}

local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

dashboard.section.buttons.val = {
  dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("f", "󰈞  Find file", ":find "),
  dashboard.button("q", "  Quit", ":qa<CR>"),
}

alpha.setup(dashboard.opts)
