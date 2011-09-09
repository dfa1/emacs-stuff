;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Bash
;;
;; Author    : Davide Angelocola <davide.angelocola@gmail.com>
;; Time-stamp: <2011-09-10 00:41:54 dfa>

;; mapped to F2 (see 80-keymap.el)
(defun bash-maybe()
  "Switch to the existing bash buffer or create it if missing."
  (interactive)
  (if (get-buffer "*BASH*") 
      (switch-to-buffer "*BASH*")
    (ansi-term "/bin/bash" "BASH")))
