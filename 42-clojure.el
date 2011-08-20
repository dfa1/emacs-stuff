;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; clojure mode
;;
;; Author    : Davide Angelocola <davide.angelocola@gmail.com>
;; Time-stamp: <2011-08-20 12:53:13 dfa>

(require 'clojure-mode)
;; (require 'clojure-test-mode)

(add-hook 'clojure-mode-hook
	  (lambda ()
	    ;; custom keybindings
	    (defun complete-clojure () 
	      (interactive)
	      (smart-tab 'slime-complete-symbol))

	    (local-set-key (kbd "<tab>") 'complete-clojure)))

;; enable flyspell-prog-mode
(add-hook 'clojure-mode-hook 'flyspell-prog-mode)

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
