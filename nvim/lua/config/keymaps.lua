-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Delete a word backwords
keymap.set("n", "dw", 'vb"_d')

-- Set up clipboard integration
vim.opt.clipboard:append("unnamedplus")
-- Copy mappings
vim.api.nvim_set_keymap("n", "<C-c>", '"+y', opts) -- Normal mode
vim.api.nvim_set_keymap("v", "<C-c>", '"+y', opts) -- Visual mode
vim.api.nvim_set_keymap("x", "<C-c>", '"+y', opts) -- Visual block mode

---- Nav
-- Normal mode
vim.keymap.set("n", "<D-S-Right>", "$", { desc = "End of line" })
vim.keymap.set("n", "<D-S-Left>", "0", { desc = "Start of line" })
-- Visual mode
vim.keymap.set("v", "<D-S-Right>", "$", { desc = "End of line" })
vim.keymap.set("v", "<D-S-Left>", "0", { desc = "Start of line" })
-- Insert mode
vim.keymap.set("i", "<D-S-Right>", "<Esc>$a", { desc = "End of line" })
vim.keymap.set("i", "<D-S-Left>", "<Esc>0i", { desc = "Start of line" })

---- Surround
vim.keymap.set("v", "{", "<esc>`>a}<esc>`<i{<esc>", { noremap = true }) -- Surround with {} in visual mode
vim.keymap.set("v", "[", "<esc>`>a]<esc>`<i[<esc>", { noremap = true }) -- Surround with [] in visual mode
vim.keymap.set("v", "(", "<esc>`>a)<esc>`<i(<esc>", { noremap = true }) -- Surround with () in visual mode
vim.keymap.set("v", "'", "<esc>`>a'<esc>`<i'<esc>", { noremap = true }) -- Surround with '' in visual mode
vim.keymap.set("v", '"', '<esc>`>a"<esc>`<i"<esc>', { noremap = true }) -- Surround with "" in visual mode

-- Find & Replace Enhancements
vim.keymap.set("n", "<D-f>", "/", { noremap = true, silent = true }) -- Cmd + F to start search
vim.keymap.set("n", "<D-r>", ":%s//g<Left><Left>", opts) -- Cmd + Shift + F for find & replace
-- Quick delete lines containing a word
vim.keymap.set("n", "<D-l>", [[:g/<C-r><C-w>/d<CR>]], opts) -- Cmd + L deletes lines with the word under cursor
-- Search navigation improvements
vim.keymap.set("n", "n", "nzzzv", opts) -- Keep search results centered
