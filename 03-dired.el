;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Fixing dired annoyances.

(add-hook 'dired-mode-hook
	  (lambda ()
	    ;; re-using buffers 
	    (put 'dired-find-alternate-file 'disabled nil)  
	    ;; disabling opening of files/directories with mouse click
	    (local-unset-key [mouse-2])))

