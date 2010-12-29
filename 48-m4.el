;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; m4-mode

;; autotest
(add-to-list 'auto-mode-alist '("\\.at$" . m4-mode))

;; highlight autotest macros
(add-hook 'm4-mode-hook
	  `(lambda ()
	     (font-lock-add-keywords 
	      nil 
	      '((,(regexp-opt (list "AT_CHECK"
				    "AT_BANNER"
				    "AT_DATA"
				    "AT_CLEANUP"
				    "AT_SETUP")) 
		 0 font-lock-keyword-face
		 prepend)))))

;; autotest skeletons
(add-hook 'm4-mode-hook
	  (lambda ()
	    ;; new-test
	    (define-skeleton at-insert-test-skeleton
	      "Insert a test" nil
	      > "AT_SETUP([" _ "])"\n
	      "AT_DATA([], [["\n
	      "]])"\n
	      "AT_CHECK([], [0])"\n
	      "AT_CLEANUP"\n\n)

	    (local-set-key "\C-ct" 'at-insert-test-skeleton)

	    ;; end
	    (setq skeleton-end-hook nil)))
