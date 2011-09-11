;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; VC configuration as well as custom mercurial commands
;;
;; Author    : Davide Angelocola <davide.angelocola@gmail.com>
;; Time-stamp: <2011-09-11 13:41:47 dfa>

;; automatically follow symlinks
(setq vc-follow-symlinks t)

(defun mercurial-push-cwd () 		; TODO: write a generic function
  "Do a mercurial push of the current repository."
  (interactive)
  (generate-new-buffer "*hg push*")
  (switch-to-buffer "*hg push*")
  (vc-do-command "*hg push*" `async' "hg" nil "push"))

;; 
(add-to-list 'auto-mode-alist '("hgrc" . conf-mode))
(add-to-list 'auto-mode-alist '(".hgrc" . conf-mode))
