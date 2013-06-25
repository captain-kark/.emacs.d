(make-directory "~/.emacs.d/autosaves/" t)(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives 
	       '("melpa" . "http://melpa.milkbox.net/packages/") t))

(make-directory "~/.emacs.d/autosaves/" t)
(make-directory "~/.emacs.d/backups/" t)

(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20130503.2013/")
(add-to-list 'load-path	"~/.emacs.d/elpa/ecb-20130406.1406/")
(add-to-list 'load-path	"~/.emacs.d/elpa/markdown-mode-20130328.918/")

(require 'auto-complete)
(global-auto-complete-mode t)

(require 'color-theme)

(column-number-mode t)

(require 'ecb)
(setq ecb-tip-of-the-day nil)
(ecb-minor-mode t)

(require 'ido)
(ido-mode t)

(autoload 'markdown-mode "markdown-mode"
       "Major mode for editing Markdown files" t)
    (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
    (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
    (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(require 'rvm)
(rvm-use-default)

(require 'shell-pop)
(shell-pop-set-internal-mode "shell")
(shell-pop-set-internal-mode-shell "/bin/bash")
(shell-pop-set-window-height 30)
(shell-pop-set-window-position "bottom")
(shell-pop-set-universal-key (kbd "C-c C-t"))

(require 'yasnippet)
(yas-global-mode t)

;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs.d/autosaves/\\1" t))))
 '(backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/"))))
 '(column-number-mode t)
 '(ecb-options-version "2.40")
 '(safe-local-variable-values (quote ((lexical-binding . t)))))

;Custom commands
(defun reload-init ()
"reload init.el without restarting"
    (interactive)
      (load-file "~/.emacs.d/init.el"))

;custom keys
;;;;;;;;;;;;
;global
(global-set-key [(control f9)] 'reload-init)
(global-set-key [(control f12)] 'describe-key)
(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "M-<down>") 'windmove-down)
(global-set-key (kbd "M-<left>") 'windmove-left)
(global-set-key (kbd "C-c n") 'flycheck-next-error)
(global-set-key (kbd "C-c p") 'flycheck-previous-error)
(global-set-key (kbd "C-c ~") 'flycheck-buffer)
(global-set-key (kbd "C-c /") 'comment-region)
(global-set-key (kbd "C-c ?") 'uncomment-region)

(setq inhibit-startup-message t)
(setq ring-bell-function 'ignore)
(global-linum-mode t)
(global-auto-revert-mode t)
(setq shell-command-switch "-ic")
(add-hook 'after-init-hook #'global-flycheck-mode)

;extra mode configs
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-dark-laptop)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(width . 120))
