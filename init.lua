require 'core.options'
require 'core.keymaps'
require 'plugins.colorscheme'
require 'plugins.neotree'
vim.opt.termguicolors = true
require("plugins.bufferline")
require('plugins.lualine')
require('plugins.telescope')
require('plugins.lsp')
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client and client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, args.buf, {
                autotrigger = true,
            })
        end
    end,
})
require('plugins.mason')

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = true }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    
    -- Verify the server supports document highlight
    if client and client.supports_method("textDocument/documentHighlight") then
      local highlight_group = vim.api.nvim_create_augroup("LspHighlightSubGroup", { clear = false })
      
      -- Highlight occurrences when cursor holds
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = event.buf,
        group = highlight_group,
        callback = vim.lsp.buf.document_highlight,
      })

      -- Clear highlights when the cursor moves
      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = event.buf,
        group = highlight_group,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
})
require('plugins.alpha')
require('plugins.multicursor')
require('plugins.luasnip')
require('plugins.nvimcmp')
