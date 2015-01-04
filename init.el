(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/tomorrow-theme")
(require 'tomorrow-night-bright-theme)

(setq
 indent-tabs-mode nil
 kill-whole-line t
 make-backup-files nil
 tab-width 2
 vc-handled-backends nil
 )

(menu-bar-mode -1)
