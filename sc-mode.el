;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SC for GNU Emacs
;;
;; Author     : Davide Angelocola <davide.angelocola@gmail.com>
;; Time-stamp : <2005-11-30 13:27:11 dfa>
;;

;; define sc-mode version.
(defconst sc-version "0.1"
  "`sc-mode' version number")

;; create a customization group
(defgroup sc nil
  "Support for the sc programming language"
  :group 'languages
  :prefix "sc-")

;; output sc-version in the minibuffer
(defun sc-version ()
  "Echo the current version of `sc-mode' in the minibuffer."
  (interactive)
  (message "Using `sc-mode' version %s" sc-version))

;; font-lock
(defvar sc-font-lock-keywords
  (let ((keywords (mapconcat 'identity
			'(
   "//" "co" "oc" "for" "int" "float" "double" "void" "return" "cond" "process" "wait" "signal" 
   "P" "V" "if" "else" "while" "monitor" "procedure" "empty" "minrank" "signal_all" 
			  ) "\\|")))
    (list
     ;; keywords
     (cons (concat "\\<\\(" keywords "\\)\\>") 1)))
  "Additional expressions to highlight in sc mode.")
(put 'sc-mode 'font-lock-defaults '(sc-font-lock-keywords))

;; syntax table for sc
(defvar sc-mode-syntax-table nil
  "Syntax table used in `sc-mode' buffers.")
(when (not sc-mode-syntax-table)
  (setq sc-mode-syntax-table (make-syntax-table))

  (modify-syntax-entry ?\( "()" sc-mode-syntax-table)
  (modify-syntax-entry ?\) ")(" sc-mode-syntax-table)
  (modify-syntax-entry ?\[ "(]" sc-mode-syntax-table)
  (modify-syntax-entry ?\] ")[" sc-mode-syntax-table)
  (modify-syntax-entry ?\$ "."  sc-mode-syntax-table)
  (modify-syntax-entry ?\% "."  sc-mode-syntax-table)
  (modify-syntax-entry ?\& "."  sc-mode-syntax-table)
  (modify-syntax-entry ?\* "."  sc-mode-syntax-table)
  (modify-syntax-entry ?\+ "."  sc-mode-syntax-table)
  (modify-syntax-entry ?\- "."  sc-mode-syntax-table)
  (modify-syntax-entry ?\/ "."  sc-mode-syntax-table)
  (modify-syntax-entry ?\< "."  sc-mode-syntax-table)
  (modify-syntax-entry ?\= "."  sc-mode-syntax-table)
  (modify-syntax-entry ?\> "."  sc-mode-syntax-table)
  (modify-syntax-entry ?\| "."  sc-mode-syntax-table)
  (modify-syntax-entry ?\_ "w"  sc-mode-syntax-table)
  ;; double quote are string delimiters
  (modify-syntax-entry ?\" "\"" sc-mode-syntax-table)
  ;; comment delimiters
  (modify-syntax-entry ?\# "<"  sc-mode-syntax-table)
  (modify-syntax-entry ?\n ">"  sc-mode-syntax-table))

;; define a mode-specific abbrev table for those who use such things
(defvar sc-mode-abbrev-table nil
  "Abbrev table in use in `sc-mode' buffers.")
(define-abbrev-table 'sc-mode-abbrev-table nil)

;; hooks
(defvar sc-mode-hook nil
  "*Hook called by `sc-mode'.")

;; main
(defun sc-mode ()
  "sc mode"
  (interactive)
  ;; setup local variables
  (kill-all-local-variables)
  (make-local-variable 'comment-start)
  (make-local-variable 'comment-end)
  (make-local-variable 'comment-start-skip)
  (make-local-variable 'comment-column)
  (setq major-mode 'sc-mode
	mode-name "sc"
	require-final-newline t
	tab-always-indent nil
	tab-width 4			     ;; FIXME
	font-lock-defaults '(sc-font-lock-keywords)
	comment-start "##"
	comment-end ""
 	comment-start-skip ""
	comment-column 30)
  (set-syntax-table sc-mode-syntax-table)
  (local-set-key "TAB" 'self-insert-command) ;; FIXME

  ;; running the hooks (always the last)
  (if sc-mode-hook
      (run-hooks 'sc-mode-hook)))

(provide 'sc-mode)
