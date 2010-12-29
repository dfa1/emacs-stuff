;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CC and C mode 
;;
;; Author    : Davide Angelocola <davide.angelocola@gmail.com>
;; Time-stamp: <2010-12-29 17:01:32 dfa>

;; useful minor modes
(add-hook 'c-mode-common-hook
	  (lambda ()
	    (c-subword-mode 1)
	    (c-toggle-hungry-state 1)
	    (c-toggle-auto-newline 1)))

;; to automatically fill comments but not code
(add-hook 'c-mode-common-hook
	  (lambda ()
	    (auto-fill-mode 1)
	    (set (make-local-variable 'fill-nobreak-predicate)
		 (lambda ()
		   (not (eq (get-text-property (point) 'face)
			    'font-lock-comment-face))))))

;; common skeletons
(add-hook 'c-mode-common-hook
	  (lambda ()
	    ;; do-while
	    (define-skeleton c-common-skeleton-do
	      "Insert a do-while block" nil
	      > "do {"\n
	      _ \n
	      -4"} while ();")

	    ;; while
	    (define-skeleton c-common-skeleton-while
	      "Insert a while block" nil
	      >"while (" _ ") {"\n
	      \n
	      -4"}")

	    ;; for
	    (define-skeleton c-common-skeleton-for
	      "Insert a for block" nil
	      > "for (" _ ";;) {"\n
	      \n
	      -4"}")

	    ;; switch
	    (define-skeleton c-common-skeleton-switch
	      "Insert a switch block" nil
	      > "switch (" _ ") {"\n
	      \n
	      "default:"\n
	      -4"}")

	    ;; if
	    (define-skeleton c-common-skeleton-if
	      "Insert an if block" nil
	      > "if (" _ ") {"\n
	      \n
	      -4"}")

	    ;; else
	    (define-skeleton c-common-skeleton-else
	      "Insert an else block" nil
	      > "else {"\n
	      _ \n
	      -4"}")

	    ;; else if
	    (define-skeleton c-common-skeleton-else-if
	      "Insert an else-if block" nil
	      > "else if(" _ ") {"\n
	      \n
	      -4"}")

	    ;; mapping skeletons
	    (local-set-key "\C-cid" 'c-common-skeleton-do)
	    (local-set-key "\C-ciw" 'c-common-skeleton-while)
	    (local-set-key "\C-cif" 'c-common-skeleton-for)
	    (local-set-key "\C-cis" 'c-common-skeleton-switch)
	    (local-set-key "\C-cii" 'c-common-skeleton-if)
	    (local-set-key "\C-cie" 'c-common-skeleton-else)
	    (local-set-key "\C-cil" 'c-common-skeleton-else-if)

	    ;; end
	    (setq skeleton-end-hook nil)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; c-mode

;; style and other generic stuff
(add-hook 'c-mode-hook
	  (lambda ()
	    ;; My C style
	    (defconst my-c-style
	      '(
		(c-tab-always-indent . t)
		(c-tab-width . 4)
		(c-indent-tabs-mode . 1)
		(c-basic-offset . 4)
		(comment-multi-line t)
		)
	      "My C Programming Style")

	    ;; add my personal style and set it for the current buffer
	    (c-add-style "mine" my-c-style t)

	    ;; setting # behavior
	    (setq c-electric-pound-behavior '(alignleft))))

;; FlyMake
(add-hook 'c-mode-hook
	  (lambda ()
	    (load-library "flymake")

	    ;; loads flymake when possible
	    (add-hook 'find-file-hooks 'flymake-find-file-hook)

	    ;; disable GUI warnings
	    (setq flymake-gui-warnings-enabled nil)

	    ;; speedup
	    (setq flymake-start-syntax-check-on-newline nil)

	    ;; a somewhat handy function
	    (defun my-flymake-show-next-error()
	      (interactive)
	      (flymake-goto-next-error)
	      (flymake-display-err-menu-for-current-line))

	    ;; bind it to C-c C-v
	    (local-set-key "\C-c\C-v" 'my-flymake-show-next-error)))

;; move whole functions around...
(defun my-move-function-up ()
  "Swap the current (whole) function with the function above."
  (interactive)
  (c-mark-function)
  (kill-region (region-beginning) (region-end))
  (c-beginning-of-defun 1)
  (yank))

(defun my-move-function-down ()
  "Swap the current (whole) function with the function below."
  (interactive)
  (c-mark-function)
  (kill-region (region-beginning) (region-end))
  (c-beginning-of-defun -1)
  (yank))

(add-hook 'c-mode-hook
	  (lambda ()
	    (local-set-key "\C-cd" 'my-move-function-up)
	    (local-set-key "\C-cf" 'my-move-function-down)))

;; c preprocessor
(setq c-macro-shrink-window-flag t)
(setq c-macro-prompt-flag nil)
(setq c-macro-preprocessor "cpp -C")

;; .l, .gperf and .tc uses c-mode
(add-to-list 'auto-mode-alist '("\\.l$" . c-mode))
(add-to-list 'auto-mode-alist '("\\.gperf$" . c-mode))
(add-to-list 'auto-mode-alist '("\\.tc$" . c-mode))

;; disable auto-state on .y, .l, .tc or .gperf files
(add-hook 'c-mode-hook
	  (lambda ()
	    (mapc (lambda (r)
		    (when (secure-string-match r buffer-file-name)
		      (c-toggle-auto-state -1)))
		  '("\\.l$" "\\.y$" "\\.tc$" "\\.gperf"))))

;; disable flymake-mode for .h files
(add-hook 'c-mode-hook
	  (lambda ()
	    (mapc (lambda (r)
		    (when (secure-string-match r buffer-file-name)
		      (flymake-mode -1)))
		  '("\\.h$"))))

;; highlight %option for .l, .y and .tc files
(add-hook 'c-mode-hook
	  (lambda ()
	    (mapc (lambda (r)
		    (when (secure-string-match r buffer-file-name)
		      (font-lock-add-keywords nil
	      '(("%\\<\\(option\\)\\>" 1 font-lock-warning-face prepend)))))
		  '("\\.l$" "\\.y$" "\\.tc$"))))

;; highlight for treecc files
(add-hook 'c-mode-hook
	  (lambda ()
	    (mapc (lambda (r)
		    (when (secure-string-match r buffer-file-name)
		      (font-lock-add-keywords nil
					      '(("%\\<\\(abstract\\)\\>" 1 font-lock-keyword-face prepend)
						("%\\<\\(node\\)\\>" 1 font-lock-keyword-face prepend)
						("%\\<\\(virtual\\)\\>" 1 font-lock-keyword-face prepend)
						("%\\<\\(inline\\)\\>" 1 font-lock-keyword-face prepend)
						("%\\<\\(split\\)\\>" 1 font-lock-keyword-face prepend)
						("%\\<\\(include\\)\\>" 1 font-lock-keyword-face prepend)
						("%\\<\\(operation\\)\\>" 1 font-lock-keyword-face prepend)
						("%\\<\\(nocreate\\)\\>" 1 font-lock-keyword-face prepend)
						("%\\<\\(decls\\)\\>" 1 font-lock-keyword-face prepend)
						("%\\<\\(both\\)\\>" 1 font-lock-keyword-face prepend)
						("%\\<\\(end\\)\\>" 1 font-lock-keyword-face prepend)
						("%\\<\\(readonly\\)\\>" 1 font-lock-keyword-face prepend)
						("%\\<\\(header\\)\\>" 1 font-lock-keyword-face prepend)
						("%\\<\\(output\\)\\>" 1 font-lock-keyword-face prepend)
						("%\\<\\(outdir\\)\\>" 1 font-lock-keyword-face prepend)
						("%\\<\\(common\\)\\>" 1 font-lock-keyword-face prepend)))))
		  '("\\.tc$"))))

;; highlight for bison files
(add-hook 'c-mode-hook
	  (lambda () 
	    (mapc (lambda (r)
		    (when (secure-string-match r buffer-file-name)
		      (font-lock-add-keywords nil
					      '(("%\\<\\(prec\\)\\>" 1 font-lock-keyword-face prepend)
						("%\\<\\(token\\)\\>" 1 font-lock-keyword-face prepend)
						("%\\<\\(left\\)\\>" 1 font-lock-keyword-face prepend)
						("%\\<\\(right\\)\\>" 1 font-lock-keyword-face prepend)
						("%\\<\\(nonassoc\\)\\>" 1 font-lock-keyword-face prepend)
						("%\\<\\(type\\)\\>" 1 font-lock-keyword-face prepend)
						("\\<\\(error\\)\\>" 1 font-lock-warning-face prepend)))))
		  '("\\.y$"))))

;; C specific skeletons
(add-hook 'c-mode-hook
	  (lambda ()
	    ;; main
	    (define-skeleton c-skeleton-main
	      "Insert a main()" nil
	      > "int main(int argc, char \**argv)"\n
	      -4"{"\n
	      _ \n
	      -4"}")

	    ;; mapping skeletons
	    (local-set-key "\C-cim" 'c-skeleton-main)

	    ;; end
	    (setq skeleton-end-hook nil)))
