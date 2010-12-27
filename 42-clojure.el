;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; clojure-mode 

(add-hook 'clojure-mode-hook
	  (lambda ()
	    ;; custom keybindings
	    (defun complete-clojure () 
	      (interactive)
	      (smart-tab 'slime-complete-symbol))

	    (local-set-key (kbd "<tab>") 'complete-clojure)))

; slime-repl customisation
(add-hook 'slime-repl-hook
 (lambda ()
   (slime-repl-eval-string "(set! *print-length* 10)")
   (slime-repl-eval-string "(use 'clojure.contrib.repl-utils)")))

;; slime (mapped to F3)
(defun force-swith-to-slime() 
  (interactive)
  (if (slime-connected-p)
    (slime-switch-to-output-buffer)
    (slime)))
