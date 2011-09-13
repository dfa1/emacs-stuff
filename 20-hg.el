;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; mercurial 

;; automatically follow symlinks
(setq vc-follow-symlinks t)

;; use conf-mode for hg config files 
(add-to-list 'auto-mode-alist '("hgrc" . conf-mode))
(add-to-list 'auto-mode-alist '(".hgrc" . conf-mode))

;; push log
(defconst hg-log-buffer "*hg log*"
  "The name of hg log buffer ")

(defun hg-when-push-finish (process event)
  (if (equal event "finished\n")
      (message "push completed; see the buffer `%s'" hg-log-buffer)))

(defun mercurial-push-cwd () 		; TODO: write a generic function
  "Do a mercurial push of the current repository."
  (interactive)
  (message "pushing...")
  (generate-new-buffer hg-log-buffer)
  (set-process-sentinel 
   (vc-do-command hg-log-buffer `async' "hg" nil "push") 'hg-when-push-finish))

