;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Smart completion. 
;;
;; Author    : Davide Angelocola <davide.angelocola@gmail.com>
;; Time-stamp: <2010-12-24 13:53:05 dfa>
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


