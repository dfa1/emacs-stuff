;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emacsclient / server stuff

(add-hook 'server-switch-hook
	  (lambda ()
	    (let ((server-buf (current-buffer)))
	      (bury-buffer)
	      (switch-to-buffer-other-frame server-buf))))

(add-hook 'server-done-hook 
	  'delete-frame)

(add-hook 'server-done-hook
	  (lambda ()
	    (kill-buffer nil)))

;; gentoo specific
(when (file-exists-p "/usr/share/emacs/site-lisp/site-gentoo.el")
  (load "/usr/share/emacs/site-lisp/site-gentoo"))

