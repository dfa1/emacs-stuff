;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; python-mode configuration (https://launchpad.net/python-mode)
;;
;; Author    : Davide Angelocola <davide.angelocola@gmail.com>
;; Time-stamp: <2011-05-11 11:16:50 dangelocola>

(load-library "python-mode")

;; (load-library "pycomplete") ;; requires pymacs
(setq auto-mode-alist 
      (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist 
      (cons '("python" . python-mode) interpreter-mode-alist))

(autoload 'python-mode "python-mode" "Python editing mode." t)

(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)
(defun open-bpython ()
  (interactive)

  (if (get-buffer "*BPYTHON*") 
      (switch-to-buffer "*BPYTHON*")
    (ansi-term "/usr/bin/bpython" "BPYTHON")))

(add-hook 'python-mode-hook
	  (lambda ()
	    (local-set-key [f3] 'open-bpython)))

