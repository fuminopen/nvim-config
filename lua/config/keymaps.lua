-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opts = { noremap = true, silent = true }

-----------------------------------------------------------
-- Custom Keymaps
-----------------------------------------------------------

-- Stay in indent mode
map("v", "<", "<gv^", opts)
map("v", ">", ">gv^", opts)

-- ヴィジュアルモードでペーストした際レジスタに対象の文字を保存しない
map("v", "p", '"_dP', opts)

-- カーソル下の単語を定義にジャンプするためのキーマッピング
map("n", "<leader>*", "*''cgn", opts)

-- \は_に変更
map("i", "\\", "_", opts)

-- Markdownのプレビュー
map("n", "<leader>p", ":PeekToggle<CR>", opts)

-----------------------------------------------------------
-- lazygitをToggleTerm経由で開くように設定
-----------------------------------------------------------

local GitTerminal = require("toggleterm.terminal").Terminal
local lazygit = GitTerminal:new({
  cmd = "lazygit",
  direction = "float",
  hidden = true,
})

function LazygitToggle()
  lazygit:toggle()
end

-- lazygit
map("n", "<leader>g", "<cmd>lua LazygitToggle()<CR>", opts)
