;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; html-mode

(add-hook 'html-mode-hook
	  (lambda ()
	    ;; using tidy as html validator
	    (setq sgml-validate-command "tidy -qe")

	    ;; setting indent-line-function
	    (setq indent-line-function 'indent-relative)
 
	    ;; mapping C-c C-c to sgml-validate
	    (local-set-key "\C-c\C-c" 'sgml-validate)))
