;;; typescript-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (typescript-mode) "typescript-mode" "typescript-mode.el"
;;;;;;  (22399 50532 84734 646000))
;;; Generated autoloads from typescript-mode.el

(autoload 'typescript-mode "typescript-mode" "\
Major mode for editing typescript.

Key bindings:

\\{typescript-mode-map}

\(fn)" t nil)

(eval-after-load 'folding '(when (fboundp 'folding-add-to-marks-list) (folding-add-to-marks-list 'typescript-mode "// {{{" "// }}}")))

(add-to-list 'auto-mode-alist '("\\.ts$" . typescript-mode))

;;;***

;;;### (autoloads nil nil ("typescript-mode-pkg.el") (22399 50532
;;;;;;  98433 947000))

;;;***

(provide 'typescript-mode-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; typescript-mode-autoloads.el ends here
