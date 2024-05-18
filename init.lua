-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("plugins.nvim-cmp")
require("plugins.nvim-lspconfig")
require("plugins.github-copilot")
require("plugins.lazygit")
require("neo-tree").setup({
  filesystem = {
    filtered_items = {
      visible = true, -- これを false から true に設定
      hide_dotfiles = false, -- 隠しファイルを表示するためにはこのオプションを false に設定
      hide_gitignored = false, -- Gitで無視されているファイルも表示する場合はこのオプションを false に設定
    },
  },
})

-- set clipboard to unnamedplus --
vim.opt.clipboard = "unnamedplus"

if vim.fn.has("wsl") == 1 then
  if vim.fn.executable("wl-copy") == 0 then
    print("wl-clipboard not found, clipboard integration won't work")
  else
    vim.g.clipboard = {
      name = "wl-clipboard (wsl)",
      copy = {
        ["+"] = "wl-copy --foreground --type text/plain",
        ["*"] = "wl-copy --foreground --primary --type text/plain",
      },
      paste = {
        ["+"] = function()
          return vim.fn.systemlist('wl-paste --no-newline|sed -e "s/\r$//"', { "" }, 1) -- '1' keeps empty lines
        end,
        ["*"] = function()
          return vim.fn.systemlist('wl-paste --primary --no-newline|sed -e "s/\r$//"', { "" }, 1)
        end,
      },
      cache_enabled = true,
    }
  end
end
