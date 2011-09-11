;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; clojure mode
;;
;; Author    : Davide Angelocola <davide.angelocola@gmail.com>
;; Time-stamp: <2011-09-11 12:26:09 dfa>

(require 'clojure-mode)
(require 'clojure-test-mode)		

;; enable flyspell-prog-mode
(add-hook 'clojure-mode-hook 'flyspell-prog-mode)

;; enabling tab completion
(add-hook 'clojure-mode-hook
	  (lambda ()
	    (defun complete-clojure () 
	      (interactive)
	      (smart-tab 'slime-complete-symbol))
	    (local-set-key (kbd "<tab>") 'complete-clojure)))

;; enabling test mode
(add-hook 'clojure-mode-hook
	  (lambda ()
	    (clojure-test-mode 1)))

;; mapped to F3
(defun slime-maybe()
  "Provide the SLIME interactive REPL."
  (interactive)
  (if (get-buffer "*slime-repl nil*") 
      (switch-to-buffer "*slime-repl nil*") 
    (clojure-jack-in)))

;; skeletons.. OMG!
(add-hook 'clojure-mode-hook
	  (lambda ()
	    (define-skeleton clojure-skeleton-deftest
	      "Insert a deftest" nil
	      > "(deftest " _ ""\n
	      "(is false))")
	    (local-set-key "\C-cit" 'clojure-skeleton-deftest)
	    (setq skeleton-end-hook nil)))
