(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(require 'color-theme)

(setq
 indent-tabs-mode nil
 kill-whole-line t
 make-backup-files nil
 tab-width 2
 )

(menu-bar-mode -1)
