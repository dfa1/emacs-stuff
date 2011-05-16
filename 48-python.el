;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; python-mode configuration (https://launchpad.net/python-mode)
;;
;; Author    : Davide Angelocola <davide.angelocola@gmail.com>
;; Time-stamp: <2011-05-11 11:16:50 dangelocola>

(defun open-bpython ()
  (interactive)

  (if (get-buffer "*BPYTHON*") 
      (switch-to-buffer "*BPYTHON*")
    (ansi-term "/usr/bin/bpython" "BPYTHON")))

(add-hook 'python-mode-hook
	  (lambda ()
	    (local-set-key [f3] 'open-bpython)))

