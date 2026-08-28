;;; early-init.el --- Runs before package.el and the first frame -*- lexical-binding: t; -*-

;; Set garbage collection to a large value for startup then revert
(setq gc-cons-threshold (* 100 1000 1000))

(defun nm/restore-gc-threshold ()
  "Return 'gc-cons-threshold' to a sane working value after startup."
  (setq gc-cons-threshold (* 8 1000 1000)))
(add-hook 'emacs-startup-hook #'nm/restore-gc-threshold)

;; Remove toolbar (icons) and scroll bars
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars . nil) default-frame-alist)
