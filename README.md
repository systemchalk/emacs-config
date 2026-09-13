# Emacs config

Personal configuration for Emacs starting with Fedora VM, macOS, then
Windows.
Requires Emacs 30+

## Layout
| Path | Purpose |
|------|---------|
| `early-init.el` | Garbage Collection threshold, remove toolbar, scroll |
| `init.el` | Main configuration |
| `lisp/` | Currently unused |
| `custom.el` | Machine specific untracked customization (currently overridden by `init.el` when in conflict) |

## Install
Make sure `~/.emacs.d` doesn't exist.

Doing this will completely delete the Emacs configuration. Rename it if you don't want this to happen!
```bash
rm -rf ~/.emacs.d
git clone git@github.com:systemchalk/emacs-config.git ~/.config/emacs
```

If you'd like most of the fonts in the list, preview, and spell check to work (Fedora package manager)
```bash
sudo dnf install enchant2-devel pkgconf hunspell-en-CA pandoc adwaita-fonts-all cascadia-fonts-all ibm-plex-fonts-all jetbrains-mono-fonts-all
```

**Windows**
Install Emacs and set HOME for config
```powershell
winget install GNU.Emacs

[Environment]::SetEnvironmentVariable("HOME", "$env:USERPROFILE", "User")
```
The terminal will need to be reopened after setting home. It can be verified with
```powershell
$env:HOME
```

Clone the repository
```powershell
git clone git@github.com:systemchalk/emacs-config.git $env:HOME\.config\emacs
```

**macOS** - To do

## Future work
* I would prefer the prose sections (mostly driven by markdown) to use TAB as a proper tab. Currently it has either structural meaning or is overloaded by the mode.
* Python and Rust environments are deferred
