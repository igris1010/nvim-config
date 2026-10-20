vim.pack.add({
    'https://github.com/jake-stewart/multicursor.nvim.git'
})

local set = vim.keymap.set
local mc = require("multicursor-nvim")

mc.setup()

-- Add cursors on adjacent lines
set({"n", "x"}, "<leader><up>", function() mc.lineAddCursor(-1) end)
set({"n", "x"}, "<leader><down>", function() mc.lineAddCursor(1) end)
--set({"n", "x"}, "<leader><up>", function() mc.lineSkipCursor(-1) end)
--set({"n", "x"}, "<leader><down>", function() mc.lineSkipCursor(1) end)

-- Add or skip cursors by matching word/selection
set({"n", "x"}, "<leader>n", function() mc.matchAddCursor(1) end)
set({"n", "x"}, "<leader>s", function() mc.matchSkipCursor(1) end)
set({"n", "x"}, "<leader>N", function() mc.matchAddCursor(-1) end)
set({"n", "x"}, "<leader>S", function() mc.matchSkipCursor(-1) end)

-- Mouse support
set("n", "<C-leftmouse>", mc.handleMouse)
set("n", "<C-leftdrag>", mc.handleMouseDrag)
set("n", "<C-leftrelease>", mc.handleMouseRelease)

-- Toggle cursors
set({"n", "x"}, "<C-q>", mc.toggleCursor)

-- Keymaps active only when multiple cursors exist
mc.addKeymapLayer(function(layerSet)
    -- Select the main cursor
    layerSet({"n", "x"}, "<left>", mc.prevCursor)
    layerSet({"n", "x"}, "<right>", mc.nextCursor)

    -- Delete the main cursor
    layerSet({"n", "x"}, "<leader>x", mc.deleteCursor)

    -- Enable or clear cursors with Escape
    layerSet("n", "<esc>", function()
        if not mc.cursorsEnabled() then
            mc.enableCursors()
        else
            mc.clearCursors()
        end
    end)
end)

-- Customize cursor highlights
local hl = vim.api.nvim_set_hl

hl(0, "MultiCursorCursor", { reverse = true })
hl(0, "MultiCursorVisual", { link = "Visual" })
hl(0, "MultiCursorSign", { link = "SignColumn" })
hl(0, "MultiCursorMatchPreview", { link = "Search" })
hl(0, "MultiCursorDisabledCursor", { reverse = true })
hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
