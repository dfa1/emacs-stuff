;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Re-indent whole buffer, mapped as in netbeans (alt-shift-f). 
;;
;; Author    : Davide Angelocola <davide.angelocola@gmail.com>
;; Time-stamp: <2011-09-13 00:05:55 dfa>
;;

(defun reindent-whole-buffer ()
  "Re-indent the whole buffer."
  (interactive)
  (save-excursion 
    (with-temp-message "Indenting..."
      (indent-region (point-min) (point-max)))))

;; disable forward-word (I prefer C-<left>)
(global-unset-key "\M-F")
(global-unset-key "\M-f")
(global-set-key "\M-F" 'reindent-whole-buffer)
