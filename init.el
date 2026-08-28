;;; init.el --- Personal configuration -*- lexical-binding: t; -*-

(defvar nm/init-loaded nil
  "Non-nil once init.el has run to completion.")

;;;; Custom file -- Quarantines changes set within Emacs to untracked file

(setopt custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror 'nomessage)

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

(defun nm/writing-setup ()
  "Buffer-local settings for prose buffers."
  (setq indent-tabs-mode t)    ; Tabs mean tabs in prose
  (visual-line-mode 1)
  (visual-wrap-prefix-mode 1))

;; Markdown will inherit this, so keep the tabs in mind when it matters
(add-hook 'text-mode-hook #'nm/writing-setup)

;;;; Packages

(require 'use-package)

;; Install anything declared with use-package that isn't present
(setopt use-package-always-ensure t)

;;;; Did it all work?

(setq nm/init-loaded t)
