;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; basic html support 
;; (XXX: I don't use this stuff since 2004)
;;
;; Author    : Davide Angelocola <davide.angelocola@gmail.com>
;; Time-stamp: <2010-12-29 17:03:46 dfa>

(add-hook 'html-mode-hook
	  (lambda ()
	    ;; using tidy as html validator
	    (setq sgml-validate-command "tidy -qe")

	    ;; setting indent-line-function
	    (setq indent-line-function 'indent-relative)
 
	    ;; mapping C-c C-c to sgml-validate
	    (local-set-key "\C-c\C-c" 'sgml-validate)))
