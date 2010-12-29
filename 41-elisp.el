;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emacs-lisp

;; bytecompile 
(require 'bytecomp)

(defun compile-buffer ()
  "Compile the current buffer."
  (interactive)
  (when (elisp-file-p (buffer-file-name))
		      (byte-compile-file (buffer-file-name))))

;; autocompile dotemacs at save
(add-hook 'after-save-hook 'compile-buffer)

;; TODO: hack to load emacs-lisp-mode for "dotemacs-windows"
;; (add-to-list 'auto-mode-alist '("dotemacs-windows" . emacs-lisp-mode))

;; enable eldoc
(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (eldoc-mode 1)))

;; keybindings
(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (defun complete-elisp () 
	      (interactive)
	      (smart-tab 'lisp-complete-symbol))
	    
	    ;; rebind lisp-complete-symbol to TAB
	    (local-set-key (kbd "<tab>") 'complete-elisp)))

;; templates
(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    ;; add-hook
	    (define-skeleton elisp-skeleton-add-hook
	      "Insert an add-hook block" nil
	      > "(add-hook '" _ "\n"
	      > "(lambda ()\n"
	      > "))")

	    ;; defun
	    (define-skeleton elisp-skeleton-defun
	      "Insert a defun" nil
	      > "(defun " _ " ()\n"
	      > "  \"\"\n"
	      > ")")

	    ;; setq
	    (define-skeleton elisp-skeleton-setq
	      "Insert setq " nil
	      > "(setq " _ ")\n")

	    ;; new section
	    (define-skeleton elisp-skeleton-new-section
	      "Insert a new section (just a comment :-) " nil
	      > (concat (string-repeat ";" 80) "\n;; ") _ "")

	    ;; mapping skeletons
	    (local-set-key "\C-cih" 'elisp-skeleton-add-hook)
	    (local-set-key "\C-cid" 'elisp-skeleton-defun)
	    (local-set-key "\C-cis" 'elisp-skeleton-setq)
	    (local-set-key "\C-cin" 'elisp-skeleton-new-section)

	    ;; end
	    (setq skeleton-end-hook nil)))
