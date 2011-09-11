;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; perl-mode
;;
;; Author    : Davide Angelocola <davide.angelocola@gmail.com>
;; Time-stamp: <2010-12-29 17:02:28 dfa>

;; Use cperl-mode instead of the default perl-mode
(add-to-list 'auto-mode-alist '("\\.\\([pP][Llm]\\|al\\)\\'" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))

;; general configuration
(add-hook 'cperl-mode-hook
	  (lambda ()
	    ;; perldoc
	    (local-set-key "\C-c\C-f" 'cperl-perldoc)

	    ;; pod2man
	    (local-set-key "\C-c\C-v" 'cperl-pod-to-manpage)

	    ;; setting only non-invasive stuff
	    (setq cperl-hairy nil
		  abbrev-mode t		;; automatic keyword expansion
		  cperl-highlight-variables-indiscriminately t
		  cperl-auto-newline t
		  cperl-auto-newline-after-colon t
		  cperl-regexp-scan nil
		  cperl-electric-keywords t
		  cperl-electric-linefeed t
		  cperl-electric-parens nil)

	    ;; style
	    (setq cperl-set-style "PerlStyle")))


;; enabling eldoc for cperl-mode
(defun my-cperl-eldoc-documentation-function ()
  "Return meaningful doc string for `eldoc-mode'."
  (car
   (let ((cperl-message-on-help-error nil))
     (cperl-get-help))))

(add-hook 'cperl-mode-hook
	  (lambda ()
	    (eldoc-mode 1)
	    (set (make-local-variable 'eldoc-documentation-function)
		 'my-cperl-eldoc-documentation-function)))

;; enabling outline-minor-mode
(setq my-cperl-outline-regexp
      (concat
       "^"				 ;; start of line
       "[ \\t]*"			 ;; skip leading whitespace
       "\\("				 ;; begin capture group \1
       (join "\\|"
	     "=head[12]"		 ;; POD header
	     "package"			 ;; package
	     "=item"			 ;; POD item
	     "sub"			 ;; subroutine definition
	     )
       "\\)"				 ;; end capture group \1
       "\\b"				 ;; word boundary
       ))

(add-hook 'cperl-mode-hook
	  (lambda ()
	    (outline-minor-mode)

	    (defun cperl-outline-level ()
	      (looking-at outline-regexp)
	      (let ((match (match-string 1)))
		(cond
		 ((eq match "=head1" ) 1)
		 ((eq match "package") 2)
		 ((eq match "=head2" ) 3)
		 ((eq match "=item"  ) 4)
		 ((eq match "sub"    ) 5)
		 (t 7))))

	    (setq cperl-outline-regexp  my-cperl-outline-regexp)
	    (setq outline-regexp        cperl-outline-regexp)
	    (setq outline-level        'cperl-outline-level)))

