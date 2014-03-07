;;; package -- Summary

;;; Commentary:

;;; Code:
(make-directory "~/.emacs.d/autosaves/" t)(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives
	       '("melpa" . "http://melpa.milkbox.net/packages/") t))

(make-directory "~/.emacs.d/autosaves/" t)
(make-directory "~/.emacs.d/backups/" t)

(add-to-list 'load-path
	     "~/.emacs.d/elpa/auto-complete-20130503.2013")

(load-theme 'zenburn t)

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(require 'auto-complete)
(global-auto-complete-mode t)

(column-number-mode t)

(require 'ido)
(ido-mode t)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-hook 'json-mode-hook (lambda () (interactive) (setq tab-width 2)))

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(require 'multiple-cursors)

(require 'rainbow-mode)

(require 'rvm)
(rvm-use-default)

(require 'yasnippet)
(yas-global-mode t)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets/"))

;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs.d/autosaves/\\1" t))))
 '(backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/")))))

;Custom commands
(defun reload-init ()
  "Reload init.el without restarting."
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(defun show-file-name ()
  "Show the full path file name in the minibuffer."
  (interactive)
  (message (buffer-file-name)))

(defun flush-blank-lines ()
  "Remove any blank lines from the entire buffer."
  (interactive)
  (flush-lines "^$"))

;custom keys
;;;;;;;;;;;;
;global
(global-set-key [(control f1)] 'show-file-name)
(global-set-key [(control f9)] 'reload-init)
(global-set-key [(control f12)] 'describe-key)
(global-set-key (kbd "M-{") 'previous-buffer)
(global-set-key (kbd "M-}") 'next-buffer)
(global-set-key (kbd "M-k") 'kill-this-buffer)
(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "M-<down>") 'windmove-down)
(global-set-key (kbd "M-<left>") 'windmove-left)
(global-set-key (kbd "C-c n") 'flycheck-next-error)
(global-set-key (kbd "C-c p") 'flycheck-previous-error)
(global-set-key (kbd "C-c ~") 'flycheck-buffer)
(global-set-key (kbd "C-c /") 'comment-region)
(global-set-key (kbd "C-c ?") 'uncomment-region)
(global-set-key (kbd "C-c w") 'whitespace-cleanup)
(global-set-key (kbd "C-c S") 'sort-lines)
(global-set-key (kbd "C-c R") 'reverse-region)
(global-set-key (kbd "C-c W") 'flush-blank-lines)
;multiple-cursors
(global-set-key (kbd "C-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(show-paren-mode 1)
(setq inhibit-startup-message t)
(setq ring-bell-function 'ignore)
(setq-default truncate-lines 1)
(global-linum-mode t)
(global-auto-revert-mode t)
(add-hook 'after-init-hook #'global-flycheck-mode)
(defvar flycheck-check-syntax-automatically)
(setq flycheck-check-syntax-automatically '(save))
'flycheck '(setq flycheck-checkers (delq 'html-tidy flycheck-checkers))

;extra mode configs
(setq-default indent-tabs-mode nil)
(add-to-list 'default-frame-alist '(height . 80))
(add-to-list 'default-frame-alist '(width . 110))
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(provide 'init)
;;; init.el ends here
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
