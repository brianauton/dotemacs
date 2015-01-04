(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/tomorrow-theme")
(require 'tomorrow-night-bright-theme)

(add-to-list 'load-path "~/.emacs.d/ws-trim")
(require 'ws-trim)
(global-ws-trim-mode t)
(set-default 'ws-trim-level 0)

(setq
 indent-tabs-mode nil
 kill-whole-line t
 make-backup-files nil
 tab-width 2
 vc-handled-backends nil
 )

(menu-bar-mode -1)

(add-hook 'find-file-hook (lambda ()
  (setq default-directory command-line-default-directory)))
