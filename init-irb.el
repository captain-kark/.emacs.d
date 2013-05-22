; Settings for running a temporary editor in irb, a la the `interactive_editor` gem.
(make-directory "~/.emacs.d/autosaves/" t)(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives 
	       '("melpa" . "http://melpa.milkbox.net/packages/") t))

(make-directory "~/.emacs.d/autosaves/" t)
(make-directory "~/.emacs.d/backups/" t)

(add-to-list 'load-path 
	     "~/.emacs.d/elpa/auto-complete-20130503.2013/"
	     "~/.emacs.d/elpa/color-theme-20080305.834/color-theme.el")

(require 'auto-complete)
(global-auto-complete-mode t)

(require 'color-theme)

(column-number-mode t)

(global-linenum-mode t)

(require 'ido)
(ido-mode t)

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
 '(safe-local-variable-values (quote ((lexical-binding . t)))))

;custom keys
;;;;;;;;;;;;
;global
(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "M-<down>") 'windmove-down)
(global-set-key (kbd "M-<left>") 'windmove-left)

;extra mode configs
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-dark-laptop)))
