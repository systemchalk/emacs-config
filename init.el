;;; init.el --- Personal configuration -*- lexical-binding: t; -*-

(defvar nm/init-loaded nil
  "Non-nil once init.el has run to completion.")

;;;; Custom file -- Quarantines changes set within Emacs to untracked file

(setopt custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror 'nomessage)

;;;; Platform
;; Predicates for machine-specific configuration.

(defconst nm/linux-p   (eq system-type 'gnu/linux))
(defconst nm/macos-p   (eq system-type 'darwin))
(defconst nm/windows-p (eq system-type 'windows-nt))

;;;; Backups and auto-saves -- Backups and auto-saves live in .config

;; Make the directories. The t in make-directory makes it safe for startup
(dolist (dir '("backups/" "auto-saves/"))
  (make-directory (expand-file-name dir user-emacs-directory) t))

;; Backups can become a file graveyard. Consider running the following:
;; find ~/.config/emacs/backups -type f -mtime +90 -delete
(setopt backup-directory-alist
        `(("." . ,(expand-file-name "backups/" user-emacs-directory)))
        auto-save-file-name-transforms
        `((".*" ,(expand-file-name "auto-saves/" user-emacs-directory) t))
        backup-by-copying t
        version-control t
        delete-old-versions t
        kept-new-versions 6
        kept-old-versions 2)

;;;; Interface -- Consider these optional

;; C-h t for tutorial and C-h r for the manual, in case you forget
(setopt inhibit-startup-screen t     ; skip the splash buffer
        initial-scratch-message nil  ; empty *scratch*, no boilerplate
        ring-bell-function #'ignore  ; silence the terminal bell
        use-short-answers t)         ; y/n instead of typing "yes"

(column-number-mode 1)               ; column position in the mode line

;;;; Persistence -- Keep history, reopen files

(savehist-mode 1)     ; minibuffer history persists over restarts
(save-place-mode 1)   ; reopen files at the position you left
(recentf-mode 1)      ; track recently visited files

(setopt global-auto-revert-non-file-buffers t)
(global-auto-revert-mode 1)

;;;; Editing defaults
;; Global baseline. Per-mode exceptions live in their own sections

(setq-default indent-tabs-mode nil) ; Most things should use spaces

(setopt require-final-newline t)

;;;; Writing defaults -- Whitespace has meaning

;; Sentences no longer have to end with two spaces (e.g. and Dr. are sentences)
(setopt sentence-end-double-space nil)

;; Text is distinct from prose. All text is wrapped, only prose gets tabs.
(defun nm/text-setup ()
  "Wrapping for all text-derived buffers."
  (visual-line-mode 1)
  (visual-wrap-prefix-mode 1))

;; There used to be a function nm/prose-setup here to make tabs mean tabs
;; Alas, tabs are overloaded in most markdown formats, so I must adapt my
;; methods to the whims of people who hate real writers. Revisit sometime.

(add-hook 'text-mode-hook #'nm/text-setup)

;;;; Packages

(require 'use-package)

;; Install anything declared with use-package that isn't present
(setopt use-package-always-ensure t)

;;;; Packages -- Markdown

(use-package markdown-mode
  :mode ("\\.md\\'" . markdown-mode)
  :custom
  (markdown-command "pandoc")                ; used by preview/export only
  (markdown-list-indent-width 4)
  (markdown-fontify-code-blocks-natively t)
  (markdown-asymmetric-header t))            ; ## heading, not ## Heading ##

;;;; Packages -- Writing environment

(use-package olivetti
  :custom (olivetti-body-width 80)
  :hook ((markdown-mode org-mode) . olivetti-mode))

;;;; Packages -- Minibuffer

(use-package vertico
  :init (vertico-mode 1))

(use-package marginalia
  :init (marginalia-mode 1))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

;;;; Packages -- Version control

(use-package magit
  :bind ("C-x g" . magit-status))

;;;; Packages -- Appearance

(use-package ef-themes)

;; ef-elea narrowly won out over ef-dream/ef-reverie
(use-package auto-dark
  :custom (auto-dark-themes '((ef-elea-dark) (ef-elea-light)))
  :init (auto-dark-mode 1))

;;;; Appearance -- Fonts
(defvar nm/font-height
  (cond (nm/macos-p   120)
        (nm/windows-p 120)
        (t            120))
  "Default face height in 1/10 pt. Screen densities differ per machine.")

(defun nm/first-available-font (fonts)
  "Return the first family in FONTS that exists on this system."
  (seq-find (lambda (f) (member f (font-family-list))) fonts))

;; Change order according to taste
(let ((mono (nm/first-available-font
             '("Menlo" "Monaco" "JetBrains Mono" "Adwaita Mono" "Cascadia Code"
               "IBM Plex Mono" "Source Code Pro" "DejaVu Sans Mono" "Consolas"
               "Monospace Neon" "Aporetic Sans Mono"
               "Iosevka" "monospace")))
      (sans (nm/first-available-font
             '("Helvetica Neue" "Source Sans 3" "Segoe UI" "Adwaita Sans"
               "Aporetic Sans" "IBM Plex Sans" "DejaVu Sans" "sans-serif"))))

  (when mono
    (set-face-attribute 'default nil :family mono :height nm/font-height)
    (set-face-attribute 'fixed-pitch nil :family mono))
  (when sans
    (set-face-attribute 'variable-pitch nil :family sans)))

;;;; Did it all work?

(setq nm/init-loaded t)
