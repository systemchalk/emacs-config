# Emacs config

Personal configuration for Emacs starting with Fedora VM, macOS, then
Windows.
Requires Emacs 30.2+

## Layout
| Path | Purpose |
|------|---------|
| `early-init.el` | Garbage Collection threshold, remove toolbar, scroll |
| `init.el` | Main configuration |
| `lisp/` | Currently unused |
| `custom.el` | Machine specific untracked customization (currently overridden by `init.el` when in conflict) |

## Install
Make sure `~/.emacs.d` doesn't exist.

Doing this will completely delete the emacs configuration. Rename it if you don't want this to happen!
```bash
rm -rf ~/.emacs.d
git clone git@github.com:systemchalk/emacs-config.git ~/.config/emacs
```

If you'd like most of the fonts in the list (Fedora package manager)
```bash
sudo dnf install adwaita-fonts-all cascadia-fonts-all ibm-plex-fonts-all jetbrains-mono-fonts-all
```

**Windows** - Todo

**macOS** - Todo

## Future work
* I would prefer the prose sections (mostly driven by markdown) to use TAB as a proper tab. Currently it has either structural meaning or is overloaded by the mode.
* Python and Rust environments are deferred
* Spell check and grammar check
