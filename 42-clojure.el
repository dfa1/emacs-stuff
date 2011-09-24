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
	    (local-set-key (kbd "C-<space>") 'complete-clojure)))

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
    (clojure-jack-i09n)))

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

;; my convention for clojure projects:
;;   src/foo.clj
;;   test/foo/test.clj

(defun parent-directory-name (file-name)
  (interactive)
  (car (last (split-string (file-name-directory buffer-file-name) "/" t))))

(defun my-clojure-jump-to-test (src-name)
  (find-file 
   (format 
    "../test/%s/test.clj" 
    (file-name-sans-extension (file-name-nondirectory src-name)))))

(defun my-clojure-jump-to-implementation (test-name)
  (interactive)
  (find-file 
   (format 
    "../../src/%s.clj" 
    (parent-directory-name (file-name-sans-extension test-name))))

(defun my-clojure-switch-implementation-test ()
  (interactive)
  (if (string-match-p "test.clj" (file-name-nondirectory buffer-file-name))
      (my-clojure-jump-to-implementation buffer-file-name)
    (my-clojure-jump-to-test buffer-file-name)))
