;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; VC 

;; automatically follow symlinks
(setq vc-follow-symlinks t)

;; mercurial push 
(defun mercurial-push-cwd () 		; TODO: write a generic function
  (interactive)
  (generate-new-buffer "*hg push*")
  (switch-to-buffer "*hg push*")
  (vc-do-command "*hg push*" `async' "hg" nil "push"))

(global-set-key "\C-xvp" 'mercurial-push-cwd)

