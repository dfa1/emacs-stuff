;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Re-indent whole buffer, mapped as in netbeans (alt-shift-f). 
;;
;; Author    : Davide Angelocola <davide.angelocola@gmail.com>
;; Time-stamp: <2011-09-12 23:51:04 dfa>
;;

(defun reindent-whole-buffer (start end)
  "Re-indent the whole buffer."
  (interactive "r")
  (save-excursion 
    (mark-whole-buffer)
    (indent-region start end)))

;; disable forward-word (I prefer C-<left>)
(global-unset-key "\M-F")
(global-unset-key "\M-f")
(global-set-key "\M-F" 'reindent-whole-buffer)
