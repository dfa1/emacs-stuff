;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Indent buffer, mapped as in netbeans (alt-shift-f). 
;;
;; Author    : Davide Angelocola <davide.angelocola@gmail.com>
;; Time-stamp: <2011-09-13 19:36:07 dfa>
;;

(defun indent-buffer ()
  "Indent the buffer according to the current major mode."
  (interactive)
  (save-excursion 
    (with-temp-message (format "indenting %s" (buffer-name))
      (indent-region (point-min) (point-max)))))

