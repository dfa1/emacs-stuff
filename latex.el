;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; LaTeX

(setq-default TeX-master nil) 
(setq TeX-parse-self t)
(setq TeX-auto-save t)

(add-hook 'LaTeX-mode-hook
	  (lambda ()
	    ;; italian accents; I don't like the italian keyboard's layout
	    (define-skeleton latex-e-skeleton
	      "Insert \`{e} " nil
	      > "\\`{e}" _)
	    (define-skeleton latex-ee-skeleton
	      "Insert \'{e} " nil
	      > "\\'{e}" _)
	    (define-skeleton latex-i-skeleton
	      "Insert \`{i} " nil
	      > "\\`{i}" _)
	    (define-skeleton latex-o-skeleton
	      "Insert \`{o} " nil
	      > "\\`{o}" _)
	    (define-skeleton latex-u-skeleton
	      "Insert \`{u} " nil
	      > "\\`{u}" _)	    
	    (define-skeleton latex-a-skeleton
	      "Insert \`{a} " nil
	      > "\\`{a}" _)
	    
	    (local-set-key "\C-ce" 'latex-e-skeleton)
	    (local-set-key "\C-cE" 'latex-ee-skeleton)
	    (local-set-key "\C-ci" 'latex-i-skeleton)
	    (local-set-key "\C-co" 'latex-o-skeleton)
	    (local-set-key "\C-cu" 'latex-u-skeleton)
	    (local-set-key "\C-ca" 'latex-a-skeleton)
	    
	    ;; autocompletion with tab-or-indent
	    (defun complete-latex () 
	      (interactive)
	      (smart-tab 'TeX-complete-symbol))

	    (local-set-key (kbd "<tab>") 'complete-latex)))
