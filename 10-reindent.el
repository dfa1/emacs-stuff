;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Indent buffer, mapped as in netbeans (alt-shift-f). 

(defun indent-buffer ()
  "Indent the buffer according to the current major mode."
  (interactive)
  (save-excursion 
    (with-temp-message (format "indenting %s" (buffer-name))
      (indent-region (point-min) (point-max)))))

