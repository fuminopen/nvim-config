# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

# 必要な設定

## delta

### インストール
https://github.com/dandavison/delta?tab=readme-ov-file

### ~/.gitconfig
```
[core]
	editor = vim
  pager = delta
[interactive]
    diffFilter = delta --color-only
[delta]
    navigate = true    # use n and N to move between diff sections
    features = side-by-side
    line-numbers = true
[delta "features"]
    side-by-side = true
[merge]
    conflictstyle = diff3
[diff]
    colorMoved = default
```

### ~/.config/lazygit/config.yml
```
git:
  paging:
    colorArg: always
    pager: delta --dark --paging=never
```
