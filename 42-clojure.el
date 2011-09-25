;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; clojure mode
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
	    (local-set-key (kbd "C-SPC") 'complete-clojure)))

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

;; redefine local key bindings (as in netbeans)
(add-hook 'clojure-mode-hook
	  (lambda ()
	    (local-set-key (kbd "<C-f6>") 'clojure-test-run-tests)
	    (local-unset-key "\C-T")
	    (local-unset-key "\C-t")
	    (local-set-key "\C-T" 'my-clojure-switch-implementation-test)))

;; skeletons.. OMG!
(add-hook 'clojure-mode-hook
	  (lambda ()
	    (define-skeleton clojure-skeleton-deftest
	      "Insert a deftest" nil
	      > "(deftest " _ ""\n
	      "(is false))")
	    (local-set-key "\C-cit" 'clojure-skeleton-deftest)
	    (setq skeleton-end-hook nil)))

;; netbeans like jump to test/back to implementation
(defun parent-directory-name (file-name)
  (interactive)
  (car (last (split-string (file-name-directory buffer-file-name) "/" t))))

(defun my-clojure-switch-implementation-test ()
  (interactive)
  (if (string-equal "test" (parent-directory-name buffer-file-name))
      (clojure-test-jump-to-implementation)
    (clojure-jump-to-test)))
