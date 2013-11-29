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

(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20130724.1750/")
(add-to-list 'load-path	"~/.emacs.d/elpa/markdown-mode-20130726.2142/")

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(load-theme 'zenburn t)

(require 'auto-complete)
(global-auto-complete-mode t)

(require 'column-marker)
(add-hook 'python-mode-hook (lambda () (interactive) (column-marker-2 80)))
(add-hook 'ruby-mode-hook (lambda () (interactive) (column-marker-3 100)))

(column-number-mode t)

(require 'ido)
(ido-mode t)

(autoload 'markdown-mode "markdown-mode"
       "Major mode for editing Markdown files" t)
    (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
    (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
    (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(require 'multiple-cursors)

(add-hook 'css-mode-hook 'rainbow-mode)
(add-hook 'sass-mode-hook 'rainbow-mode)

(require 'rvm)
(rvm-use-default)


(autoload 'sass-mode "sass-mode")
    (add-to-list 'auto-mode-alist '("\\.scss\\'" . sass-mode))
    (add-to-list 'auto-mode-alist '("\\.sass\\'" . sass-mode))


(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets/"
	"~/.emacs.d/elpa/yasnippet-20130902.1201/snippets/"))
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
 '(custom-safe-themes (quote ("3ad55e40af9a652de541140ff50d043b7a8c8a3e73e2a649eb808ba077e75792" default)))
 '(flycheck-checkers (quote (bash c/c++-clang c/c++-cppcheck coffee-coffeelint css-csslint elixir emacs-lisp emacs-lisp-checkdoc erlang go-gofmt go-build go-test haml haskell-hdevtools haskell-ghc haskell-hlint javascript-jshint json-jsonlint less lua perl php php-phpcs puppet-parser puppet-lint python-flake8 python-pylint rst ruby-rubocop ruby ruby-jruby rust sass scala scss sh-dash sh-bash tex-chktex tex-lacheck xml-xmlstarlet zsh)))
 '(safe-local-variable-values (quote ((lexical-binding . t)))))

;Custom commands
(defun reload-init ()
"Reload init.el without restarting."
    (interactive)
      (load-file "~/.emacs.d/init.el"))

(defun show-file-name ()
  "Show the full path file name in the minibuffer."
  (interactive)
  (message (buffer-file-name)))

;custom keys
;;;;;;;;;;;;
;global
(global-set-key [(control f1)] 'show-file-name)
(global-set-key [(control f9)] 'reload-init)
(global-set-key [(control f12)] 'describe-key)
(global-set-key (kbd "s-{") 'previous-buffer)
(global-set-key (kbd "s-}") 'next-buffer)
(global-set-key (kbd "M-<up>") 'backward-paragraph)
(global-set-key (kbd "M-s-<up>") 'windmove-up)
(global-set-key (kbd "M-s-<right>") 'windmove-right)
(global-set-key (kbd "M-<down>") 'forward-paragraph)
(global-set-key (kbd "M-s-<down>") 'windmove-down)
(global-set-key (kbd "M-s-<left>") 'windmove-left)
(global-set-key (kbd "C-c n") 'flycheck-next-error)
(global-set-key (kbd "C-c p") 'flycheck-previous-error)
(global-set-key (kbd "C-c ~") 'flycheck-buffer)
(global-set-key (kbd "C-c /") 'comment-region)
(global-set-key (kbd "C-c ?") 'uncomment-region)
(global-set-key (kbd "C-c w") 'whitespace-cleanup)
;multiple-cursors
(global-set-key (kbd "C-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(show-paren-mode 1)
(setq inhibit-startup-message t)
(setq ring-bell-function 'ignore)
(global-linum-mode t)
(global-auto-revert-mode t)
(add-hook 'after-init-hook #'global-flycheck-mode)
(defvar flycheck-check-syntax-automatically)
(setq flycheck-check-syntax-automatically '(save))
'flycheck '(setq flycheck-checkers (delq 'html-tidy flycheck-checkers))

;extra mode configs
(setq-default indent-tabs-mode nil)
(add-to-list 'default-frame-alist '(height . 67))
(add-to-list 'default-frame-alist '(width . 113))
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(provide 'init)
;;; init.el ends here
