;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; mercurial configuration 
;;
;; Author    : Davide Angelocola <davide.angelocola@gmail.com>
;; Time-stamp: <2011-09-13 00:23:08 dfa>

;; automatically follow symlinks
(setq vc-follow-symlinks t)

(defun mercurial-push-cwd () 		; TODO: write a generic function
  "Do a mercurial push of the current repository."
  (interactive)
  (with-output-to-temp-buffer "*hg push*"
    (vc-do-command "*hg push*" `async' "hg" nil "push")))

;; use conf-mode for hg config files 
(add-to-list 'auto-mode-alist '("hgrc" . conf-mode))
(add-to-list 'auto-mode-alist '(".hgrc" . conf-mode))
