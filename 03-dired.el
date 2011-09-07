;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Fixing dired annoyances.
;;
;; Author    : Davide Angelocola <davide.angelocola@gmail.com>
;; Time-stamp: <2011-05-11 17:35:28 dangelocola>

(add-hook 'dired-mode-hook
	  (lambda ()
	    ;; re-using buffers 
	    (put 'dired-find-alternate-file 'disabled nil)  
	    ;; disabling opening of files/directories with mouse click
	    (local-unset-key [mouse-2])))

