;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; clojure mode
;;
;; Author    : Davide Angelocola <davide.angelocola@gmail.com>
;; Time-stamp: <2010-12-29 17:00:50 dfa>

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

;; enable flyspell-prog-mode
(add-hook 'clojure-mode-hook 'flyspell-prog-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; clojure-mode without clojure-box 
;;
;; http://wiki.unto.net/setting-up-clojure-and-slime
;; http://riddell.us/ClojureWithEmacsSlimeSwankOnUbuntu.html

;; (add-to-list 'load-path "~/apps/clojure-mode")
;; (add-to-list 'load-path "~/apps/swank-clojure")
;; (add-to-list 'load-path "~/apps/slime")

;; (setq swank-clojure-jar-path "~/apps/clojure/1.1/clojure.jar")

;; (require 'clojure-mode)
;; (require 'swank-clojure)
;; (require 'slime)


;; (eval-after-load "slime" (slime-setup '(slime-repl)))
;; (slime-setup)

;; ; slime-repl customisation
;; (add-hook 'slime-repl-hook
;;  (lambda ()
;;    (slime-repl-eval-string "(set! *print-length* 10)")
;;    (slime-repl-eval-string "(use 'clojure.contrib.repl-utils)")))
