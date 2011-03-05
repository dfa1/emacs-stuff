;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; nopaste.pl interface 
;; (see also my nopaste.pl script)
;;
;; TODO: broken stuff
;;
;; Author    : Davide Angelocola <davide.angelocola@gmail.com>
;; Time-stamp: <2011-03-05 22:01:53 dfa>

(defun nopaste-region-to-file (start end)
  "Save current region in a temporarily file and return the
   filename as string."
  (let ((filename (make-temp-file "nopaste")))
    (write-region start end filename) ;; thanks to exg
    filename))

(defun nopaste-send (file)
  "Send the file to nopaste (using nopaste.pl), the open the
   default browser to the resulting page."
  (browse-url 
   (substring 
    (shell-command-to-string (concat "nopaste.pl" " " file)) 0 -1)))

(defun nopaste-region (start end)
  "Send the current region to nopaste."
  (interactive "r")
  (nopaste-send (nopaste-region-to-file start end)))

(defun nopaste-buffer ()
  "Send the current buffer to nopaste."
  (interactive)
  (nopaste-send (buffer-file-name)))

