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
(add-to-list 'auto-mode-alist '("\\.jsx$" . javascript-mode))

(setq
 indent-tabs-mode nil
 kill-whole-line t
 make-backup-files nil
 tab-width 2
 vc-handled-backends nil
 read-file-name-completion-ignore-case nil
 sentence-end-double-space nil
 )

(menu-bar-mode -1)

(defadvice find-file (before make-directory-maybe (filename &optional wildcards) activate)
  "Create parent directory if not exists while visiting file."
  (unless (file-exists-p filename)
    (let ((dir (file-name-directory filename)))
      (unless (file-exists-p dir)
	(make-directory dir t)))))

(require 'direx)
(global-set-key (kbd "C-x C-g") 'direx-project:jump-to-project-root)
(custom-set-variables
 '(direx:closed-icon " ▸")
 '(direx:leaf-icon "  ")
 '(direx:open-icon " ▾"))

(setq gofmt-command "goimports")
(add-hook 'before-save-hook #'gofmt-before-save)

(setq js-indent-level 2)

(setq org-startup-indented t)
(setq org-agenda-files '("~/Dropbox/work"))
(setq org-agenda-skip-function-global '(org-agenda-skip-entry-if 'todo 'done))
(setq org-agenda-window-setup 'current-window)
(global-set-key (kbd "C-c a #") 'org-agenda-list-stuck-projects)
(global-set-key (kbd "C-c a a") 'org-agenda-list)
(global-set-key (kbd "C-c a t") 'org-todo-list)
(setq org-todo-keywords '((sequence "WAIT" "TODO" "DONE")))
(setq auto-revert-interval 2)
(setq auto-revert-verbose nil)
(global-auto-revert-mode)

(add-to-list 'load-path "~/.emacs.d/org-bullets")
(require 'org-bullets)
(setq org-bullets-face-name (quote org-bullet-face))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-bullets-bullet-list '("￮"))
(custom-set-faces
 '(org-level-1 ((t (:foreground "#7aa6da" :weight bold))))
 '(org-level-2 ((t (:foreground "#70c0b1" :weight bold))))
 '(org-level-3 ((t (:foreground "#b9ca4a" :weight bold))))
 '(org-level-4 ((t (:foreground "#e7c547" :weight bold))))
 '(org-level-5 ((t (:foreground "#e78c45" :weight bold))))
 '(org-level-6 ((t (:foreground "#d54e53" :weight bold))))
 '(org-level-7 ((t (:foreground "#c397d8" :weight bold))))
 '(org-level-8 ((t (:foreground "#4d5057" :weight bold))))
 '(org-link ((t (:foreground "#c397d8"))))
 '(org-todo ((t (:foreground "#d54e53" :weight bold))))
 )

(define-key input-decode-map "\e[1;10A" [S-M-up])
(define-key input-decode-map "\e[1;10B" [S-M-down])
(define-key input-decode-map "\e[1;10C" [S-M-right])
(define-key input-decode-map "\e[1;10D" [S-M-left])
