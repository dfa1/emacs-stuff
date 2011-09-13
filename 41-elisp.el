;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; elisp-mode
;;
;; Author    : Davide Angelocola <davide.angelocola@gmail.com>
;; Time-stamp: <2011-09-12 23:49:11 dfa>

;; enable flyspell-prog-mode
(add-hook 'emacs-lisp-mode-hook 'flyspell-prog-mode)

;; enable eldoc
(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (eldoc-mode 1)))

;; keybindings
(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (defun complete-elisp () 
	      (interactive)
	      (smart-tab 'lisp-complete-symbol))
	    
	    ;; rebind lisp-complete-symbol to TAB
	    (local-set-key (kbd "<tab>") 'complete-elisp)))

;; templates
(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    ;; add-hook
	    (define-skeleton elisp-skeleton-add-hook
	      "Insert an add-hook block" nil
	      > "(add-hook '" _ "\n"
	      > "(lambda ()\n"
	      > "))")

	    ;; defun
	    (define-skeleton elisp-skeleton-defun
	      "Insert a defun" nil
	      > "(defun " _ " ()\n"
	      > "  \"\"\n"
	      > ")")

	    ;; setq
	    (define-skeleton elisp-skeleton-setq
	      "Insert setq " nil
	      > "(setq " _ ")\n")

	    ;; new section
	    (define-skeleton elisp-skeleton-new-section
	      "Insert a new section (just a comment :-) " nil
	      > (concat (string-repeat ";" 80) "\n;; ") _ "")

	    ;; mapping skeletons
	    (local-set-key "\C-cih" 'elisp-skeleton-add-hook)
	    (local-set-key "\C-cid" 'elisp-skeleton-defun)
	    (local-set-key "\C-cis" 'elisp-skeleton-setq)
	    (local-set-key "\C-cin" 'elisp-skeleton-new-section)

	    ;; end
	    (setq skeleton-end-hook nil)))


