--
-- Custom Keymaps
--

local opts = { noremap = true, silent = true }

-- Stay in indent mode
map("v", "<", "<gv^", opts)
map("v", ">", ">gv^", opts)

-- ヴィジュアルモードでペーストした際レジスタに対象の文字を保存しない
map("v", "p", '"_dP', opts)

-- Delete current buffer without closing window --
map("n", "<C-w>", ":bd<CR>", opts)

-- Delete all buffer without closing window --
map("n", "<leader>w", ":bufdo bd<CR>", opts)

-- Toggle terminal
map("n", "<leader>j", ":ToggleTerm<CR>", opts)

-- lazygit
map("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", opts)

-- 定義にジャンプするためのキーマッピング
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

-- カーソル下の単語を定義にジャンプするためのキーマッピング
map("n", "<leader>*", "*''cgn", opts)

-- Altとhjklで矢印キーの代わりにする -- 
map("n", "<A-h>", "<Left>", opts)
map("n", "<A-j>", "<Down>", opts)
map("n", "<A-k>", "<Up>", opts)
map("n", "<A-l>", "<Right>", opts)

-- \は_に変更
map("i", "\\", "_", opts)
