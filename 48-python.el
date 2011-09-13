;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; python-mode configuration (https://launchpad.net/python-mode)

(defun open-bpython ()
  (interactive)
  
  (if (get-buffer "*BPYTHON*") 
      (switch-to-buffer "*BPYTHON*")
    (ansi-term "/usr/bin/bpython" "BPYTHON")))

(add-hook 'python-mode-hook
	  (lambda ()
	    (flyspell-prog-mode)
	    (local-set-key [f3] 'open-bpython)))

