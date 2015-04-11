(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/tomorrow-theme")
(require 'tomorrow-night-bright-theme)

(add-to-list 'load-path "~/.emacs.d/ws-trim")
(require 'ws-trim)
(global-ws-trim-mode t)
(set-default 'ws-trim-level 0)
(set-default 'ws-trim-method-hook '(ws-trim-tabs ws-trim-trailing))

(require 'desktop)
(desktop-save-mode 1)
(defun my-desktop-save ()
  (interactive)
  (if (eq (desktop-owner) (emacs-pid))
      (desktop-save desktop-dirname)))
(add-hook 'auto-save-hook 'my-desktop-save)
(setq desktop-path '("."))

(add-hook 'after-init-hook #'global-flycheck-mode)
(eval-after-load 'flycheck '(progn
  (set-face-attribute 'flycheck-warning nil :underline nil :foreground "orange")
  (set-face-attribute 'flycheck-error nil :underline nil :foreground "red")))

(setq
 indent-tabs-mode nil
 kill-whole-line t
 make-backup-files nil
 tab-width 2
 vc-handled-backends nil
 read-file-name-completion-ignore-case nil
 )

(menu-bar-mode -1)

(defadvice find-file (before make-directory-maybe (filename &optional wildcards) activate)
  "Create parent directory if not exists while visiting file."
  (unless (file-exists-p filename)
    (let ((dir (file-name-directory filename)))
      (unless (file-exists-p dir)
	(make-directory dir t)))))
