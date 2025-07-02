return {
  {
    "milanglacier/minuet-ai.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "saghen/blink.cmp",
    },
    event = "VeryLazy",
    config = function()
      require("minuet").setup({
        provider = "claude",
        provider_options = {
          claude = {
            model = "claude-3-5-haiku-20241022",
          },
        },
        -- blink.cmpの自動補完設定
        blink = {
          enable_auto_complete = true, -- 自動補完を有効化
        },
        debounce = 200,
        throttle = 500,
      })
    end,
  },
  { "nvim-lua/plenary.nvim" },
  {
    "saghen/blink.cmp",
    config = function()
      require("blink-cmp").setup({
        keymap = {
          -- Manually invoke minuet completion.
          ["<A-y>"] = require("minuet").make_blink_map(),
          -- Enterキーで補完を確定
          ["<CR>"] = { "accept", "fallback" },
          -- Tabキーで次の候補を選択
          ["<Tab>"] = { "select_next", "fallback" },
          -- Shift+Tabキーで前の候補を選択
          ["<S-Tab>"] = { "select_prev", "fallback" },
          -- Ctrl+Spaceで補完を手動で開く
          ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
          -- Escで補完を閉じる
          ["<C-e>"] = { "hide" },
        },
        sources = {
          -- Enable minuet for autocomplete
          default = { "lsp", "path", "buffer", "snippets", "minuet" },
          -- For manual completion only, remove 'minuet' from default
          providers = {
            minuet = {
              name = "minuet",
              module = "minuet.blink",
              async = true,
              -- Should match minuet.config.request_timeout * 1000,
              -- since minuet.config.request_timeout is in seconds
              timeout_ms = 3000,
              score_offset = 50, -- Gives minuet higher priority among suggestions
            },
          },
        },
        -- Recommended to avoid unnecessary request
        completion = { trigger = { prefetch_on_insert = false } },
      })
    end,
  },
}
