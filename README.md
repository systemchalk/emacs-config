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
git clone ~/.config/emacs
```

**Windows** - Todo

**macOS** - Todo

