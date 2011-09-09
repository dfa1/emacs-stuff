;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; My Keybindings
;;
;; Author    : Davide Angelocola <davide.angelocola@gmail.com>
;; Time-stamp: <2011-09-10 00:41:48 dfa>

(global-set-key [C-tab] 'next-buffer)

(global-set-key [M-f4] 'save-buffers-kill-emacs)
(global-set-key "\C-f" 'isearch-forward)
(define-key isearch-mode-map "\C-f" 'isearch-repeat-forward)
(global-set-key "\C-o" 'find-file)
(global-set-key "\C-s" 'save-buffer)
(global-set-key "\C-w" 'kill-this-buffer)

(global-unset-key "\C-x\C-l")
(global-set-key "\C-x\C-l" 'recenter)
(global-unset-key "\C-l")
(global-set-key "\C-l" 'goto-line)
(global-set-key "\C-xq" 'kill-other-buffers) ;; FIXME: use C-S-w, as in netbeans
(global-set-key "\C-b" 'ibuffer)

(global-set-key "\M-`" 'quick-calc)
(global-set-key "\M-1" 'man)
(global-set-key "\M-2" 'shell-command)
(global-set-key "\M-@" 'insert-shell-command-output)
(global-set-key "\M-3" 'indent-region)
(global-set-key "\M-4" 'locate)
(global-set-key "\M-5" 'highlight-regexp)
(global-set-key "\M-6" 'unhighlight-regexp)
(global-set-key (kbd "C-SPC") 'dabbrev-expand)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; mapping function keys

(global-set-key [f1] 'info)
(global-set-key [f2] 'bash-maybe)  ;; defined in 22-bash.el
(global-set-key [f3] 'slime-maybe) ;; defined in 42-clojure.el
(global-set-key [f4] 'erc-maybe)
(global-set-key [f5] 'insert-date)
(global-set-key [f6] 'insert-time)
(global-set-key [f7] 'insert-time-and-date)
(global-set-key [f8] 'insert-name-and-email)
(global-set-key [f9] 'insert-gpl-header)
(global-set-key [f10] 'man-local)
(global-set-key [f12] 'recentf-open-files)

;; my commands
(global-set-key "\M-7" 'column-ruler)
(global-set-key (kbd "<home>") 'back-to-indentation-or-beginning)

(global-set-key "\M-9" 'decrement-number-at-point)
(global-set-key (kbd "<home>") 'back-to-indentation-or-beginning)
(global-set-key "\M-7" 'column-ruler)
(global-set-key "\M-0" 'increment-number-at-point)
(global-set-key "\M-9" 'decrement-number-at-point)

;; netbeans-like keybindings
(global-set-key [C-S-down]
		'(lambda () 
		   (interactive)
		   (if (region-active-p)
		       (clone-region)
		     (clone-line-below))))

(global-set-key [C-S-up] 
		'(lambda () 
		   (interactive)
		   (if (region-active-p)
		       (clone-region)
		     (clone-line-above))))

;; defined in 20.hg.el
(global-set-key "\C-xvp" 'mercurial-push-cwd)

