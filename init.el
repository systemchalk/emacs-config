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

;;;; Did it all work?

(setq nm/init-loaded t)
