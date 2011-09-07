;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; clojure mode
;;
;; Author    : Davide Angelocola <davide.angelocola@gmail.com>
;; Time-stamp: <2011-09-07 22:49:49 dfa>

(require 'clojure-mode)
; TODO: (require 'clojure-test-mode)		

;; enable flyspell-prog-mode
(add-hook 'clojure-mode-hook 'flyspell-prog-mode)

;; enabling tab completion
(add-hook 'clojure-mode-hook
	  (lambda ()
	    (defun complete-clojure () 
	      (interactive)
	      (smart-tab 'slime-complete-symbol))
	    (local-set-key (kbd "<tab>") 'complete-clojure)))))

; slime-repl customisation
;; (add-hook 'slime-repl-hook
;;  (lambda ()
;;    (slime-repl-eval-string "(set! *print-length*  swank-clojure 1.3.110)")
;;    (slime-repl-eval-string "(use 'clojure.contrib.repl-utils)")))

;; slime (mapped to F3)
;; (defun force-swith-to-slime() 
;;   (interactive)
;;   (if (slime-connected-p)
;;     (slime-switch-to-output-buffer)
;;     (slime)))
