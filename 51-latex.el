;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; basic LaTeX support

(add-hook 'LaTeX-mode-hook
	  (lambda ()
	    ;; vars
	    (setq-default TeX-master nil) 
	    (setq TeX-parse-self t)
	    (setq TeX-auto-save t)
	    ;; suggested by flyspell.el documentation
	    (setq ispell-parser 'tex) 
	    
	    ;; italian accents
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

	    (defun complete-latex () 
	      (interactive)
	      (smart-tab 'TeX-complete-symbol))

	    (local-set-key (kbd "C-<space>") 'complete-latex)))

;; enabling flyspell
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
