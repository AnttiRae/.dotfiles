require("nvchad.mappings")
local builtin = require("telescope.builtin")
-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

map("n", "<leader>a", function()
	harpoon:list():add()
end)
map("n", "<C-e>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

-- map("n", "<C-h>", function() harpoon:list():select(1) end)
-- map("n", "<C-t>", function() harpoon:list():select(2) end)
-- map("n", "<C-n>", function() harpoon:list():select(3) end)
-- map("n", "<C-s>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
map("n", "<C-l>", function()
	harpoon:list():next()
end)
map("n", "<C-k>", function()
	harpoon:list():prev()
end)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- telescope

map("n", "<leader>gu", function()
	builtin.lsp_references()
end)

map("n", "<leader>fs", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

map("n", "<leader>fu", vim.cmd.UndotreeToggle)
