;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CMurphi for GNU Emacs
;;
;; Author     : Davide Angelocola <davide.angelocola@gmail.com>
;; Time-stamp : <2005-11-30 13:27:11 dfa>
;;

;; define cmurphi-mode version.
(defconst cmurphi-version "0.1"
  "`cmurphi-mode' version number")

;; create a customization group
(defgroup cmurphi nil
  "Support for the cmurphi programming language"
  :group 'languages
  :prefix "cmurphi-")

;; output cmurphi-version in the minibuffer
(defun cmurphi-version ()
  "Echo the current version of `cmurphi-mode' in the minibuffer."
  (interactive)
  (message "Using `cmurphi-mode' version %s" cmurphi-version))

;; font-lock
(defvar cmurphi-font-lock-keywords
  (let ((keywords (mapconcat 'identity
			'(
    "alias"           "array"           "assert"          "begin"           
    "boolean"         "by"              "case"            "clear"
    "const"           "do"              "else"            "elsif"
    "end"             "endalias"        "endexists"       "endfor"
    "endforall"       "endfunction"     "endif"           "endprocedure"
    "endrecord"       "endrule"         "endruleset"      "endstartstate"
    "endswitch"       "endwhile"        "enum"            "error"
    "exists"          "false"           "for"             "forall"
    "function"        "if"              "in"              "interleaved"
    "invariant"       "of"              "procedure"       "process"
    "program"         "put"             "record"          "return"
    "rule"            "ruleset"         "startstate"      "switch"
    "then"            "to"              "traceuntil"      "true"
    "type"            "var"             "while"	  

    "Alias"           "Array"           "Assert"          "Begin"           
    "Boolean"         "By"              "Case"            "Elear"
    "Const"           "Do"              "Else"            "Elsif"
    "End"             "Endalias"        "Endexists"       "Endfor"
    "Endforall"       "Endfunction"     "Endif"           "Endprocedure"
    "Endrecord"       "Endrule"         "Endruleset"      "Endstartstate"
    "Endswitch"       "Endwhile"        "Enum"            "Error"
    "Exists"          "False"           "For"             "Forall"
    "Function"        "If"              "In"              "Interleaved"
    "Invariant"       "Of"              "Procedure"       "Process"
    "Program"         "Put"             "Record"          "Return"
    "Rule"            "Ruleset"         "Startstate"      "Switch"
    "Then"            "To"              "Traceuntil"      "True"
    "Type"            "Var"             "While"	  

			  ) "\\|")))
    (list
     ;; keywords
     (cons (concat "\\<\\(" keywords "\\)\\>") 1)))
  "Additional expressions to highlight in cmurphi mode.")
(put 'cmurphi-mode 'font-lock-defaults '(cmurphi-font-lock-keywords))

;; syntax table for cmurphi
(defvar cmurphi-mode-syntax-table nil
  "Syntax table used in `cmurphi-mode' buffers.")
(when (not cmurphi-mode-syntax-table)
  (setq cmurphi-mode-syntax-table (make-syntax-table))
  (modify-syntax-entry ?\( "()" cmurphi-mode-syntax-table)
  (modify-syntax-entry ?\) ")(" cmurphi-mode-syntax-table)
  (modify-syntax-entry ?\[ "(]" cmurphi-mode-syntax-table)
  (modify-syntax-entry ?\] ")[" cmurphi-mode-syntax-table)
  (modify-syntax-entry ?\$ "."  cmurphi-mode-syntax-table)
  (modify-syntax-entry ?\% "."  cmurphi-mode-syntax-table)
  (modify-syntax-entry ?\& "."  cmurphi-mode-syntax-table)
  (modify-syntax-entry ?\* "."  cmurphi-mode-syntax-table)
  (modify-syntax-entry ?\+ "."  cmurphi-mode-syntax-table)
  (modify-syntax-entry ?\- "."  cmurphi-mode-syntax-table)
  (modify-syntax-entry ?\/ "."  cmurphi-mode-syntax-table)
  (modify-syntax-entry ?\< "."  cmurphi-mode-syntax-table)
  (modify-syntax-entry ?\= "."  cmurphi-mode-syntax-table)
  (modify-syntax-entry ?\> "."  cmurphi-mode-syntax-table)
  (modify-syntax-entry ?\| "."  cmurphi-mode-syntax-table)
  (modify-syntax-entry ?\_ "w"  cmurphi-mode-syntax-table)
  ;; double quote are string delimiters
  (modify-syntax-entry ?\" "\"" cmurphi-mode-syntax-table)
  ;; comment delimiters
  (modify-syntax-entry ?\- ". 124"  cmurphi-mode-syntax-table)
  (modify-syntax-entry ?\n ">"  cmurphi-mode-syntax-table))

;; define a mode-specific abbrev table for those who use such things
(defvar cmurphi-mode-abbrev-table nil
  "Abbrev table in use in `cmurphi-mode' buffers.")
(define-abbrev-table 'cmurphi-mode-abbrev-table nil)

;; hooks
(defvar cmurphi-mode-hook nil
  "*Hook called by `cmurphi-mode'.")

;; main
(defun cmurphi-mode ()
  "cmurphi mode"
  (interactive)
  ;; setup local variables
  (kill-all-local-variables)
  (make-local-variable 'comment-start)
  (make-local-variable 'comment-end)
  (make-local-variable 'comment-start-skip)
  (make-local-variable 'comment-column)
  (setq major-mode 'cmurphi-mode
	mode-name "cmurphi"
	require-final-newline t
	tab-always-indent nil
	tab-width 4			     ;; FIXME
	font-lock-defaults '(cmurphi-font-lock-keywords)
	comment-start "--"
	comment-end ""
;; 	comment-start-skip "# *"
	comment-column 30)
  (set-syntax-table cmurphi-mode-syntax-table)
  (local-set-key "TAB" 'self-insert-command) ;; FIXME

  ;; running the hooks (always the last)
  (if cmurphi-mode-hook
      (run-hooks 'cmurphi-mode-hook)))

(provide 'cmurphi-mode)
