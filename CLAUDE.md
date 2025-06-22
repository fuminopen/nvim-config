# Neovim設定ガイド

## コマンド
- フォーマット: `:lua vim.lsp.buf.format()` - 現在のバッファをフォーマットする
- LSPステータス確認: `:LspInfo` - 言語サーバーの状態を確認する
- LSPログ確認: `:LspLog` - LSPのログを表示する
- プラグイン管理: `:Lazy` - Lazy.nvimのインターフェースを開く
- プラグイン更新: `:Lazy update` - プラグインを更新する
- プラグインクリーン: `:Lazy clean` - 不要なプラグインを削除する
- プラグインステータス: `:Lazy check` - プラグインの状態を確認する
- 設定再読込: `:source $MYVIMRC` - init.luaを再読み込みする
- ターミナル起動: `<C-n>` - フロートターミナルを開く
- lazygit起動: `<leader>g` - lazygitをToggleTermで開く

## スタイルガイドライン
- インデント: 2スペース (stylua.tomlに基づく)
- 行の長さ: 最大120カラム
- 命名規則: 変数と関数はsnake_case
- モジュール構造: lua/config/とlua/plugins/に整理
- 関数定義: ローカル関数として定義 `local function name()`
- エラー処理: 重要なエラーは`vim.api.nvim_echo`を使用
- コメント: 日本語のコメントを使用可能
- キーマッピング: 独自のヘルパー関数`map(mode, lhs, rhs, opts)`を使用

## プラグイン管理
- プラグイン追加: lua/plugins/ディレクトリに新規ファイルを作成
- プラグイン設定形式: `return { { "plugin/name", config = {...} } }`
- LazyVimを基本設定として使用
- バージョン指定: `version = "*"` または `version = false`（最新のgitコミットを使用）
- プラグイン遅延読み込み: `lazy = false`（デフォルトでは遅延読み込みしない）
- カラースキーム: "tokyonight"と"habamax"を優先的にインストール

## キーマッピング
- 定義方法: `map(mode, lhs, rhs, opts)`ヘルパーを使用
- オプション: `{ noremap = true, silent = true }`
- リーダーキー: カスタムコマンド用に使用
- 特殊キーマップ:
  - ビジュアルモードでインデント後に選択を維持: `<`, `>`
  - ビジュアルモードでペースト時にレジスタ保存しない: `p`
  - カーソル下の単語を定義にジャンプ: `<leader>*`
  - インサートモードで`\`を`_`に変換: `\`

## ファイル構造
- init.lua: エントリーポイント、lazy.nvimを読み込む
- lua/config/lazy.lua: プラグイン管理の設定
- lua/config/options.lua: Neovimの基本設定
- lua/config/keymaps.lua: キーマッピングの定義
- lua/config/autocmds.lua: 自動コマンドの定義
- lua/plugins/: プラグイン設定ファイル

## ToggleTermの設定
- デフォルトでフローティングターミナル: `direction = "float"`
- Ctrl+nでトグル: `open_mapping = [[<c-n>]]`
- lazygit用の特別な設定あり: `<leader>g`でトグル