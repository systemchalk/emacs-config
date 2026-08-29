# Emacs config

Personal configuration for Emacs starting with Fedora VM, macOS, then
Windows.
Requires Emacs 30.2+

## Layout
| Path | Purpose |
|------|---------|
| `early-init.el` | Garbage Collection threshold, remove toolbar, scroll |
| `init.el` | Everything else |
| `lisp/` | Currently unused |
| `custom.el` | Machine specific untracked customization |

## Install
Make sure `~/.emacs.d` doesn't exist.

```bash
rm -rf ~/.emacs.d
git clone git@github.com:systemchalk/emacs-config.git ~/.config/emacs
```

**Windows** - Todo

**macOS** - Todo

## Future work
* I would prefer the prose sections (mostly driven by markdown) to use TAB as a proper tab. Currently it has either structural meaning or is overloaded by the mode.
* Python and Rust environments are deferred
* Spell check and grammar check
* Themes
* Fonts
