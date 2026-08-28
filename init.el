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

;;;; Did it all work?

(setq nm/init-loaded t)

