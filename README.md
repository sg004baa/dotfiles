# dotfiles

## Install

```bash
bash install.sh
```

Symlinks all files/dirs into `$HOME`, recursing into directories that already exist as real dirs. Skips existing non-symlink files with a warning.

## Configs

| Path | Tool |
|---|---|
| `.config/nvim/` | Neovim |
| `.config/wezterm/` | WezTerm |
| `.config/zsh/` | Zsh |
| `.config/sheldon/` | sheldon |
| `.config/zeno/` | zeno.zsh |
| `.config/starship.toml` | Starship |
| `.config/lazygit/` | lazygit |
| `.config/lspmux/` | lspmux |
| `.config/systemd/` | systemd user services |

## Notes

**win32yank**
```bash
curl -LO https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
unzip win32yank-x64.zip -d ~/.local/bin
chmod +x ~/.local/bin/win32yank.exe
```

**WezTerm config path**
```powershell
[Environment]::SetEnvironmentVariable("WEZTERM_CONFIG_FILE", (wsl.exe sh -c 'wslpath -w $(readlink -f ~/.config/wezterm/wezterm.lua)').Trim(), "User")
```
