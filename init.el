(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/tomorrow-theme")
(require 'tomorrow-night-bright-theme)

(add-to-list 'load-path "~/.emacs.d/ws-trim")
(require 'ws-trim)
(global-ws-trim-mode t)
(set-default 'ws-trim-level 0)

(require 'desktop)
(desktop-save-mode 1)
(defun my-desktop-save ()
  (interactive)
  (if (eq (desktop-owner) (emacs-pid))
      (desktop-save desktop-dirname)))
(add-hook 'auto-save-hook 'my-desktop-save)
(setq desktop-path '("."))

(add-hook 'after-init-hook #'global-flycheck-mode)

(setq
 indent-tabs-mode nil
 kill-whole-line t
 make-backup-files nil
 tab-width 2
 vc-handled-backends nil
 )

(menu-bar-mode -1)
