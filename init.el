;;; init.el --- Personal configuration -*- lexical-binding: t; -*-

(defvar nm/init-loaded nil
  "Non-nil once init.el has run to completion.")

;;;; Custom file -- Quarantines changes set within Emacs to untracked file

(setopt custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror 'nomessage)

(setq nm/init-loaded t)
