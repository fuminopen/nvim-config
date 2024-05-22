return {
  -- Tree-sitterプラグインの追加
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        -- インストールする言語を指定
        ensure_installed = { "php", "javascript", "lua", "python", "html", "css" },
        -- シンタックスハイライトを有効にする
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        -- インデントを有効にする
        indent = {
          enable = true,
        },
      })
    end,
  },
}
