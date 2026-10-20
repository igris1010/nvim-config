require 'core.options'
require 'core.keymaps'
require 'plugins.colorscheme'
require 'plugins.neotree'
vim.opt.termguicolors = true
require("plugins.bufferline")
require('plugins.lualine')
require('plugins.telescope')
require('plugins.lsp')
--[[
>>>>>>> 61a7de2 (fixed function info thing by modifying init.lua)
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
]]
require('plugins.mason')
-- handles displaying info about functions and stuff
vim.opt.updatetime = 300

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if not client then return end

    -- 1. Built-in Completion
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
    end

    -- 2. Function Details / Hover Documentation
    if client:supports_method("textDocument/hover") then
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {
        buffer = event.buf,
        desc = "LSP: Show Hover Details",
      })

      -- Automatically trigger hover quickly without stealing focus
      vim.api.nvim_create_autocmd("CursorHold", {
        buffer = event.buf,
        callback = function()
          if vim.api.nvim_get_mode().mode == "n" then
            vim.lsp.buf.hover({ focusable = false })
          end
        end,
      })
    end

    -- 3. Parameter / Signature Help while typing
    if client:supports_method("textDocument/signatureHelp") then
      vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, {
        buffer = event.buf,
        desc = "LSP: Signature Help",
      })
    end

    -- 4. Document Highlight
    if client:supports_method("textDocument/documentHighlight") then
      local highlight_group = vim.api.nvim_create_augroup("LspHighlight_" .. event.buf, { clear = true })

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
