;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Smart completion. 
;;
;; parametric completion: a modified of smart completion version 
;;   based on http://www.emacswiki.org/emacs/TabCompletion
;;   this is NOT http://github.com/haxney/smart-tab/blob/master/smart-tab.el

(defun smart-tab (completion-hook)
  "If mark is active, indents region. Else if point is at the end
   of a symbol, expands it using the `completion-hook'. Else
   indents the current line."
  (interactive)
  (if mark-active
      (indent-region (region-beginning)
		     (region-end))
      (if (looking-at "\\>")
	  (funcall completion-hook)
	(indent-for-tab-command))))

;; other minor completion modes
(icomplete-mode 1)
(dynamic-completion-mode 1)

;; set dynamic abbreviations to case rude
(setq dabbrev-case-fold-search nil)
(setq save-abbrevs nil)

;; completion ignores filenames ending in any string in this list
(setq completion-ignored-extensions
      '(".o" ".lo" ".so" ".elc" ".class"))

