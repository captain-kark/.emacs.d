;;; tide-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (tide-mode tide-setup tide-format tide-format-before-save
;;;;;;  company-tide) "tide" "tide.el" (22399 50533 408734 667000))
;;; Generated autoloads from tide.el

(autoload 'company-tide "tide" "\


\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

(autoload 'tide-format-before-save "tide" "\
Before save hook to format the buffer before each save.

\(fn)" t nil)

(autoload 'tide-format "tide" "\
Format the current region or buffer.

\(fn)" t nil)

(autoload 'tide-setup "tide" "\
Setup `tide-mode' in current buffer.

\(fn)" t nil)

(autoload 'tide-mode "tide" "\
Minor mode for Typescript Interactive Development Environment.

\\{tide-mode-map}

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("tide-pkg.el") (22399 50533 416788 661000))

;;;***

(provide 'tide-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; tide-autoloads.el ends here
