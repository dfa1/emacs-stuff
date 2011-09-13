;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Bash

(defun bash-maybe()
  "Switch to the existing bash buffer or create it if missing."
  (interactive)
  (if (get-buffer "*BASH*") 
      (switch-to-buffer "*BASH*")
    (ansi-term "/bin/bash" "BASH")))
