-- colemak dh
vim.keymap.set({ "n", "v" }, "n", "j")
vim.keymap.set({ "n", "v" }, "e", "k")
vim.keymap.set({ "n", "v" }, "i", "l")
vim.keymap.set({ "n", "v" }, "h", "h")

vim.keymap.set("n", "m", "i")
vim.keymap.set("n", "M", "I")
vim.keymap.set("n", "l", "o")
vim.keymap.set("n", "L", "O")
vim.keymap.set({ "n", "v" }, "f", "e", { desc = "jump to end of Word" })
vim.keymap.set({ "n", "v" }, "F", "E", { desc = "jump to end of String" })

vim.keymap.set("n", "N", "mzJ`z", { desc = "Append following with cursor in front" })
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-i>", "<C-;>", { desc = "Jump List up" })
vim.keymap.set("n", "N", "nzzzv", { desc = "next Search Element Centered" })
vim.keymap.set("n", "E", "Nzzzv", { desc = "previous Search Element Centered" })

vim.keymap.set("n", "U", "<C-r>", {})

vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git Commands" })

vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Replace without replacing item" })
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Copy to clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Copy to clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Copy to clipboard" })

vim.keymap.set("v", "N", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "E", ":m '<-2<CR>gv=gv")

vim.keymap.set({ "n", "v" }, "gi", "g_", { desc = "Move to end of line" })
vim.keymap.set({ "n", "v" }, "gh", "^", { remap = true, desc = "Move to first char in line" })

vim.keymap.set({ "n", "v" }, "<leader>wn", "<cmd>hor split <cr>")
vim.keymap.set({ "n", "v" }, "<leader>we", "<cmd>hor split <cr><C-e>")
vim.keymap.set({ "n", "v" }, "<leader>wh", "<cmd>vert split <cr>")
vim.keymap.set({ "n", "v" }, "<leader>wi", "<cmd>vert split <cr><C-i>")

vim.g.tmux_navigator_no_mappings = 1
vim.g.kitty_navigator_no_mappings = 1
