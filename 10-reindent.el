;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Indent buffer, mapped as in netbeans (alt-shift-f). 
;;
;; Author    : Davide Angelocola <davide.angelocola@gmail.com>
;; Time-stamp: <2011-09-13 18:13:28 dfa>
;;

(defun indent-buffer ()
  "Indent the buffer according to the current major mode."
  (interactive)
  (save-excursion 
    (with-temp-message (format "indenting %s" (buffer-name))
      (indent-region (point-min) (point-max)))))

;; disable forward-word (I prefer C-<left>)
(global-unset-key "\M-F")
(global-unset-key "\M-f")
(global-set-key "\M-F" 'indent-buffer)
