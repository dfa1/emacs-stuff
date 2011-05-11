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

(local-set-key [f3] 'open-bpython)
